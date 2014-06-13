
$ = jQuery

gate = $ 'form.eloqua-form'

if not gate.length
    return

moreTag = gate.parent().find('[id^=more-]')
if moreTag.parent('p').length
    moreTag = moreTag.parent()

# Hide everything after the more tag, and show the form in its place
gated = $ '<div>'
gated.addClass 'gated'
gated.hide()
moreTag.nextUntil(gate).detach().appendTo gated

moreTag.after gated

# Populate hidden fields from querystring
querystring = location.search.substring 1
qsargs = {}
for q in querystring.split '&'
    parts = q.split '='
    if parts.length == 2
        qsargs[parts[0]] = parts[1]

gate.find(':input[data-qsarg]').each (i, el) ->
    el = $ el
    arg = el.data 'qsarg'
    if arg of qsargs
        el.val qsargs[arg]

gate.on 'submit', ->
    $this = $ this

    if 'checkValidity' of this and not this.checkValidity()
        return false

    # Forms are submitted via an iframe so that cookies can be set propertly
    # Eloqua doesn't set CORS headers so AJAX doesn't work

    unlockAsset true

unlockAsset = (autoDownload) ->
    gate.slideUp()

    gated.slideDown()

    if autoDownload
        asset = gated.find 'a'
        embed = gated.find 'embed, iframe'
        if asset.length == 1 and embed.length == 0
            window.open asset.prop('href'), '_blank'

# This function gets automatically called for every Eloqua data lookup.
# It needs to do multiple things, so we rely on the call order to switch behavior
lookupNum = 0
window.SetElqContent = ->
    switch lookupNum
        when 0 then lookupEloquaData()
        when 1 then hideFilledFields()

    lookupNum++

lookupEloquaData = ->
    email = GetElqContentPersonalizationValue 'V_ElqEmailAddress'
    lookupValue = "<C_EmailAddress>#{ email }</C_EmailAddress>"
    _elqQ.push ['elqDataLookup', 'b25edf2517d04bea9ecdc4866011e11e', lookupValue]
    localStorage.setItem("elqVEmail", email)
    if localStorage.getItem("elqProg2") == null
        localStorage.setItem("elqProg2", "false")

hideFilledFields = ->
    if typeof GetElqCustomerGUID == 'function'
        guidField = gate.find ':input[name=elqCustomerGUID]'
        guidField.val GetElqCustomerGUID
    fieldQuery = ':input:visible:not([type=submit])'
    fields = gate.find fieldQuery
    fields.each (i, el) ->
        el = $ el
        apiName = el.data 'api-name'
        if value = GetElqContentPersonalizationValue apiName
            if el.prop('name') == 'emailAddress'
                el.val value
            else
                el.remove()

    if gate.find(fieldQuery).length <= 1
        unlockAsset false

# Start lookup of already filled in Eloqua fields
_elqQ.push ['elqDataLookup', 'b518cf2c082d458d86faa124f333c9f2', '']
_elqQ.push ['elqGetCustomerGUID']
