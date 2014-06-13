
$(document).ready(function () {
    $(".btn-info").click(function (e) {
       // e.preventDefault();
        console.log("click download");
        $("#elqForm").submit();
    });

    $(".eventon_list_event .no_events").parent().parent().prev().hide();
    $(".eventon_list_event .no_events").parent().parent().hide();

    if (querystring('sbj') == "customerservice") {
        $('#formsubject').prop('selectedIndex', 1);
        $("#formcustomer").show();
    }

});
