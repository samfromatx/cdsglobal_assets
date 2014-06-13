
$ = jQuery

filterElements = $ '.resource-filter:not(.inline) select'

filters = {}
filterResources = ->
    filterElements.each () ->
        $this = $ this

        type = $this.prop 'name'
        filter = $this.val()

        if filter
            filters[type] = filter

    href = location.pathname.replace /page\/\d+\//, ''
    if query = $.param filters
        href += '?' + query
    location.href = href

filterElements.on 'change', filterResources

# Handles inline filtering on solution and industry pages

more_button = $ '.resources ~ .pagination a'
more_resources = $ '.resources.more'

more_button.on 'click', ->
    if more_resources.length
        more_button.parents('.pagination').hide()
        more_resources.slideDown()
        false

filter = $ '.resource-filter.inline select'
filter.on 'change', ->
    value = filter.val()

    # Once filtering has started remove the more button and show everything
    $('.pagination').hide()
    $('.resources.more').show()

    all_resources = $('.resource')

    if value
        all_resources.hide()
        all_resources.filter(".#{ value }").show()
    else
        all_resources.show()

