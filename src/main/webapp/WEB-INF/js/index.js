function displayUserInfo() {
    $(".cart.box_1").mouseenter(function(){
        $("#user_info").css("display", "block");
    });

    $(".cart.box_1").mouseleave(function(){
        $("#user_info").css("display", "none");
    });
}

$(document).ready(function () {
    displayUserInfo();
});