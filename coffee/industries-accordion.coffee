$ = jQuery

accordion = $ '.industries'

panels = accordion.find 'dt'
panels.next('dd').hide()

r = Math.floor Math.random() * panels.length
picked = panels.slice r, r + 1
picked.addClass 'active'
picked.next('dd').show()

panels.find('a').click ->
    $this = $ this

    target = $this.parent()

    if not target.hasClass 'active'
        panels.removeClass 'active'
        panels.next('dd').slideUp 'fast'

        target.addClass 'active'
        target.next('dd').slideDown 'fast'

    false
