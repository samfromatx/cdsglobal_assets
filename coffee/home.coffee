
$ = jQuery

container = $ '.home .features'
container.append '<div class="gutter">'

container.masonry
    itemSelector: '.widget'
    gutter: '.gutter'
    transitionDuration: 0

carousel = $ '.home .banner'
carouselItems = carousel.find '.item'
carouselDefaultHeight = null

shrinkHomeBanners = ->
    windowWidth = $(window).width()

    carouselItems.each ->
        el = $ this
        contentWidth = el.data 'content-width'

        containerSizeRatio = carouselDefaultHeight / contentWidth

        contents = el.find 'img'
        imageSizeRatio = contents.attr('height') / contents.attr('width')

        if windowWidth < contentWidth
            el.height windowWidth * containerSizeRatio
        else
            el.height carouselDefaultHeight

        height = el.height()
        width = height / imageSizeRatio
        contents.height height
        contents.width height / imageSizeRatio
        contents.css 'left', -1 * (width - windowWidth) / 2 + 'px'

carousel.owlCarousel
    navigation: true
    slideSpeed: 300
    paginationSpeed: 400
    singleItem: true
    navigation: false
    afterInit: ->
        carouselDefaultHeight = carousel.height()
        shrinkHomeBanners()
    autoPlay: 10000
    stopOnHover: true

carousel.find('.item').on 'click', ->
    carousel.trigger 'owl.next'

$(window).on 'resize', shrinkHomeBanners
