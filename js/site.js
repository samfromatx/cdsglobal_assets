
$(document).ready(function () {
    $(".btn-info").click(function (e) {
        //e.preventDefault();
        if ($("#elqForm").is(":hidden"))  {
            console.log("click download");
            $("#elqForm").submit();
        }
    });

    $(".eventon_list_event .no_events").parent().parent().prev().hide();
    $(".eventon_list_event .no_events").parent().parent().hide();

    if (querystring('sbj') == "customerservice") {
        $('#formsubject').prop('selectedIndex', 1);
        $("#formcustomer").show();
    }

    $('.contact').submit(function(){
        if ($('input#website').val().length != 0) {
            //console.log("You are a bot. Bye!")
            return false;
        } else if (($('input#formfirstName').val().indexOf("http://") != -1) || ($('input#formfirstName').val().indexOf("https://") != -1)) {
            return false;
        }
    });

});
