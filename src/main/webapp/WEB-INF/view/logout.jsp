<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
    <head>
        <title>logout</title>
    </head>
    <body>
        <h4>Logout Successfully!</h4>
        <br>
        <a href="${pageContext.request.contextPath }/login">Turn to login</a>
    </body>
</html>
