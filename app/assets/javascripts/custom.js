$(document).ready(function(){


	//===================================================//
	//================   Swiper Init   ==================//
	//===================================================//

	(function() {
		var mySwiper = new Swiper ('.intro-swiper', {
			autoplay: 3000,
			speed: 1500,
	    loop: true,
			spaceBetween: 10,
			effect: 'fade',
			fade: {
				crossFade: true
			}
	  });
		var chaletSwiper = new Swiper ('.chalet-swiper', {
			spaceBetween: 10,
			nextButton: '.swiper-button-next',
			prevButton: '.swiper-button-prev',
			autoplay: 3000,
			autoplayDisableOnInteraction: false,
			speed: 1000,
	  });
		var chaletSwiperThumbs = new Swiper ('.chalet-swiper-thumbs', {
			centeredSlides: true,
			slidesPerView: 'auto',
			touchRatio: 0.2,
			slideToClickedSlide: true,
			spaceBetween: 10,
			speed: 1000,
	  });
		chaletSwiper.params.control = chaletSwiperThumbs;
	  chaletSwiperThumbs.params.control = chaletSwiper;
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

	(function() {

		var $tm = TweenMax
		var iconTween = $tm.staggerFrom($(".band .col-xs-4"), 2, { x: -100, opacity: 0, ease: Power2.easeOut }, 0.2)
		var parallaxAnim = $tm.to($('.parallax-anim'), 1, { y: '35%', ease: Power1.easeInOut });
		var logoSvg = new TimelineMax()
						.to($('#line-mountain'), 2, { strokeDashoffset: 0, delay: 1 })
						.to($('#line-roof'), 2, { strokeDashoffset: 0 }, "-=1.5")
						.from($('.white-mountain'), 2, { opacity: 0 }, "-=1.5")
						.from($('.blue-mountain'), 2, { opacity: 0 }, "-=1.5")
						.from($('.edelweiss'), 2, { opacity: 0, rotation: 720, transformOrigin: '51% 58%', scale: 0 }, "-=2.5")
						.from($('.blue-white-mountain'), 2, { opacity: 0 }, "-=2")
						.to($('#line-mountain, #line-roof, .white-mountain, .blue-mountain'), 1, { opacity: 0 }, "-=1.75")
						.from($('.logo-text-1'), 2, { opacity: 0, x: -100, ease: Power3.easeOut }, "-=2")
						.from($('.logo-text-2'), 2, { opacity: 0, x: 100, ease: Power3.easeOut }, "-=1.5")


		var parallaxBg = new TimelineMax()
							.from($(".bg-p1"), 2, { scale: 1.2, y: 200 })
							.from($(".bg-p2"), 2, { scale: 1.8, y: -200 }, "-=2")

		var animController = new ScrollMagic.Controller();

		var iconScene = new ScrollMagic.Scene({ triggerElement: '.band', offset: -100 })
							.setTween(iconTween)
		 					.addTo(animController);

		var parallaxScene = new ScrollMagic.Scene({ triggerElement: '.parallax-anim', duration: '80%', triggerHook: 1 })
							.setTween(parallaxAnim)
							.addTo(animController)

		var parallaxBgScene = new ScrollMagic.Scene({ triggerElement: '.anim-background', duration: '80%', triggerHook: 0.5 })
							.setTween(parallaxBg)
							.addTo(animController)

		$(window).scroll(function() {
			if($(window).scrollTop() >= 70 ) {
				$tm.to($('.anim-nav'), 1, {  opacity: 1 });
			} else {
				$tm.to($('.anim-nav'), 1, {  opacity: 0 });
			}
			if($(window).scrollTop() >= 1000) {
				$tm.to($('#home-section-1'), 0.1, { opacity: 0 });
			} else {
				$tm.to($('#home-section-1'), 0.1, { opacity: 1 });
			}
		});

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
	//===================   Gmaps   =====================//
	//===================================================//

	(function() {
		if(window.location.pathname === '/') {
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
		}
	})();

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
		$("#sortable_horizontal").sortable({
			axis: 'x',
			update: function() {
				$.post($(this).data("update-url"), $(this).sortable('serialize'))
			}
		});
		// $("#sortable_appartment").sortable({
		// 	axis: 'y',
		// 	update: function() {
		// 		$.post($(this).data("update-url"), $(this).sortable('serialize'))
		// 	}
		// });
		// $("#sortable_week").sortable({
		// 	axis: 'x',
		// 	update: function() {
		// 		$.post($(this).data("update-url"), $(this).sortable('serialize'))
		// 	}
		// });
		$(".sortable").sortable({
			update: function() {
				$.post($(this).data("update-url"), $(this).sortable('serialize'))
			}
		});

		// dropzone
		Dropzone.autoDiscover = false;
		$(".dropzone").dropzone({
		 maxFilesize: 20,
		 paramName: "picture[chalet_picture]",
		 params: { house_id: location.search.split('house_id=')[1] },
		 addRemoveLinks: false,
		 dictDefaultMessage: "<p class='lead'>You can Drag and Drop or Click to upload pictures</p>",
		 // success: function() { $(".games_edit_memo_div").load(location.href+" .games_edit_memo_div>*",""); },
		 // queuecomplete: function() { window.location.href = "/admins/games_memo_card"; }
	 });
	})();

});
