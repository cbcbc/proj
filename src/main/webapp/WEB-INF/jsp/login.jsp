<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath }/login" method="POST">
        账号：<input type="text" name="username">
        <br><br>
        密码：<input type="password" name="password">
        <br><br>
        <input type="submit" value="登录">
    </form>
</body>
</html>
