
$ = jQuery

searchForm = $ '.search'
field = searchForm.find 'input'

field.on 'focus', ->
    searchForm.addClass 'open'

field.on 'blur', ->
    searchForm.removeClass 'open'
