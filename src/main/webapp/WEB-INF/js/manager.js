function commitUser() {
    $("#commit_user").submit(function () {
        if($("#password").val() != $(".password_confirm").val()) {
            $(".confirm_error").text("  两次密码输入必须一致");
            $("#add_user_success").text("");
            $("#username_error").text("");
            $(".mail_address_error").text("");
            return false;
        }

        var username = $("#add_username").val();
        if(username == null || username.indexOf("\'") != -1 || username.indexOf("\"") != -1 || username.indexOf("‘") != -1 || username.indexOf("“") != -1 || username.indexOf("’") != -1 || username.indexOf("”") != -1 || username.trim() == ""){
            $("#username_error").text(" 账号不能包含引号或者为空!");
            $(".confirm_error").text("");
            $("#add_user_success").text("");
            $(".mail_address_error").text("");
            return false;
        }

        var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(!myreg.test($("#add_mail").val())) {
            $(".mail_address_error").text(" 请输入有效的邮箱地址！");
            $("#username_error").text("");
            $(".confirm_error").text("");
            $("#add_user_success").text("");
            return false;
        }

        return true;
    });
}

function commitCommodity() {
    $("#commit_commodity").submit(function () {
        var storage = $("#storage").val();
        if (isNaN(storage) || storage % 1 !=0 || storage < 0 || storage > 100) {
            $("#storage_error").text(" 商品库存只能是0到100的整数！");
            $("#price_error").text("");
            $("#discount_error").text("");
            $("#add_commodity_success").text("");
            return false;
        }

        var price = $("#price").val();
        if (isNaN(price) || price < 0) {
            $("#price_error").text(" 商品价格只能是正数！");
            $("#storage_error").text("");
            $("#discount_error").text("");
            $("#add_commodity_success").text("");
            return false;
        }

        var discount = $("#discount").val();
        if (isNaN(discount) || discount < 0 || discount > 1) {
            $("#discount_error").text(" 商品折扣只能是0到1的数！");
            $("#storage_error").text("");
            $("#price_error").text("");
            $("#add_commodity_success").text("");
            return false;
        }

        return true;
    });
}

function updateUser() {
    $("#update_user_form").submit(function () {
        if($.trim($("#update_nickname").val()) == "") {
            $("#nickname_error").text("  昵称不能为空！");
            $(".mail_address_error").text("");
            return false;
        }

        var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        var personalMail = $("#personal_mail").val();
        if(personalMail != "" && !myreg.test(personalMail)) {
            $(".mail_address_error").text(" 请输入有效的邮箱地址！");
            $("#nickname_error").text("");
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

function displayCommodityCategory() {
    var selected = $("#category_hidden").val();
    $(".add_commodity_select").find("option[value = '" + selected + "']").attr("selected", "selected");
}

$(document).ready(function () {
    commitUser();
    updateUser();
    updatePassword();
    updatePasswordConfirm();
    commitCommodity();
    displayCommodityCategory();
});