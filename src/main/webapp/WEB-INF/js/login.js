function validateUsername() {
    $("form").submit(function(){
        var username = $("#username").val();
        if(username == null || username.indexOf("\'") != -1 || username.indexOf("\"") != -1 || username.indexOf("‘") != -1 || username.indexOf("“") != -1 || username.indexOf("’") != -1 || username.indexOf("”") != -1 || username.trim() == ""){
            $("#errorMessage").text("账号不能包含引号或者为空!");
            $("#username").val("");
            $("#password").val("");
            return false;
        }
    });
}

$(document).ready(function () {
    validateUsername();
});