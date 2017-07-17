function displayUserInfo() {
    $(".cart.box_1").mouseenter(function(){
        $("#user_info").css("display", "block");
    });

    $(".cart.box_1").mouseleave(function(){
        $("#user_info").css("display", "none");
    });
}

function displayUserType() {
    var t_length = $("#manager_table tr").length - 1;
    for(var i=0; i<t_length; i++){
        var selected = $("#manager_hidden" + i).val();
        $("#manager_select" + i).find("option[value = '" + selected + "']").attr("selected", "selected");
    }
}

function displayDeleteButton() {
    var t_length = $("#manager_table tr").length - 1;
    for(var i=0; i<t_length; i++){
        if($.trim($("#is_delete" + i).text()) == "已删除")
            $("#delete_user" + i).hide();
    }
}

function deleteUser(i) {
    $("#delete_user" + i).click(function () {
        if(window.confirm('您确定要删除该用户吗？')) {
            var pageId = $(".current_page").text() - 1;
            var userId = $("#user_id" + i).val();
            window.location.href = "delete-user?pageId=" + pageId + "&userId=" + userId;
        }
    });
}

function updateUserRoleType(i) {
    $("#update_user" + i).click(function () {
        var pageId = $(".current_page").text() - 1;
        var userId = $("#user_id" + i).val();
        var roleType = $("#manager_select" + i + " option:selected").val();
        window.location.href = "update-user?pageId=" + pageId + "&userId=" + userId + "&roleType=" + roleType;
    });
}

function addUser() {
    $(".add_user_btn").click(function () {
        window.location.href = "add-user";
    });
}

$(document).ready(function () {
    displayUserInfo();
    displayUserType();
    for (var i=0; i<10; i++) {
        deleteUser(i);
        updateUserRoleType(i);
    }
    displayDeleteButton();
    addUser();
});