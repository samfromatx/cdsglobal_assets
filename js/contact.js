// Generated by CoffeeScript 1.7.1
(function() {
  var $, getParameterByName, hearaboutus, secondLevel, subject, subjectQString;

  $ = jQuery;

  subject = $('.contact select[name="subject"]');

  secondLevel = $('.contact select[name="customer_service"]');

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

  subject.on('change', function() {
    if (subject.val() === 'Customer Service') {
      return secondLevel.show();
    } else {
      secondLevel.val('');
      return secondLevel.hide();
    }
  });

  hearaboutus = $('.contact input[name="inboundOriginator1"]');

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
    $this.after('<p>Thank you for your submission.</p>').slideDown();
    return $this.slideUp();
  });

  if (subjectQString === 'demo' || subjectQString === 'quote') {
    hearaboutus.show();
    hearaboutus.attr('required', 'true');
    hearaboutus.attr('aria-required', 'true');
  }

}).call(this);


//# sourceMappingURL=contact.map
