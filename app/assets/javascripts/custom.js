var panorama;
function initialize() {
	panorama = new google.maps.StreetViewPanorama(
  	document.getElementById('street-view'),
   	{
     position: {lat: 45.9775559, lng: 6.9276951},
     pov: {heading: 0, pitch: 0},
     zoom: 1,
    //  scrollwheel: false,
     fullscreenControl: false
   	});
}

function inPortrait() {
	if($(window).width() < $(window).height()) {
		return true
	} else {
		return false
	}
}

function introAnim() {
	var max = ($(window).width() + 500)
	var min = ( $(window).width() - $(window).width() - 500)
	var introAnim = new TimelineMax({ repeat: -1 })
					.to('#line-mountain', 2, { strokeDashoffset: 0 })
					.to('#line-roof', 2, { strokeDashoffset: 0 }, "-=1.5")
					.from('.white-mountain', 2, { opacity: 0 }, "-=1.5")
					.from('.blue-mountain', 2, { opacity: 0 }, "-=1.5")
					.from('.edelweiss', 2, { opacity: 0, rotation: 720, transformOrigin: '51% 58%', scale: 0 }, "-=2.5")
					.from('.blue-white-mountain', 1, { opacity: 0 }, "-=2")
					.to('#line-mountain, #line-roof, .white-mountain, .blue-mountain', 1, { opacity: 0 }, "-=1.75")
					.from('.logo-text-1', 2, { opacity: 0, x: -100, ease: Power3.easeOut }, "-=2")
					.from('.logo-text-2', 2, { opacity: 0, x: 100, ease: Power3.easeOut }, "-=1.5")
					.to('.blue-white-mountain, .edelweiss, .logo-text-1, .logo-text-2', 1, { opacity: 0 })
					.to('.intro-pic-1', 2, { opacity: 0 }, "-=1")
					.from('.intro-pic-2', 2, { opacity: 0 }, "-=1")
					.from(".pool-text-first", 2, { opacity: 0, x: -200, ease: Power4.easeOut }, "-=1")
					.from(".pool-text-second", 2, { opacity: 0, x: 200, ease: Power4.easeOut }, "-=2")
					.to(".pool-text-first", 2, { opacity: 0, x: 200, ease: Power4.easeIn })
					.to(".pool-text-second", 2, { opacity: 0, x: -200, ease: Power4.easeIn }, "-=2")
					.to('.intro-pic-2', 2, { opacity: 0 }, "-=0.5")
					.from('.intro-pic-3', 2, { opacity: 0 }, "-=1")
					.fromTo(".skiin-text", 4, {  x: min }, { x: max }, "-=2")
					.fromTo(".skiout-text", 4, {  x: max }, { x: min }, "-=2")
					.to('.intro-pic-3', 2, { opacity: 0 }, "-=1.5")
					.from('.intro-pic-4', 2, { opacity: 0 }, "-=1")
					.staggerFrom([".treat-text", ".yourself-text", ".with-text"], 2, { opacity: 0, scale: 0, ease: Elastic.easeOut.config(2, 1) }, 0.4, "-=2")
					.to(".treat-text, .yourself-text, .with-text", 2, { rotationX: 1080, scale: 0, opacity: 0 })
					.from(".sauna-text", 2, { opacity: 0, scale: 0, ease: Elastic.easeOut.config(2, 1) }, "-=1")
					.to(".sauna-text", 1, { opacity: 0 })
					.to('.intro-pic-4', 2, { opacity: 0 }, "-=1")
					.from('.intro-pic-5', 2, { opacity: 0 }, "-=1")
					.from(".massage-text", 5, { opacity: 0 }, "-=1")
					.to(".massage-text", 1, { opacity: 0 })
					.to('.intro-pic-5', 2, { opacity: 0 }, "-=0.5");
};

function introAnimChalet() {
	var svgChaletNameLines = new TimelineMax()
						.to($(".svg-chalet-name .chalet-name-line-1"), 2, { strokeDashoffset: 0 })
						.to($(".svg-chalet-name .chalet-name-line-2"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-3"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-4"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-5"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-6"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-7"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-8"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-9"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-10"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-11"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-12"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-13"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-14"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-15"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".svg-chalet-name .chalet-name-line-16"), 2, { strokeDashoffset: 0 }, "-=2")
						.to($(".chalet-name-line"), 3, { fill: 'rgba(0, 0, 0,1)' }, "-=1");
}

$(window).load( function() {
	TweenMax.to('.preload', 1, { opacity: 0, zIndex: "-9999" });
	introAnim();
	introAnimChalet();
})

$(document).ready(function(){

	var preloaderImg = new TimelineMax({ repeat: -1 })
						.from($(".preload img"), 2, { scale: 0, opacity: 0 });
	// Remove StreetView layer to allow scroll
	(function() {

		$("#chalet-section-3").click(function() {
			$(".street-view-layer").remove();
		});

	})();

	//===================================================//
	//================   Swiper Init   ==================//
	//===================================================//

	(function() {
		var chaletSwiper = new Swiper ('.chalet-swiper', {
			spaceBetween: 10,
			// nextButton: '.swiper-button-next',
			// prevButton: '.swiper-button-prev',
			autoplay: 3000,
			autoplayDisableOnInteraction: false,
			speed: 1500,
	  });
		var chaletSwiperThumbs = new Swiper ('.chalet-swiper-thumbs', {
			centeredSlides: true,
			slidesPerView: 'auto',
			touchRatio: 0.2,
			slideToClickedSlide: true,
			spaceBetween: 10,
			speed: 1500,
	  });
		chaletSwiper.params.control = chaletSwiperThumbs;
	  chaletSwiperThumbs.params.control = chaletSwiper;
		var testimonySwiper = new Swiper ('.testimony-swiper', {
			centeredSlides: true,
			slidesPerView: 1,
			autoplay: 4000,
			spaceBetween: 500,
			speed: 1500,
			pagination: '.swiper-pagination',
			paginationClickable: true
	  });
	})();



	(function() {
		$('#picture-modal').on('show.bs.modal', function (event) {
		  var link = $(event.relatedTarget)
		  var recipient = link.data('img')
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		  var modal = $(this)
		  modal.find('.picture').attr('src', recipient)
		  // modal.find('.modal-body input').val(recipient)
		})
	})();




	//===================================================//
	//================   Animations   ===================//
	//===================================================//
	var $tm = TweenMax;
	var animController = new ScrollMagic.Controller();
	// $tm.to('.preload', 2, { opacity: 0 });
	// $tm.to('.preload', 0.1, { zIndex: "-9999", delay: 1.5 });

	// Simple Animation
	(function() {
		var iconTween = $tm.staggerFrom(".band .col-xs-4", 2, { x: -100, opacity: 0, ease: Power2.easeOut }, 0.2)



		var iconScene = new ScrollMagic.Scene({ triggerElement: '.band', offset: -100 })
							.setTween(iconTween)
		 					.addTo(animController);

		if(!inPortrait()) {
			var parallaxAnim = $tm.to('.parallax-anim, .chalet-bg', 2, { y: "30%" });
			var parallaxScene = new ScrollMagic.Scene({ triggerElement: '.parallax-anim', duration: '100%', triggerHook: 1 })
								.setTween(parallaxAnim)
								.addTo(animController);
		}



		if($(window).width() > 768) {
			$(window).scroll(function() {
				if($(window).scrollTop() >= 70 ) {
					$tm.to($('.anim-nav-home'), 1, {  opacity: 1 });
					$tm.to($('.anim-nav'), 1, {  backgroundColor: 'rgba(255, 255, 255, 1)' });
				} else {
					$tm.to($('.anim-nav-home'), 1, {  opacity: 0 });
					$tm.to($('.anim-nav'), 1, {  backgroundColor: 'rgba(255, 255, 255, 0)' });
				}
			});
		}

	})();

	// Intro Animation
	(function() {
	//Hide Intro Animations
	var hideIntroAnim = $tm.to($('#home-section-1'), 0.1, { opacity: 0 });

	var hideIntroAnimScene = new ScrollMagic.Scene({ triggerElement: '#home-section-2', offset: 500 })
						.setTween(hideIntroAnim)
						.addTo(animController);

	})();

	// Background Parallax Animation
	(function() {
		var parallaxBg = $.find('.parallax-bg-detected');

		parallaxBg.forEach(function(el, index) {
			var num = index + 1;
			if($(window).width() < 1000) {
				$(el).find('.anim-background').removeClass('bg-p0');
			}
			$(el).addClass('p-bg-' + num);
			var parallaxBg = new TimelineLite()
								.from($(el).find(".bg-p0"), 2, { x: 200 })
								.from($(el).find(".bg-p1"), 2, { scale: 1.2, y: 200 }, "-=2")
								.from($(el).find(".bg-p2"), 2, { scale: 1.8, y: -200 }, "-=2");

			var parallaxBgScene = new ScrollMagic.Scene({ triggerElement: '.p-bg-' + num, duration: '100%', triggerHook: 1 })
								.setTween(parallaxBg)
								.addTo(animController);
		});

	})();

	// SVG Mountain lines/Arrow
	(function() {

		var svgMountainLines = new TimelineLite()
							.to($(".img-mountains-line .line-1"), 2, { strokeDashoffset: 0 })
							.to($(".img-mountains-line .line-2"), 2, { strokeDashoffset: 0 }, "-=2")
							.to($(".img-mountains-line .line-3"), 2, { strokeDashoffset: 0 }, "-=2")
							.to($(".img-mountains-line .line-4"), 2, { strokeDashoffset: 0 }, "-=2")
							.from($(".img-mountains-name"), 2, { opacity: 0 }, "-=1.5");

		var svgMountainLinesScene = new ScrollMagic.Scene({ triggerElement: '#home-section-2', duration: '50%', triggerHook: 0.5 })
							.setTween(svgMountainLines)
							.addTo(animController);
	})();


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



	//===================================================//
	//===================   Admin   =====================//
	//===================================================//

	(function() {
		// Date Picker Init
		$('.datepicker').datepicker({
			autoclose: true,
			orientation: "bottom auto",
			format: 'dd/mm/yyyy'
		});

		// jQuery-ui sortable for admin
		$(".sortable_horizontal").sortable({
			axis: 'x',
			update: function() {
				$.post($(this).data("update-url"), $(this).sortable('serialize'))
			}
		});
		$(".sortable").sortable({
			update: function() {
				$.post($(this).data("update-url"), $(this).sortable('serialize'))
			}
		});

		// dropzone
		Dropzone.autoDiscover = false;
		$(".dropzone-picture").dropzone({
			 maxFilesize: 20,
			 paramName: "picture[chalet_picture]",
			 params: { house_id: location.search.split('house_id=')[1] },
			 addRemoveLinks: false,
			 dictDefaultMessage: "<p class='lead'>You can Drag and Drop or Click to upload pictures</p>",
			 // success: function() { $(".games_edit_memo_div").load(location.href+" .games_edit_memo_div>*",""); },
			 // queuecomplete: function() { window.location.href = "/admins/games_memo_card"; }
	 	});
		$(".dropzone-floor-plan").dropzone({
			 maxFilesize: 20,
			 paramName: "floor_plan[floor_plan_image]",
			 params: { house_id: location.search.split('house_id=')[1] },
			 addRemoveLinks: false,
			 dictDefaultMessage: "<p class='lead'>You can Drag and Drop or Click to upload floor plans</p>",
			 // success: function() { $(".games_edit_memo_div").load(location.href+" .games_edit_memo_div>*",""); },
			 // queuecomplete: function() { window.location.href = "/admins/games_memo_card"; }
	 	});
	})();

	//===================================================//
	//===================   Gmaps   =====================//
	//===================================================//

	(function() {
			//Google map Init
			var handlerPandaClub = Gmaps.build('Google');
			var handlerSkiRental = Gmaps.build('Google');
			var handlerRestaurant = Gmaps.build('Google');
			var handlerTransport = Gmaps.build('Google');
			var handlerOther = Gmaps.build('Google');

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
					zoom: 16,
					center: new google.maps.LatLng(45.977974, 6.927758)
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

			handlerTransport.buildMap({
				provider: {
					zoom: 9,
					center: new google.maps.LatLng(46.081597, 6.557132)
				},
				internal: {id: 'map_transport' }}, function() {
					var markers = handlerTransport.addMarkers([
					{lat: 45.977618, lng: 6.927604, infowindow: "<h1>Chalets Hideaway</h1><p>117 Chemin des Carterons, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=home|000000", width: 40, height: 40} },
					{lat: 45.982024, lng: 6.926358, infowindow: "<h1>Argentière Train Station</h1><p>84 Rue Charlet Straton, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=train|F55A51", width: 40, height: 40}},
					{lat: 46.236924, lng: 6.108985, infowindow: "<h1>Geneva International Airport</h1><p>Route de l'Aéroport 21, 1215 Le Grand-Saconnex, Switzerland</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=airport|F55A51", width: 40, height: 40}},
					]);
				});

			handlerOther.buildMap({
				provider: {
					zoom: 11,
					center: new google.maps.LatLng(45.958201, 6.906720)
				},
				internal: {id: 'map_other' }}, function() {
					var markers = handlerOther.addMarkers([
					{lat: 45.977618, lng: 6.927604, infowindow: "<h1>Chalets Hideaway</h1><p>117 Chemin des Carterons, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=home|000000", width: 40, height: 40} },
					{lat: 45.942802, lng: 6.888795, infowindow: "<h1>Golf de Chamonix</h1><h3>Golf</h3><p>Les Praz de Chamonix, 35 route du golf, 74400 Chamonix-Mont-Blanc, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=glyphish_golf|F55A51", width: 40, height: 40}},
					{lat: 45.968156, lng: 6.913432, infowindow: "<h1>Tennis des Îles</h1><h3>Tennis</h3><p>Les Iles, 74400 Argentiere, France</p>", picture:{url: "http://chart.apis.google.com/chart?chst=d_map_pin_icon_withshadow&chld=sport|F55A51", width: 40, height: 40}},
					]);
				});


			$("#click_tab_panda_club").click(function() {
				$(".map").css({"opacity": 0, "z-index" : -1});
				$("#map").css({"opacity": 1, "z-index" : 1});
			});


			$("#click_tab_ski_rental").click(function() {
				$(".map").css({"opacity": 0, "z-index" : -1});
				$("#map_ski_rental").css({"opacity": 1, "z-index" : 1});
			});

			$("#click_tab_restaurant").click(function() {
				$(".map").css({"opacity": 0, "z-index" : -1});
				$("#map_restaurant").css({"opacity": 1, "z-index" : 1});
			});

			$("#click_tab_transport").click(function() {
				$(".map").css({"opacity": 0, "z-index" : -1});
				$("#map_transport").css({"opacity": 1, "z-index" : 1});
			});

			$("#click_tab_other").click(function() {
				$(".map").css({"opacity": 0, "z-index" : -1});
				$("#map_other").css({"opacity": 1, "z-index" : 1});
			});

	})();

});
