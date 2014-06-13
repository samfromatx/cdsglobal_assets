
if Modernizr.csspointerevents
    return

$ = jQuery

dropdown = $ '.dropdown'

dropdown.on 'click', (e) ->
    $this = $ this
    if e.offsetX < $this.width() - 30
        return true

    select = $this.find 'select'
    select.one 'blur', ->
        $(this).attr 'size', 1
    select.attr 'size', select.find('option').length
    select.focus()

    false
