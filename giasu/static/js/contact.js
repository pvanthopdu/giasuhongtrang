/* JS Document */

$(document).ready(function () {

    removeActive();
    $(".m_contact").addClass("active");
    localStorage.setItem("active", "contact");
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

    //contact
    var $regexPhone = /^0[0-9]{9}$/;
    var is_phone = false;
    $(".phone_contact").on('keypress keydown keyup', function () {
        if (!$(this).val().match($regexPhone)) {
            $(".alert-danger").removeClass("d-none");
            $(".alert-danger").text("Nhập số điện thoại hợp lệ");
        } else {
            $(".alert-danger").addClass("d-none");
            is_phone = true;
            $("#submit_contact").removeAttr("disabled")
        }
    });

});