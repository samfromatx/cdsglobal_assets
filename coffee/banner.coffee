
$ = jQuery

banner = $ '.banner img'

if not banner.length
    return

isHomePage = $('body.home').length > 0

# Assumes all the banners are the same size
bannerWidth = banner.width()

setBannerPosition = ->
    # The homepage manages this itself
    if isHomePage
        return

    windowWidth = $(window).width()

    if windowWidth < 1000
        windowWidth = 1000

    banner.each  ->
        $el = $ this
        $el.css 'left', -1 * (bannerWidth - windowWidth) / 2 + 'px'

$(window).on 'resize', setBannerPosition

setBannerPosition()
