$(document).ready(function () {
    var update = setInterval(function () {
        $("#firstname").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
        $("#lastname").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
        $("#birthday").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
        $("#gender").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
        $("#image").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
        $("#location").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
        $("#email").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
        $("#major").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
        $("#infor").change(function () {
            $(".btn-update").removeAttr("disabled");
        });
    }, 1000);

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

    //compare password1 and password2
    function checkpass() {
        var password1 = $("#passord1").val();
        var password2 = $("#passord2").val();
        if (password1 == "") {
            $("#passord1").focus();
            return false;
        }
        else if (password2 == "") {
            $("#passord2").focus();
            return false;
        }
        else {
            if (password1 == password2) {
                return true;
            }
            else {
                return false;
            }
        }
    }

    $("#change-password-button").click(function () {
        var password = $("#passord1").val();
        var csrftoken = getCookie('csrftoken');
        if (checkpass()) {
            $.ajax({
                headers: {"X-CSRFToken": csrftoken},
                url: '/accounts/cpwd/',
                data: {
                    'password': password,
                },
                type: 'POST',
                dataType: 'json',
                success: function (data) {
                    if (data.status == true) {
                        $("#change-password").modal("hide");
                        var message_tag = "<div class='alert alert-dismissible message'>" +
                            "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                            "<strong>" + data.messages + "</strong></div>";

                        $(".super_container").append(message_tag);
                        setTimeout(function () {
                            $(".message").fadeToggle(2000, function () {
                                $(this).remove();
                            });
                        }, 3000);
                    }
                }
            })
        }
    });

    //user register course
    $(".btn-register").click(function () {
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
                if (data.status == true) {
                    $("#registry_Course_User").modal("hide");
                    var message_tag = "<div class='alert alert-dismissible message'>" +
                        "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                        "<strong>" + data.messages + "</strong></div>";

                    $(".super_container").append(message_tag);
                    setTimeout(function () {
                        $(".message").fadeToggle(2000, function () {
                            $(this).remove();
                        });
                    }, 6000);
                }
            }
        });
    });

    //check group name
    var group_invailed = false;
    $("#add-group-name").on('keypress keydown keyup', function () {
        var group_name = $(this).val();
        $.ajax({
            url: '/ajax/validate_group_name',
            data: {
                'group_name': group_name
            },
            dataType: 'json',
            success: function (data) {
                if (data.enableadd) {
                    $("#error").removeClass("alert alert-danger");
                    $("#error").text("");
                    group_invailed = true;
                }
                else {
                    $("#error").addClass("alert alert-danger");
                    $("#error").text(data.message);
                    group_invailed = false;
                }
            }

        });
    });
    //get value select mutichoice
    $(".btn-add-group").click(function () {
        var student_group = [];
        $("input[name='member']").each(function () {
            if ($(this).is(':checked')) {
                var checked = ($(this).val());
                student_group.push(checked);
            }
        });
        student_group = student_group.join(',');
        //get day
        var day_calendar = [];
        $("input[name='day-calendar-group']").each(function () {
            day_calendar.push($(this).val())
        });
        day_calendar = day_calendar.join(',');
        //get time start
        var time_start = [];
        $("input[name='time-start']").each(function () {
            time_start.push($(this).val())
        });
        time_start = time_start.join(',');
        //get time end
        var time_end = [];
        $("input[name='time-end']").each(function () {
            time_end.push($(this).val())
        });
        time_end = time_end.join(',');

        var group_name = $("#add-group-name").val();
        var belong_course_id = $("#group-belong-course").val();
        var csrftoken = getCookie('csrftoken');
        $.ajax({
            headers: {"X-CSRFToken": csrftoken},
            url: '/courses/add_group_course',
            data: {
                'group_name': group_name,
                'belong_course_id': belong_course_id,
                'student_group': student_group,
                'day_calendar': day_calendar,
                'time_starts': time_start,
                'time_ends': time_end
            },
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                location.reload();
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

    //add calendar group in form add group
    var num_calendar_of_add = 0;
    $(".btn-add-calendar").click(function () {
        if (num_calendar_of_add == 0) {
            $(".calendar-group").removeClass("d-none");
        }
        var html_add = "<div class='row add-calendar-group pt-2'>\
                            <input class='col-md-3 form-control' type='date'\
                                   name='day-calendar-group' id='day-calendar-group'>\
                            <div class='col-md-4'>\
                                <div class='input-group'>\
                                    <div class='input-group-prepend'>\
                                        <span class='input-group-text'>\
                                            <i class='far fa-clock'> </i> Start</span>\
                                    </div>\
                                    <input type='time' class='form-control' name='time-start'>\
                                </div>\
                            </div>\
                            <div class='col-md-4'>\
                                <div class='input-group time-end'>\
                                    <div class='input-group-prepend'>\
                                        <span class='input-group-text'>\
                                            <i class='far fa-clock'> </i> End</span>\
                                    </div>\
                                    <input type='time' class='form-control' name='time-end'>\
                                </div>\
                            </div>\
                            <div class='col-md-1 btn-delete-calendar'><i class='far fa-trash-alt'></i></div>\
                        </div>";
        $(".calendar-group").append(html_add);
        //remove calendar group
        $(".btn-delete-calendar").click(function () {
            var parent = $(this).parent();
            parent.remove();
            num_calendar_of_add--;
            if (num_calendar_of_add == 0) {
                $(".calendar-group").addClass("d-none");
            }
        })
        num_calendar_of_add++;
    });

    // add student group into student paticipation of day leared
    $("input[name='student_of_group']").change(function () {
        var student_id = $(this).val();
        var key = $(this).data('key');
        if ($(this).is(":checked")) {
            var student_name = $.trim($(this).parent().text());
            var html_add_student_impl = "<div class='col-sm-6' id='impl-" + key + "-" + student_id + "'>\
                                            <div class='form-check'>\
                                                <label class='form-check-label title-member-course'>\
                                                    <input type='checkbox'\
                                                           class='form-check-input'\
                                                           value='" + student_id + "'\
                                                           name='student_impl_group'>\
                                                    " + student_name + "\
                                                </label>\
                                            </div>\
                                        </div>";
            $(".student-impl-container-" + key).append(html_add_student_impl);
        } else {
            $("div").remove("#impl-" + key + "-" + student_id);
        }
    });

    //hiden button add-group until the fields in form invaled
    var enable_add = setInterval(function () {
        var day_invaled = true;
        var start_invaled = true;
        var end_invaled = true;
        $("input[name='day-calendar-group']").each(function () {
            var day = $(this).val();
            if (day == "") {
                day_invaled = false;
                $(this).focus();
                return false;
            }
        });
        $("input[name='time-start']").each(function () {
            var start = $(this).val();
            if (start == "") {
                start_invaled = false;
                return false;
            }
        });
        $("input[name='time-end']").each(function () {
            var end = $(this).val();
            if (end == "") {
                end_invaled = false;
                return false;
            }
        });
        if (group_invailed && day_invaled && start_invaled && end_invaled) {
            $(".btn-add-group").removeAttr("disabled");
        } else {
            $(".btn-add-group").attr("disabled", "disabled");
        }
        //hiden or show button update

    }, 1000)


    $(".btn-delete-group").click(function () {
        var groupname = $(this).data('key');
        var coursename = $(this).data('expand');
        var link = $(this).attr('href');
        $("Strong#group-delete").each(function () {
            $(this).text(groupname);
        });
        $("Strong#course-of-group-delete").each(function () {
            $(this).text(coursename);
        });
        $("#link-delete-group").attr('href', link);
    });

    $(".link-teacher").click(function () {
        location.href = "#content-profile";
        //actice content teaching
        $(".tab").removeClass("active");
        $(".tab_panel").removeClass("active");
        $(".tab_panel_2").addClass("active");
        $(".tab-teaching").addClass("active");

    })
    "use strict";

    /*

     1. Vars and Inits

     */

    var header = $('.header');
    var menuActive = false;
    var menu = $('.menu');
    var burger = $('.hamburger');


    initTabs();
    initAccordions();
    initDropdowns();

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

    function initAccordions() {
        if ($('.accordion').length) {
            var accs = $('.accordion');

            accs.each(function () {
                var acc = $(this);

                if (acc.hasClass('active')) {
                    var panel = $(acc.next());
                    var panelH = panel.prop('scrollHeight') + "px";

                    if (panel.css('max-height') == "0px") {
                        panel.css('max-height', panel.prop('scrollHeight') + "px");
                    }
                    else {
                        panel.css('max-height', "0px");
                    }
                }

                acc.on('click', function () {
                    if (acc.hasClass('active')) {
                        acc.removeClass('active');
                        var panel = $(acc.next());
                        var panelH = panel.prop('scrollHeight') + "px";

                        if (panel.css('max-height') == "0px") {
                            panel.css('max-height', panel.prop('scrollHeight') + "px");
                        }
                        else {
                            panel.css('max-height', "0px");
                        }
                    }
                    else {
                        acc.addClass('active');
                        var panel = $(acc.next());
                        var panelH = panel.prop('scrollHeight') + "px";

                        if (panel.css('max-height') == "0px") {
                            panel.css('max-height', panel.prop('scrollHeight') + "px");
                        }
                        else {
                            panel.css('max-height', "0px");
                        }
                    }
                });
            });
        }
    }

    /*

     7. Init Dropdowns

     */

    function initDropdowns() {
        if ($('.dropdowns li').length) {
            var dropdowns = $('.dropdowns li');

            dropdowns.each(function () {
                var dropdown = $(this);
                if (dropdown.hasClass('has_children')) {
                    if (dropdown.hasClass('active')) {
                        var panel = $(dropdown.find('> ul'));
                        var panelH = panel.prop('scrollHeight') + "px";

                        if (panel.css('max-height') == "0px") {
                            panel.css('max-height', panel.prop('scrollHeight') + "px");
                        }
                        else {
                            panel.css('max-height', "0px");
                        }
                    }

                    dropdown.find(' > .dropdown_item').on('click', function () {
                        var panel = $(dropdown.find('> ul'));
                        var panelH = panel.prop('scrollHeight') + "px";
                        dropdown.toggleClass('active');

                        if (panel.css('max-height') == "0px") {
                            panel.css('max-height', panel.prop('scrollHeight') + "px");
                        }
                        else {
                            panel.css('max-height', "0px");
                        }
                    });
                }
            });
        }
    }

});