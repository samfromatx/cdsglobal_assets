
$ = jQuery

menuTrigger = $ '.menu-button'
pageContainer = $ '.container'
menu = $ 'body > nav'

menuTrigger.on 'click', ->
    pageContainer.toggleClass 'nav-open'
    menu.toggleClass 'active'

