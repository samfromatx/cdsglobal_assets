

$(document).ready(function() { 
	$('.attendease-nav > li:contains("Venues")').remove();
	$('.attendease-dates > li:contains("List all")').remove();

	updateBanner();
	$(window).resize(function() {
        updateBanner();
    });

	function updateBanner() {
      	
      	var $windowWidth = $(window).width();

		if ( $windowWidth < 860 ) {
			$('img.center-block').attr("src", "https://googledrive.com/host/0ByTWNHitQSjrSFFaSkxwRjhCblU/Preferred_showcase_web_banners_850.png");
			$('img.center-block').css( {"position":"relative","left":"0px","height":"auto","width":"100%"} );
			$('.event-marquee-foreground-image').css("height","auto");
		} else {
			$('img.center-block').attr("src", "https://googledrive.com/host/0ByTWNHitQSjrSFFaSkxwRjhCblU/Preferred_showcase_web_banner.png");
			//var $bannerWidth = $('img.center-block').width();
			//var $bannerHeight = $('img.center-block').height();
			var $bannerWidth = "1920";
			var $bannerHeight = "300"
			
			var $leftPosition = -1 * ($bannerWidth - $windowWidth) / 2
			if ($leftPosition > 0) {
				$leftPosition = 0;
			}
			
			$('img.center-block').css( {"position":"relative","left":$leftPosition+"px","height":$bannerHeight,"width":$bannerWidth} );
			$('.event-marquee-foreground-image').css("height",$bannerHeight);
		}
		
	}
	
});


