/* JS Document */

/******************************

 [Table of Contents]

 1. Vars and Inits
 2. Set Header
 3. Init Menu
 4. Init Header Search
 5. Init Home Slider
 6. Initialize Milestones


 ******************************/

$(document).ready(function () {
    localStorage.setItem("active", "home");

    var $regexPhone = /^0[0-9]{9}$/;
    var is_phone = false;
    var is_name = false;
    $("#phone_register").on('keypress keydown keyup', function () {
        if (!$(this).val().match($regexPhone)) {
            $(".alert-register").removeClass("d-none");
            $(".alert-register").text("Nhập số điện thoại hợp lệ");
        } else {
            $(".alert-register").addClass("d-none");
            is_phone = true;
        }
    });
    $("#name_register").on('keypress keydown keyup', function () {
        if ($(this).val() == "" || $(this).val().length < 3) {
            $(".alert-register").removeClass("d-none");
            $(".alert-register").text("Vui lòng nhập họ và tên");
        } else {
            $(".alert-register").addClass("d-none");
            is_name = true;
        }
    });

    //function process register the course of anonymous
    $(".counter_form_button").click(function () {
        var name_register = $("#name_register").val();
        var phone_register = $("#phone_register").val();
        var course_register = $("#course_register").val();
        var msg_register = $("#msg_register").val();
        if (is_name == false) {
            $(".alert-register").removeClass("d-none");
            $(".alert-register").text("Vui lòng nhập họ và tên");
        } else if (is_phone == false) {
            $(".alert-register").removeClass("d-none");
            $(".alert-register").text("Vui lòng nhập số điện thoại");
        } else if (course_register == "") {
            $(".alert-register").removeClass("d-none");
            $(".alert-register").text("Vui lòng chọn khóa học");
        } else if (msg_register == "") {
            $(".alert-register").removeClass("d-none");
            $(".alert-register").text("Vui lòng nhập tin nhắn");
        } else {
            $.ajax({
                headers: {'X-CSRFToken': '{{csrf_token}}'},
                url: '/courses/course_register_temp/',
                data: {
                    'name_register': name_register,
                    'phone_register': phone_register,
                    'course_register': course_register,
                    'msg_register': msg_register
                },
                type: 'get',
                dataType: 'json',
                success: function (data) {
                    $("#registry_Course").modal("hide");
                    var message_tag = "<div class='alert alert-dismissible message'>" +
                        "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                        "<strong>" + data.messages + "</strong></div>";

                    $(".super_container").append(message_tag);
                    setTimeout(function () {
                        $(".message").fadeToggle(4000, function () {
                            $(this).remove();
                        });
                    }, 6000);
                }
            });
        }
    });
    //user register course
    $(".btn-user-register").click(function () {
        var course = $("#course-user-register").val();
        var csrftoken = getCookie('csrftoken');
        $.ajax({
            headers: {"X-CSRFToken": csrftoken},
            url: '/courses/user_register_course/',
            data: {
                'course': course,
            },
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                $("#registry_Course").modal("hide");
                var message_tag = "<div class='alert alert-dismissible message'>" +
                    "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                    "<strong>" + data.messages + "</strong></div>";

                $(".super_container").append(message_tag);
                setTimeout(function () {
                    $(".message").fadeToggle(4000, function () {
                        $(this).remove();
                    });
                }, 6000);
            }
        });
    });

    //click menu home
    $(".m_home").click(function () {
        removeActive();
        $(".m_home").addClass("active");
        localStorage.setItem("active", "home");
    });

    window.setTimeout(function () {
        $(".message").fadeToggle(5000, function () {
            $(this).remove();
        });
    }, 6000);

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

    //get cookie
    function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = cookies[i].trim();
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
    
    //form search display in size display small
    $(".btn-re-close").click(function () {
        $(".collapse").collapse('hide');
    });

    "use strict";

    /*

     1. Vars and Inits

     */

    var header = $('.header');
    var header_container = $('.header_container');
    var menuActive = false;
    var menu = $('.menu');
    var burger = $('.hamburger');
    var ctrl = new ScrollMagic.Controller();

    setHeader();

    $(window).on('resize', function () {
        setHeader();
    });

    $(document).on('scroll', function () {
        setHeader();
    });

    initMenu();
    initHeaderSearch();
    initHomeSlider();
    initMilestones();

    /*

     2. Set Header

     */

    function setHeader() {
        if ($(window).scrollTop() > 100) {
            header.addClass('scrolled');
            header_container.addClass('scrolled');
            menu.addClass('scrolled');
        }
        else {
            header.removeClass('scrolled');
            header_container.removeClass('scrolled');
            menu.removeClass('scrolled');
        }
    }

    /*

     3. Init Menu

     */

    function initMenu() {
        if ($('.menu').length) {
            var menu = $('.menu');
            if ($('.hamburger').length) {
                burger.on('click', function () {
                    if (menuActive) {
                        closeMenu();
                    }
                    else {
                        openMenu();

                        $(document).one('click', function cls(e) {
                            if ($(e.target).hasClass('menu_mm')) {
                                $(document).one('click', cls);
                            }
                            else {
                                closeMenu();
                            }
                        });
                    }
                });
            }
        }
    }

    function openMenu() {
        menu.addClass('active');
        menuActive = true;
    }

    function closeMenu() {
        menu.removeClass('active');
        menuActive = false;
    }

    /*

     4. Init Header Search

     */

    function initHeaderSearch() {
        if ($('.search_button').length) {
            $('.search_button').on('click', function () {
                if ($('.header_search_container').length) {
                    $('.header_search_container').toggleClass('active');
                }
            });
        }
    }

    /*

     5. Init Home Slider

     */

    function initHomeSlider() {
        if ($('.home_slider').length) {
            var homeSlider = $('.home_slider');
            homeSlider.owlCarousel(
                {
                    items: 1,
                    loop: true,
                    autoplay: true,
                    nav: false,
                    dots: false,
                    smartSpeed: 1200
                });

            if ($('.home_slider_prev').length) {
                var prev = $('.home_slider_prev');
                prev.on('click', function () {
                    homeSlider.trigger('prev.owl.carousel');
                });
            }

            if ($('.home_slider_next').length) {
                var next = $('.home_slider_next');
                next.on('click', function () {
                    homeSlider.trigger('next.owl.carousel');
                });
            }
        }
    }

    /*

     6. Initialize Milestones

     */

    function initMilestones() {
        if ($('.milestone_counter').length) {
            var milestoneItems = $('.milestone_counter');

            milestoneItems.each(function (i) {
                var ele = $(this);
                var endValue = ele.data('end-value');
                var eleValue = ele.text();

                /* Use data-sign-before and data-sign-after to add signs
                 infront or behind the counter number */
                var signBefore = "";
                var signAfter = "";

                if (ele.attr('data-sign-before')) {
                    signBefore = ele.attr('data-sign-before');
                }

                if (ele.attr('data-sign-after')) {
                    signAfter = ele.attr('data-sign-after');
                }

                var milestoneScene = new ScrollMagic.Scene({
                    triggerElement: this,
                    triggerHook: 'onEnter',
                    reverse: false
                })
                    .on('start', function () {
                        var counter = {value: eleValue};
                        var counterTween = TweenMax.to(counter, 4,
                            {
                                value: endValue,
                                roundProps: "value",
                                ease: Circ.easeOut,
                                onUpdate: function () {
                                    document.getElementsByClassName('milestone_counter')[i].innerHTML = signBefore + counter.value + signAfter;
                                }
                            });
                    })
                    .addTo(ctrl);
            });
        }
    }

});