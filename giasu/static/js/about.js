/* JS Document */

$(document).ready(function()
{
    removeActive();
    $(".m_about").addClass("active");

    function removeActive() {
        var active = localStorage.getItem("active");
        if(active=="home"){
            $(".m_home").removeClass("active");
        }else if(active=="about"){
            $(".m_about").removeClass("active");
        }else if(active=="courses"){
            $(".m_course").removeClass("active");
        }else{
            $(".m_contact").removeClass("active");
        }
    }

    "use strict";

	/*

	1. Vars and Inits

	*/
	var ctrl = new ScrollMagic.Controller();


	initAccordions();
	initVideo();
	initPartnersSlider();


	/*

	6. Init Accordions

	*/

	function initAccordions()
	{
		if($('.accordion').length)
		{
			var accs = $('.accordion');

			accs.each(function()
			{
				var acc = $(this);

				if(acc.hasClass('active'))
				{
					var panel = $(acc.next());
					var panelH = panel.prop('scrollHeight') + "px";

					if(panel.css('max-height') == "0px")
					{
						panel.css('max-height', panel.prop('scrollHeight') + "px");
					}
					else
					{
						panel.css('max-height', "0px");
					}
					$(window).trigger('resize.px.parallax');
				}

				acc.on('click', function()
				{
					if(acc.hasClass('active'))
					{
						acc.removeClass('active');
						var panel = $(acc.next());
						var panelH = panel.prop('scrollHeight') + "px";

						if(panel.css('max-height') == "0px")
						{
							panel.css('max-height', panel.prop('scrollHeight') + "px");
						}
						else
						{
							panel.css('max-height', "0px");
						}
						$(window).trigger('resize.px.parallax');
					}
					else
					{
						acc.addClass('active');
						var panel = $(acc.next());
						var panelH = panel.prop('scrollHeight') + "px";

						if(panel.css('max-height') == "0px")
						{
							panel.css('max-height', panel.prop('scrollHeight') + "px");
						}
						else
						{
							panel.css('max-height', "0px");
						}
						$(window).trigger('resize.px.parallax');
					}
				});
			});
		}
	}

	/*

	6. Init Video

	*/

	function initVideo()
	{
		$(".vimeo").colorbox(
		{
			iframe:true,
			innerWidth:640,
			innerHeight:409,
			maxWidth: '90%'
		});
	}

	/*
	8. Init Partners Slider

	*/

	function initPartnersSlider()
	{
		if($('.partners_slider').length)
		{
			var partnersSlider = $('.partners_slider');
			partnersSlider.owlCarousel(
			{
				loop:true,
				autoplay:true,
				smartSpeed:1200,
				nav:false,
				dots:false,
				responsive:
				{
					0:
					{
						items:1
					},
					480:
					{
						items:2
					},
					720:
					{
						items:3
					},
					991:
					{
						items:4
					},
					1199:
					{
						items:6
					}
				}
			});
		}
	}

});