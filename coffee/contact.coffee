
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
    $this.after('<p>Thank you for your submission.</p>').slideDown()
    $this.slideUp()

if subjectQString == 'demo' or subjectQString == 'quote'
	hearaboutus.show()
	hearaboutus.attr('required', 'true')
	hearaboutus.attr('aria-required', 'true')