function commitUser() {
    $("#commit_user").submit(function () {
        if($("#password").val() != $("#password_confirm").val()) {
            $("#confirm_error").text("  两次密码输入必须一致");
            return false;
        }
        return true;
    });
}

/*function commitUser2() {
    $("#commit_user").click(function () {
        $.ajax({
            type: 'POST',
            url: "add-user",
            data: data,
            success: success,
            dataType: dataType
        });
    });
}*/

$(document).ready(function () {
    commitUser();
});