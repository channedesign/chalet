$(document).ready(function(){

	//Owl-Carousel init
	var owl = $('.owl-carousel');
	owl.owlCarousel({
	  	items: 1,
	  	loop: true,
	  	autoplay: true,
	  	autoplayTimeout: 3000,
	  	autoplayHoverPause: true,
	  	margin:10
	});
	//Owl-Carousel custom buttons
	$('.carousel_arrow_div_pic_left').click(function() {
    	owl.trigger('prev.owl.carousel');
	})
	$('.carousel_arrow_div_pic_right').click(function() {
    	owl.trigger('next.owl.carousel');
	})
	//Only show owl-carousel buttons on hover
	$(".owl_carousel_anchor").hover(function() {
		$(".carousel_arrow_div").show();
	}, function() {
		$(".carousel_arrow_div").hide();
	});
		
	   
  	//Scroll rules
	$(window).scroll(function() {   

	    var photoBackground = $('.photo_background').offset().top;
	    var homeMainContent = $('.home_main_content').offset().top;
	    var nav = $(".navbar");
	    //Nav animation
	    if ($(window).width() > 992) {
		    if (homeMainContent < (photoBackground + 450)) { 
		        nav.css({ opacity: 1 });
		    } else {
				nav.css({ opacity: 0 });
			};
			//Add nav fix
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
			nav.addClass("navbar-fixed-top");
			$('.home_main_content').addClass("margin_home_main_content");
			nav.removeClass("margin_nav");
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

