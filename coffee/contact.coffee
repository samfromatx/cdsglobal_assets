
$ = jQuery

subject = $ '.contact select[name="subject"]'
secondLevel = $ '.contact select[name="customer_service"]'

getParameterByName = (name) ->
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
  regex = new RegExp("[\\?&]" + name + "=([^&#]*)")
  results = regex.exec(location.search)
  (if not results? then "" else decodeURIComponent(results[1].replace(/\+/g, " ")))

subjectQString = getParameterByName('sbj');

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
        hearaboutus.attr('required', 'true')
        hearaboutus.attr('aria-required', 'true')
    else
        hearaboutus.val ''
        hearaboutus.hide()
        hearaboutus.removeAttr('required')
        hearaboutus.attr('aria-required', 'false')

$('.contact').on 'submit', ->
    $this = $ this
    $('#thankyou').slideDown()
    $('#contactinfo').slideUp()
    $this.slideUp()

if subjectQString == 'demo' or subjectQString == 'quote'
	hearaboutus.show()
	hearaboutus.attr('required', 'true')
	hearaboutus.attr('aria-required', 'true')

subjectUK = $ '.contact select[name="emailinquiry"]'

inquiryUK = $ '.contact select[name="salesInquiry"]'
businessname = $ '.contact input[name="bizname"]'
businesstype = $ '.contact input[name="biztype"]'
businessphone = $ '.contact input[name="phone"]'
countryUK = $ '.contact select[name="country"]'

businessname.hide()
businesstype.hide()
businessphone.hide()
countryUK.hide()
inquiryUK.hide()

subjectUK.on 'change', ->
    if subjectUK.val() == 'Sales'
        inquiryUK.show()
        inquiryUK.attr('required', 'true')
        inquiryUK.attr('aria-required', 'true')
        countryUK.show()
        countryUK.attr('required', 'true')
        countryUK.attr('aria-required', 'true')
        businessname.show()
        businessname.attr('required', 'true')
        businessname.attr('aria-required', 'true')
        businesstype.show()
        businessphone.show()
    else
        inquiryUK.val ''
        inquiryUK.hide()
        inquiryUK.removeAttr('required')
        inquiryUK.attr('aria-required', 'false')
        countryUK.val ''
        countryUK.hide()
        countryUK.removeAttr('required')
        countryUK.attr('aria-required', 'false')
        businessname.val ''
        businessname.hide()
        businessname.removeAttr('required')
        businessname.attr('aria-required', 'false')
        businesstype.val ''
        businesstype.hide()
        businessphone.val ''
        businessphone.hide()