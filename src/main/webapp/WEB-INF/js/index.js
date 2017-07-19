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
        if($.trim($("#is_delete" + i).text()) == "已删除") {
            $("#delete_user" + i).hide();
            $("#delete_commodity" + i).hide();
            $("#update_commodity" + i).hide();
            $("#update_user" + i).hide();
        }
    }
}

function deleteUser(i) {
    $("#delete_user" + i).click(function () {
        if(window.confirm('您确定要删除该项吗？')) {
            var pageId = $(".current_page").text() - 1;
            var userId = $("#user_id" + i).val();
            window.location.href = "manager/delete-user?pageId=" + pageId + "&userId=" + userId;
        }
    });
}

function updateUserRoleType(i) {
    $("#update_user" + i).click(function () {
        var pageId = $(".current_page").text() - 1;
        var userId = $("#user_id" + i).val();
        var roleType = $("#manager_select" + i + " option:selected").val();
        window.location.href = "manager/update-user?pageId=" + pageId + "&userId=" + userId + "&roleType=" + roleType;
    });
}

function addUser() {
    $(".add_user_btn").click(function () {
        window.location.href = "manager/add-user";
    });
}

function addCommodity() {
    $(".add_commodity_btn").click(function () {
        window.location.href = "seller/add-commodity";
    });
}

function deleteCommodity(i) {
    $("#delete_commodity" + i).click(function () {
        if(window.confirm('您确定要删除该项吗？')) {
            var pageId = $(".current_page").text() - 1;
            var commodityId = $("#commodity_id" + i).val();
            window.location.href = "seller/delete-commodity?pageId=" + pageId + "&commodityId=" + commodityId;
        }
    });
}

function updateCommodity(i) {
    $("#update_commodity" + i).click(function () {
        var commodityId = $("#commodity_id" + i).val();
        window.location.href = "seller/update-commodity?commodityId=" + commodityId;
    });
}

$(document).ready(function () {
    displayUserInfo();
    displayUserType();
    for (var i=0; i<10; i++) {
        deleteUser(i);
        updateUserRoleType(i);
        updateCommodity(i);
        deleteCommodity(i);
    }
    displayDeleteButton();
    addUser();
    addCommodity();
});