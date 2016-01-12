$(document).ready(function(){
	$('.owl-carousel').owlCarousel({
	  	items: 1,
	  	loop: true,
	  	autoplay: true,
	  	autoplayTimeout: 3000,
	  	autoplayHoverPause: true,
	  	margin:10
	 });

		
	   
  	
	$(window).scroll(function() {   

	    var photoBackground = $('.photo_background').offset().top;
	    var homeMainContent = $('.home_main_content').offset().top;
	    var nav = $(".navbar");
	    if ($(window).width() > 992) {
		    if (homeMainContent < (photoBackground + 450)) { 
		        nav.css({ opacity: 1 });
		    } else {
				nav.css({ opacity: 0 });
			};

			if (photoBackground > 450) {
				$('.home_main_content').addClass("margin_home_main_content");
				nav.addClass("navbar-fixed-top");
				nav.removeClass("margin_nav");
			} else {
				nav.removeClass("navbar-fixed-top");
				nav.addClass("margin_nav");
				$('.home_main_content').removeClass("margin_home_main_content");
			}
		} else {
			if (homeMainContent < (photoBackground + 450)) { 
		        nav.css({ opacity: 1 });
		    } else {
				nav.css({ opacity: 0 });
			};

			if (photoBackground > 300) {
				$('.home_main_content').addClass("margin_home_main_content");
				nav.addClass("navbar-fixed-top");
				nav.removeClass("margin_nav");
			} else {
				nav.removeClass("navbar-fixed-top");
				nav.addClass("margin_nav");
				$('.home_main_content').removeClass("margin_home_main_content");
			}
		}
	});

	//SmoothScrolling
	$(function() {
	  $('.smooth_scroll').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
		  var target = $(this.hash);
		  target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
		  if (target.length) {
			$('html,body').animate({
			  scrollTop: target.offset().top -50
			}, 1000);
			return false;
		  }
		}
	  });
	});

	

});

