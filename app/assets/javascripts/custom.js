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


	//Google map Init
	var handlerPandaClub = Gmaps.build('Google');
	var handlerSkiRental = Gmaps.build('Google');
	var handlerRestaurant = Gmaps.build('Google');

	function gMap(handler, zoomNum, centerNum, mapID, moreMarkers) {
		handler.buildMap({ 
		provider: {
			zoom: zoomNum,
			center: new google.maps.LatLng(centerNum)
		},
		internal: {id: mapID }}, function() {
			var markers = handler.addMarkers([
				{lat: 45.977618, lng: 6.927604, infowindow: "<h1>Chalets Hideaway</h1><p>117 Chemin des Carterons, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=home|000000", width: 40, height: 40}},
				moreMarkers
			]);
			
		});
	}

	

	handlerPandaClub.buildMap({ 
		provider: {
			zoom: 18,
			center: new google.maps.LatLng(45.977618, 6.927604)
		},
		internal: {id: 'map' }}, function() {
			var markers = handlerPandaClub.addMarkers([
			{lat: 45.977618, lng: 6.927604, infowindow: "<h1>Chalets Hideaway</h1><p>117 Chemin des Carterons, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=home|000000", width: 40, height: 40} },
			{lat: 45.978253, lng: 6.928390, infowindow: "<h1>Panda-Club</h1><h3>Children Ski School</h3><p>214 Chemin de la Glacière, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=ski|F55A51", width: 40, height: 40}},
			]);
			
		});

	handlerSkiRental.buildMap({ 
		provider: {
			zoom: 15,
			center: new google.maps.LatLng(45.979828, 6.926322)
		},
		internal: {id: 'map_ski_rental' }}, function() {
			var markers = handlerSkiRental.addMarkers([
			{lat: 45.977618, lng: 6.927604, infowindow: "<h1>Chalets Hideaway</h1><p>117 Chemin des Carterons, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=home|000000", width: 40, height: 40} },
			{lat: 45.984628, lng: 6.927215, infowindow: "<h1>Sportech</h1><h3>Ski Rental</h3><p>352 Rue Charlet Straton, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=shoppingbag|F55A51", width: 40, height: 40}},
			{lat: 45.978684, lng: 6.927316, infowindow: "<h1>Sanglard</h1><h3>Ski Rental</h3><p>98 chemin de la Glacière, 74400 Argentière, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=shoppingbag|F55A51", width: 40, height: 40}},
			{lat: 45.978270, lng: 6.926172, infowindow: "<h1>Sportech</h1><h3>Ski Rental</h3><p>56 Chemin de la Glacière, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=shoppingbag|F55A51", width: 40, height: 40}},
			
			]);
			
		});

	handlerRestaurant.buildMap({ 
		provider: {
			zoom: 16,
			center: new google.maps.LatLng(45.978217, 6.929755)
		},
		internal: {id: 'map_restaurant' }}, function() {
			var markers = handlerRestaurant.addMarkers([
			{lat: 45.977618, lng: 6.927604, infowindow: "<h1>Chalets Hideaway</h1><p>117 Chemin des Carterons, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=home|000000", width: 40, height: 40} },
			{lat: 45.978297, lng: 6.927679, infowindow: "<h1>L'Argentero</h1><h3>Restaurant</h3><p>180 Chemin de la Glacière, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=restaurant|F55A51", width: 40, height: 40}},
			{lat: 45.978214, lng: 6.926657, infowindow: "<h1>Les Marmottons</h1><h3>Restaurant</h3><p>56 Chemin de la Glacière, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=restaurant|F55A51", width: 40, height: 40}},
			{lat: 45.978458, lng: 6.935138, infowindow: "<h1>La Crèmerie du Glacier</h1><h3>Restaurant</h3><p>766 Chemin de la Glacière, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=restaurant|F55A51", width: 40, height: 40}},
			
			]);
			
		});

	
	$("#click_tab_ski_rental").click(function() {
		$(".map").css({"opacity": 0, "z-index" : -1});
		$("#map_ski_rental").css({"opacity": 1, "z-index" : 1});
	});

	$("#click_tab_panda_club").click(function() {
		$(".map").css({"opacity": 0, "z-index" : -1});
		$("#map").css({"opacity": 1, "z-index" : 1});
	});

	$("#click_tab_restaurant").click(function() {
		$(".map").css({"opacity": 0, "z-index" : -1});
		$("#map_restaurant").css({"opacity": 1, "z-index" : 1});
	});
});

