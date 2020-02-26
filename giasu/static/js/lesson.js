$(document).ready(function () {
    $("#button-practice").click(function () {
        //actice content practice
        $(".tab").removeClass("active");
        $(".tab_panel").removeClass("active");
        $(".tab-practice").addClass("active");
        $("#content-practice").addClass("active");
        // change button in tab navigate
        $("#button-content-lesson").removeClass("d-none");
        $("#button-test-lesson").removeClass("d-none");
        $("#button-course").addClass("d-none");
        $("#button-practice").addClass("d-none");
    });
    $("#button-content-lesson").click(function () {
        //actice content practice
        $(".tab").removeClass("active");
        $(".tab_panel").removeClass("active");
        $(".tab-content").addClass("active");
        $("#content-lesson").addClass("active");
        // change button in tab navigate
        $("#button-content-lesson").addClass("d-none");
        $("#button-test-lesson").addClass("d-none");
        $("#button-course").removeClass("d-none");
        $("#button-practice").removeClass("d-none");
    });
    $(".latest").click(function () {
        var url = $(this).attr("href");
        location.href = url;
    });
    $(".dropdown_item").click(function () {
        if ($(this).hasClass("active")) {
            $(this).removeClass("active");
        }
        else {
            $(this).addClass("active");
        }
    });
    //perform|destroy task do practice
    $(".btn-cancel-practice").click(function () {
        $(".collapse").collapse('hide');
    });
    $(".btn-submit-practice").click(function () {
        var answer = CKEDITOR.instances.id_answer.getData();
        var practice_id = $("#practice_id").text();
        var csrftoken = getCookie('csrftoken');
        $.ajax({
            headers: {"X-CSRFToken": csrftoken},
            url: '/courses/lessons/answerpractice/',
            data: {
                'answer': answer,
                'practice_id': practice_id
            },
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                if (data.status == true) {
                    $(".collapse").collapse('hide');
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

    initTabs();

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

});