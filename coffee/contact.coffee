
$ = jQuery

subject = $ '.contact select[name="subject"]'
secondLevel = $ '.contact select[name="customer_service"]'

secondLevel.hide()

subject.on 'change', ->
    if subject.val() == 'Customer Service'
        secondLevel.show()
    else
        secondLevel.val ''
        secondLevel.hide()

hearaboutus = $ '.contact input[name="inboundOriginator1"]'

hearaboutus.hide()

subject.on 'change', ->
    if subject.val() == 'Sales' || subject.val() == 'Demo' || subject.val() == 'Quote'
        hearaboutus.show()
    else
        hearaboutus.val ''
        hearaboutus.hide()

$('.contact').on 'submit', ->
    $this = $ this
    $this.after('<p>Thank you for your submission.</p>').slideDown()
    $this.slideUp()

if querystring("sbj") == "demo" || querystring("sbj") == "quote"
	$('.contact input[name="inboundOriginator1"]').show();
