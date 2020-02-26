
$(document).ready(function () {
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

    initTabs();

    /*

     5. Init Tabs

     */

    function initTabs() {
        if ($('.tab').length) {
            $('.tab').on('click', function () {
                $('.tab').removeClass('active');
                $(this).addClass('active');
                var clickedIndex = $('.tab').index(this);

                var panels = $('.tab_panel');
                panels.removeClass('active');
                $(panels[clickedIndex]).addClass('active');
            });
        }
    }

    /*

     6. Init Accordions

     */


});