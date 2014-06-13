$ = jQuery

elqVEmail = localStorage.getItem("elqVEmail")
elqProg2 = localStorage.getItem("elqProg2")

if (elqVEmail is "" or elqVEmail is null ) and ( elqProg2 is "false" or elqProg2 is "" or elqProg2 is null )
    $('#prog1').hide()
    $('#prog1 input, #prog1 select').each ->
        $(this).removeAttr('required')

    $('#prog2').hide()
    $('#prog2 input, #prog2 select').each ->
        $(this).removeAttr('required')

else if elqVEmail != "" && elqProg2 == "false"
    $('#prog2').hide()
    $("#prog2 input, #prog2 select, input[name='emailAddress']").each ->
        $(this).removeAttr('required')

else if elqVEmail != "" && elqProg2 == "true"
    $('#prog1').hide()
    $("#prog1 input, #prog1 select, input[name='emailAddress']").each ->
        $(this).removeAttr('required')

$( "#elqForm" ).submit (event) ->
    if elqVEmail isnt "" and elqProg2 is "false"
        localStorage.setItem("elqProg2", "true")

$('select[name="country"]').change ->
    if $(this).val() is 'CA'
        $('#GB').hide()
        $('#GB input').prop('required', false)
        $('#CA').show()
        $('#CA input').prop('required', true)
    else
        $('#CA').hide()
        $('#GB').hide()
        $('#CA input').prop('required', false)
        $('#GB input').prop('required', false)