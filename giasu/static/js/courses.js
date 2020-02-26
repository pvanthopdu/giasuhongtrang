/* JS Document */

$(document).ready(function()
{
	function removeActive() {
        var active = localStorage.getItem("active");
        if (active == "home") {
            $(".m_home").removeClass("active");
        } else if (active == "about") {
            $(".m_about").removeClass("active");
        } else if (active == "courses") {
            $(".m_course").removeClass("active");
        } else {
            $(".m_contact").removeClass("active");
        }
    }

    removeActive();
    $(".m_course").addClass("active");
    localStorage.setItem("active", "courses");


    //click lastest course
    $(".latest").click(function () {
       var url = $(this).attr("href");
       location.href = url;
    });

	"use strict";

	initColorbox();


	/*

	5. Init Colorbox

	*/

	function initColorbox()
	{
		if($('.gallery_item').length)
		{
			$('.colorbox').colorbox(
			{
				rel:'colorbox',
				photo: true,
				maxWidth: '90%'
			});
		}
	}

});