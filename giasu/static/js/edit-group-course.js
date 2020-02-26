/* JS Document */

$(document).ready(function () {
    var count_member = parseInt($("#count-member").text());
    var count_calendar = parseInt($("#count-calendar").text());
    var group_name_old = $("input[name='name']").val();
    var num_calendar_add = 0;

    $("input[name='name']").on('keypress keydown keyup', function () {
        var group_name_edit = $(this).val();

        if (group_name_edit != group_name_old) {
            $.ajax({
                url: '/ajax/validate_group_name',
                data: {
                    'group_name': group_name_edit
                },
                dataType: 'json',
                success: function (data) {
                    if (data.enableadd) {
                        $("#error-edit").removeClass("alert alert-danger");
                        $("#error-edit").text("");
                    }
                    else {
                        $("#error-edit").addClass("alert alert-danger");
                        $("#error-edit").text(data.message);
                        invaled_edit_name_group = false;
                    }
                }
            });
        } else {
            $("#error-edit").removeClass("alert alert-danger");
            $("#error-edit").text("");
        }
    });

    //add member into calendar learning when add member into group
    $("input[name='member']").change(function () {
        var member_id = $(this).val();
        var member_name = $(this).parent().text().trim();
        if ($(this).is(":checked")) {
            for (i = 0; i < count_calendar; i++) {
                var html_add = "<div class='col-sm-6 text-member'>\
                                    <label for='id_calendar-0-users_impled_" + count_member + "'>\
                                        <input type='checkbox'\
                                               name='calendar-" + i + "-users_impled'\
                                               value='" + member_id + "'\
                                               id='id_calendar-" + i + "-users_impled_" + count_member + "'>\
                                        " + member_name + "\
                                    </label>\
                                </div>";
                $(".member-impl-group-" + (i + 1)).append(html_add);
            }
        } else {
            for (i = 0; i < count_calendar; i++) {
                $(".text-member>label:contains('" + member_name + "')").parent().remove();
            }
        }
    });

    //add calendar into group course
    $(".btn-add-calendar").click(function () {
        num_calendar_add += 1;
        $("#add-calendar-group").removeClass("d-none");

        var calendar_total_form = parseInt($("input[id='id_calendar-TOTAL_FORMS']").val());
        $(".collapse").each(function () {
            $(this).removeClass("show");
        });
        $("input[id='id_calendar-TOTAL_FORMS']").attr('value', calendar_total_form + 1);
        var newform = $("#empty_form").children().clone(true).appendTo('.calendar-new-group');
        newform.find(".card-header").attr("href", "#calendar-" + calendar_total_form);
        newform.find(".collapse").attr("id", "calendar-" + calendar_total_form).addClass("show");
        newform.find(".collapse").attr("data-parent", "#add-calendar-group")
        newform.find(".title-day-group").text("#");
        newform.find("select").attr("name", "calendar-" + calendar_total_form + "-group_impl")
            .attr("id", "id_calendar-" + calendar_total_form + "-group_impl")
        newform.find("input").each(function () {
            var name = $(this).attr('name').replace('__prefix__', calendar_total_form);
            var id = 'id_' + name;
            $(this).attr({'name': name, 'id': id});
        });
        // $(".calendar-new-group").append($("#empty_form").html()
        //     .replace(/__prefix__/g, calendar_total_form));

    });

    //delete calendar add into calendar-group-course
    $(".btn-delete-calendar").click(function () {
        num_calendar_add = num_calendar_add - 1;
        $(this).parent().parent().remove();
        var card_calender = $(".card-calendar");
        $("input[id='id_calendar-TOTAL_FORMS']").attr('value', card_calender.length-1);
        for (var i = 0; i < card_calender.length; i++) {
            updateCalendar($(card_calender.get(i)), i);
        }
        if (num_calendar_add == 0) {
            $("#add-calendar-group").addClass("d-none");
        }
    })
    $("input[type='date']").change(function () {
        var name = $(this).attr("name").split("-");
        var href = "#" + name[0] + "-" + name[1];
        $(".card-header[href ='" + href + "']").children(":first").text(formatDate($(this).val()));
    })

    function updateCalendar(el, index) {
        var id_regex = new RegExp("calendar-(\\d+)");
        var replacement = "calendar-" + index;
        el.find("input").each(function () {
            var name = $(this).attr('name').replace(id_regex, replacement);
            var id = 'id_' + name;
            $(this).attr({'name': name, 'id': id});
        });
        el.find(".card-header").attr("href", "#calendar-" + index);
        el.find(".collapse").attr("id", "calendar-" + index);
    }

    function formatDate(date) {
        var strdate = date.split('-');
        return strdate[2] + '-' + strdate[1] + '-' + strdate[0];
    }
});