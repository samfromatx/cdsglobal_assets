
$ = jQuery

country = $ '.country select'

country.on 'change', ->
    $this = $ this
    countryUrl = $this.val()

    if countryUrl
        window.location = countryUrl
