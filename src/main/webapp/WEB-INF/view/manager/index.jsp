<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="E-SHOP, Bootstrap Web Templates" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>首页</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/index.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <!--top-header-->
        <div class="top-header">
            <div class="container">
                <div class="top-header-main">
                    <div class="col-md-6 top-header-left">
                        <div class="drop">
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-md-6 top-header-left">
                        <div class="cart box_1">
                            <a href="user-info">
                                <div class="total">
                                    <img src="images/user.png" />
                                    <span>${nickname}</span>&nbsp;&nbsp;- <span>${role_type}</span>
                                </div>
                            </a>
                            <div id="user_info">
                                <ul>
                                    <a href="user-info"><li class="personal">个人资料</li></a>
                                    <a href="logout"><li class="personal">退出</li></a>
                                </ul>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--top-header-->
        <!--start-logo-->
        <div class="logo">
            <a href="#"><h1>E-SHOP</h1></a>
        </div>
        <!--start-logo-->
        <!--manager-starts-->
        <div class="manager_module">
            <h3 class="ghj">用户管理</h3>
            <div class="add_user">
                <input class="add_user_btn" type="button" value="添加用户">
            </div>
            <table id="manager_table">
                <thead>
                <tr>
                    <th class="manager_table th">编号</th>
                    <th class="manager_table th">账号</th>
                    <th class="manager_table th">昵称</th>
                    <th class="manager_table th">角色类型及修改确认</th>
                    <th class="manager_table th">联系电话</th>
                    <th class="manager_table th">收货地址</th>
                    <th class="manager_table th">邮件地址</th>
                    <th class="manager_table th">状态</th>
                    <th class="manager_table th"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}" varStatus="status">
                    <tr>
                        <td class="manager_table">
                            ${status.index + startId}
                            <input id="user_id${status.index}" class="user_id" type="hidden" value="${user.id}">
                        </td>
                        <td class="manager_table">${user.username}</td>
                        <td class="manager_table">${user.nickname}</td>
                        <td class="manager_table">
                            <select class="manager_select" id="manager_select${status.index}" name="manager_select${status.index}">
                                <option value="0">普通用户</option>
                                <option value="1">供应商</option>
                                <option value="2">管理员</option>
                            </select>
                            <input class="manager_hidden" id="manager_hidden${status.index}" type="hidden" value="${user.roleType}">&nbsp;&nbsp;
                            <input id="update_user${status.index}" class="update_user" type="button" value="确认修改">
                        </td>
                        <td class="manager_table">${user.phoneNumber}</td>
                        <td class="manager_table">${user.address}</td>
                        <td class="manager_table">${user.mailAddress}</td>
                        <td class="manager_table" id="is_delete${status.index}">
                            <c:choose>
                                <c:when test="${user.isDelete == 1}">
                                    已删除
                                </c:when>
                                <c:otherwise>
                                    正常
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="manager_table"><input id="delete_user${status.index}" class="delete_user" type="button" value="删除用户"></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="pages">
                <ul>
                    <li class="page_select"><a href="admin-init?pageId=0">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    <li class="page_select">
                        <c:choose>
                            <c:when test="${pageId == 0}">
                                <a href="admin-init?pageId=${pageId }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="admin-init?pageId=${pageId-1 }">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="page_select">
                        <a href="admin-init?pageId=${pageId}" class="current_page">${pageId + 1}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </li>
                    <c:forEach begin="2" end="5" var="i">
                        <li class="page_select">
                            <c:choose>
                                <c:when test="${pageId + i <= pageNumbers}">
                                    <a href="admin-init?pageId=${pageId + i - 1}">${pageId + i}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                </c:when>
                            </c:choose>
                        </li>
                    </c:forEach>
                    <li class="page_select">
                        <c:choose>
                            <c:when test="${pageId==pageNumbers-1}">
                                <a href="admin-init?pageId=${pageId }">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="admin-init?pageId=${pageId+1 }">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="page_select"><a href="admin-init?pageId=${pageNumbers-1 }">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    <li class="page_select">共${pageNumbers}页</li>
                </ul>
            </div>
        </div>
        <div class="clearfix"> </div>
        <!--manager-end-->
        <!--footer-starts-->
        <div class="footer" style="margin-top: 30px">
            <div class="container">
                <div class="footer-top">
                    <div class="col-md-6 footer-left">
                    </div>
                    <div class="col-md-6 footer-right">
                        <p>Copyright &copy; 2015. CMB All rights reserved.</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--footer-end-->

        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
    </body>
</html>