/**
 * Created by pvantho on 12/21/2019.
 */
$(document).ready(function () {
    $(".btn-question-like").click(function () {
        var question_id = $(this).parent().attr('id');
        var csrftoken = getCookie('csrftoken');
        $.ajax({
            headers: {"X-CSRFToken": csrftoken},
            url: '/forum/questions/like',
            data: {
                'question_id': question_id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                var child = $("#" + question_id).find('.btn-question-like');
                child.empty();
                child.append('<i class="far fa-thumbs-up"></i>');
                child.append(' ' + data.likes);
            }
        });
        // window.alert("hihi");
    });
    $(".btn-answer-like").click(function () {
        var discussion_id = $(this).parent().attr('id');
        var csrftoken = getCookie('csrftoken');
        $.ajax({
            headers: {"X-CSRFToken": csrftoken},
            url: '/forum/discussion/like',
            data: {
                'discussion_id': discussion_id,
            },
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                var child = $("#" + discussion_id).find('.btn-answer-like');
                child.empty();
                child.append('<i class="far fa-thumbs-up"></i>');
                child.append(' ' + data.likes);
            }
        });
        // window.alert(answer_id);
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

    $(".custom-file-input").on("change", function () {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
});
