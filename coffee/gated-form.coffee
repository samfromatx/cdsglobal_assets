
$ = jQuery

gate = $ 'form.eloqua-form'
gateother = $ 'span.hideifungated'

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
    gateother.hide()

    gated.slideDown()

    if autoDownload
        asset = gated.find 'a'
        embed = gated.find 'embed, iframe'
        if asset.length == 1 and embed.length == 0
            window.open asset.prop('href'), '_blank'

# This function gets automatically called for every Eloqua data lookup.
# It needs to do multiple things, so we rely on the call order to switch behavior

# added 3 sec delay to give form enough time to load before checking for eloqua
callback = ->

    elqFunc = false
    lookupNum = 0
    console.log('before lookup')
    window.SetElqContent = ->
        console.log('inside lookup')
        elqFunc = true
        switch lookupNum
            when 0 then lookupEloquaData()
            when 1 then hideFilledFields()

        lookupNum++

    console.log('after lookup')

    lookupEloquaData = ->
        console.log('lookupEloquaData')
        email = GetElqContentPersonalizationValue 'V_ElqEmailAddress'
        lookupValue = "<C_EmailAddress>#{ email }</C_EmailAddress>"
        _elqQ.push ['elqDataLookup', 'b25edf2517d04bea9ecdc4866011e11e', lookupValue]
        if email == ''
        	$('#prog1').hide()
        	$('#prog1 input, #prog1 select').each ->
    	    	$(this).removeAttr('required')
        	$('#prog2').hide()
        	$('#prog2 input, #prog2 select').each ->
    	    	$(this).removeAttr('required')

    hideFilledFields = ->
        console.log('hideFilledFields')
        if typeof GetElqCustomerGUID == 'function'
            guidField = gate.find ':input[name=elqCustomerGUID]'
            guidField.val GetElqCustomerGUID
        fieldQuery = ':input:visible:not([type=submit])'
        fields = gate.find fieldQuery
        progZero = false
        progOne = false
        progTwo = false
        #$('#prog1').show()
        #$('#prog1 input, #prog1 select').each ->
            #$(this).attr('required')
        #$('#prog2').show()
        #$('#prog2 input, #prog2 select').each ->
            #$(this).attr('required')
        fields.each (i, el) ->
            #$('#prog1').show()
            #$('#prog2').show()
            el = $ el
            apiName = el.data 'api-name'
            progStage = el.data 'prog-stage'
            if value = GetElqContentPersonalizationValue apiName
                if el.prop('name') == 'emailAddress'
                    el.val value
                    console.log(el.prop('name')+'-'+progStage)
                    #console.log(gate.find(fieldQuery).length)
                else
                    el.remove()
                    #console.log(el.prop('name')+'-'+progStage)
                    #console.log(gate.find(fieldQuery).length)
            else
                console.log(progStage)
                if progStage == 'prog0'
                    progZero = true
                else if progStage == 'prog1'
                    #console.log('prog1'+el.prop('name')+'-'+progStage)
                    progOne = true
                else if progStage == 'prog2'
                    #console.log('prog2'+el.prop('name')+'-'+progStage)
                    progTwo = true
        if progZero
            $('#prog2').hide()
            $('#prog2 input, #prog2 select').each ->
                $(this).removeAttr('required')
            $('#prog1').hide()
            $('#prog1 input, #prog1 select').each ->
                $(this).removeAttr('required')
        else if progOne
            $('#prog1').show()
            $('#prog1 input, #prog1 select').each ->
                $(this).attr('required')
            $('#prog2').hide()
            $('#prog2 input, #prog2 select').each ->
                $(this).removeAttr('required')
        else if progTwo and not progOne
            $('#prog2').show()
            $('#prog2 input, #prog2 select').each ->
                $(this).attr('required')
            $('#prog1').hide()
            $('#prog1 input, #prog1 select').each ->
                $(this).removeAttr('required')

        if gate.find(fieldQuery).length <= 1
            unlockAsset false

    # Start lookup of already filled in Eloqua fields
    console.log('elq.push')
    _elqQ.push ['elqDataLookup', 'b518cf2c082d458d86faa124f333c9f2', '']
    _elqQ.push ['elqGetCustomerGUID']

setTimeout callback, 3000

#if !elqFunc
#if document.cookie.indexOf('ELQSTATUS') >= 0
    #console.log('elqFunc')
    #$('#prog1').hide()
	#$('#prog1 input, #prog1 select').each ->
    	#$(this).removeAttr('required')
	#$('#prog2').hide()
	#$('#prog2 input, #prog2 select').each ->
    	#$(this).removeAttr('required')
