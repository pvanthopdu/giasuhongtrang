/* JS Document */

$(document).ready(function () {
    $(".add-calendar").click(function () {
        var day = $(this).data('key');
        $("input[type='date']").val(day);
    });

    //choice group
    $(".select-group").change(function () {
        var group_selected = $(this).val();
        if (group_selected != '0') {
            $(".btn-add-group").removeAttr("disabled");
            $.ajax({
                headers: {'X-CSRFToken': '{{csrf_token}}'},
                url: '/course/getmember',
                data: {
                    'group_id': group_selected
                },
                type: 'get',
                dataType: 'json',
                success: function (data) {
                    $(".member-group").empty();
                    var len = data.members.length;
                    for (var i = 0; i < len; i++) {
                        var member = data.members[i];
                        var html_add = '<div class="col-sm-6 text-member">' +
                            '<label>' +
                            '<input type="checkbox" name="users_impled" ' +
                            'value="' + member['id'] + '"' +
                            'id="id_users_impled"> ' + member['value'] +
                            '</label></div>';
                        $(".member-group").append(html_add);
                    }
                }
            });
        }else {
             $(".btn-add-group").attr("disabled", "disabled");
        }
    })
    function formatDate(date) {
        var strdate = date.split('-');
        return strdate[2] + '-' + strdate[1] + '-' + strdate[0];
    }

});