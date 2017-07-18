function commitUser() {
    $("#commit_user").submit(function () {
        if($("#password").val() != $(".password_confirm").val()) {
            $(".confirm_error").text("  两次密码输入必须一致");
            $("#add_user_success").text("");
            $("#username_error").text("");
            return false;
        }
        return true;
    });
}

function updateUser() {
    $("#update_user_form").submit(function () {
        if($.trim($("#update_nickname").val()) == "") {
            $("#nickname_error").text("  昵称不能为空！");
            return false;
        }
        return true;
    });
}

function updatePassword() {
    $("#update_password_btn").click(function () {
        window.location.href = "update-password";
    });
}

function updatePasswordConfirm() {
    $("#update_password_form").submit(function () {
        if($("#up_password").val() != $(".password_confirm").val()) {
            $(".confirm_error").text("  两次密码输入必须一致");
            $("#update_password_success").text("");
            $("#old_password_error").text("")
            return false;
        }
        return true;
    });
}

$(document).ready(function () {
    commitUser();
    updateUser();
    updatePassword();
    updatePasswordConfirm();
});