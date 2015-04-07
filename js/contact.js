// Generated by CoffeeScript 1.8.0
(function() {
  var $, businessname, businessphone, businesstype, countryUK, getParameterByName, hearaboutus, inquiryUK, magTitle, secondLevel, subject, subjectQString, subjectUK;

  $ = jQuery;

  subject = $('.contact select[name="subject"]');

  secondLevel = $('.contact select[name="customer_service"]');

  magTitle = $('.contact input[name="CustomerService_Publication"]');

  getParameterByName = function(name) {
    var regex, results;
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
    results = regex.exec(location.search);
    if (results == null) {
      return "";
    } else {
      return decodeURIComponent(results[1].replace(/\+/g, " "));
    }
  };

  subjectQString = getParameterByName('sbj');

  secondLevel.hide();

  magTitle.hide();

  subject.on('change', function() {
    if (subject.val() === 'Customer Service') {
      secondLevel.show();
      return magTitle.show();
    } else {
      secondLevel.val('');
      secondLevel.hide();
      magTitle.val('');
      return magTitle.hide();
    }
  });

  if (subjectQString === 'customerservice') {
    secondLevel.show();
    magTitle.show();
  }

  hearaboutus = $('.contact #forminboundOriginator');

  hearaboutus.hide();

  subject.on('change', function() {
    if (subject.val() === 'Sales' || subject.val() === 'Demo' || subject.val() === 'Quote') {
      hearaboutus.show();
      hearaboutus.attr('required', 'true');
      return hearaboutus.attr('aria-required', 'true');
    } else {
      hearaboutus.val('');
      hearaboutus.hide();
      hearaboutus.removeAttr('required');
      return hearaboutus.attr('aria-required', 'false');
    }
  });

  $('.contact').on('submit', function() {
    var $this;
    $this = $(this);
    $('#thankyou').slideDown();
    $('#contactinfo').slideUp();
    return $this.slideUp();
  });

  if (subjectQString === 'demo' || subjectQString === 'quote' || subjectQString === 'sales') {
    hearaboutus.show();
    hearaboutus.attr('required', 'true');
    hearaboutus.attr('aria-required', 'true');
  }

  subjectUK = $('.contact select[name="emailinquiry"]');

  inquiryUK = $('.contact select[name="salesInquiry"]');

  businessname = $('.contact input[name="bizname"]');

  businesstype = $('.contact input[name="biztype"]');

  businessphone = $('.contact input[name="phone"]');

  countryUK = $('.contact select[name="country"]');

  businessname.hide();

  businesstype.hide();

  businessphone.hide();

  countryUK.hide();

  inquiryUK.hide();

  subjectUK.on('change', function() {
    if (subjectUK.val() === 'Sales') {
      inquiryUK.show();
      inquiryUK.attr('required', 'true');
      inquiryUK.attr('aria-required', 'true');
      countryUK.show();
      countryUK.attr('required', 'true');
      countryUK.attr('aria-required', 'true');
      businessname.show();
      businessname.attr('required', 'true');
      businessname.attr('aria-required', 'true');
      businesstype.show();
      return businessphone.show();
    } else {
      inquiryUK.val('');
      inquiryUK.hide();
      inquiryUK.removeAttr('required');
      inquiryUK.attr('aria-required', 'false');
      countryUK.val('');
      countryUK.hide();
      countryUK.removeAttr('required');
      countryUK.attr('aria-required', 'false');
      businessname.val('');
      businessname.hide();
      businessname.removeAttr('required');
      businessname.attr('aria-required', 'false');
      businesstype.val('');
      businesstype.hide();
      businessphone.val('');
      return businessphone.hide();
    }
  });

}).call(this);
