


(function($) {

    'use strict';

    function toggleMenu(state) {
      if(state == "on") {
        $('#navigations').slideDown();
        $('body').addClass('maun-open');
      } else if(state == "off") {
        $('#navigations').slideUp();
        $('body').removeClass('maun-open');
      }
    }

    function checkNavbarState() {
      var nav_header_distance = $("#topnav").offset().top - $(".home-title").offset().top;
      let distance = 0;
      if ( $(window).width() > 1023) {
        distance = -125;
      }      
      else if ( $(window).width() > 424) {
        distance = -10;
      }
      else if ( $(window).width() > 374) {
        distance = 13;
      }
      else if ( $(window).width() > 319) {
        distance = 47;
      }
      if (nav_header_distance >= distance) {
        if(!$(".sticky").hasClass("darkheader")) {
          $(".sticky").addClass("darkheader");

          toggleMenu("off");
        }
      } else {
        if($(".sticky").hasClass("darkheader")) {
          $(".sticky").removeClass("darkheader");
          $("#navigations").removeClass('show-menu');
          $('#navigations').removeAttr('style')

          if ($(window).width() >= 992) {
            toggleMenu("on");
          } else {
            toggleMenu("off");
          }
        }
      }
      var nav_searchbar_distance = $("#topnav").offset().top - $("#search-bar").offset().top;
      if (nav_searchbar_distance >= -110) {
        if($("#search-bar").css("visibility") === "visible") {
          $("#search-bar").css("visibility", "hidden");
          $(".searchbar .form-on-scroll").show();
        }
      } else if (nav_searchbar_distance < -110) {
        if($("#search-bar").css("visibility") === "hidden" || $(".searchbar .form-on-scroll").is(":visible")) {
          $("#search-bar").css("visibility", "visible");
          $(".searchbar .form-on-scroll").hide();
        }
      }

      var nav_searchbar_distance = $("#topnav").offset().top - $("#search-bar").offset().top;
      if (nav_searchbar_distance >= -110 && $(window).width() >= 320 && $(window).width() <= 768) {
        if($("#search-bar").css("visibility") === "visible") {
          $("#search-bar").css("visibility", "hidden");
          $(".searchbar .form-on-scroll").show();
        }
      } else if (nav_searchbar_distance < -110 && $(window).width() >= 320 && $(window).width() <= 768) {
        if($("#search-bar").css("visibility") === "hidden" || $(".searchbar .form-on-scroll").is(":visible")) {
          $("#search-bar").css("visibility", "visible");
          $(".searchbar .form-on-scroll").hide();
        }
      }
    }

    function initNavbarStickey() {
        $(window).scroll(function() {
          checkNavbarState();
        });
    }

    function initSmoothLink() {
        $('.navigation-menu a').on('click', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top - 0
            }, 1500, 'easeInOutExpo');
            event.preventDefault();
        });
    }
    function initDropdownMenu() {
        $(document).on('click',".darkheader .dropdown", function(event) {
          //event.preventDefault();
          $(this).toggleClass("sub-menu-opened");
        });
    }
    /*
    function initNavbarToggler() {
      var scroll = $(window).scrollTop();
      $('.navbar-toggle').on('click', function(event) {
        $(this).toggleClass('open');
        $('#navigations').slideToggle(400);
      });
      $('.navigation-menu>li').slice(-2).addClass('last-elements');
    }
    */

    function initScrollspy() {
      $("#navigations").scrollspy({ offset: 70 });
    }

    function init() {
      initNavbarStickey();
      checkNavbarState();
      //initSmoothLink();
      //initNavbarToggler();
      initScrollspy();
      initDropdownMenu()
    }
    init();

})(jQuery)
