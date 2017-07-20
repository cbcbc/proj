<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="E-SHOP, Bootstrap Web Templates" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>个人资料</title>

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
                                    <shiro:hasRole name="0">
                                        <a href="#"><li class="personal">查看订单</li></a>
                                    </shiro:hasRole>
                                    <shiro:hasRole name="1">
                                        <a href="#"><li class="personal">处理订单</li></a>
                                    </shiro:hasRole>
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
            <shiro:hasRole name="0">
                <a href="ordinaryuser-init?pageId=0&category=(1,2,3,4,0)"><h1>E-SHOP</h1></a>
            </shiro:hasRole>
            <shiro:hasRole name="1">
                <a href="seller-init?pageId=0"><h1>E-SHOP</h1></a>
            </shiro:hasRole>
            <shiro:hasRole name="2">
                <a href="admin-init?pageId=0"><h1>E-SHOP</h1></a>
            </shiro:hasRole>
        </div>
        <!--start-logo-->
        <!--addUser-starts-->
        <div style="margin-top: 50px; margin-left: 30px">
            <h3 class="ghj">个人资料</h3>
            <div>
                <form action="update-user-info" method="post" id="update_user_form" onsubmit="return updateUser()">
                    <div>
                        <span>角色类型：</span>
                        <input name="role_type" type="text" value="${role_type}" readonly><br />
                        <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span>
                        <input id="update_nickname" name="nickname" type="text" value="${nickname}">
                        <span id="nickname_error" style="color: red"></span><br />
                        <span>联系电话：</span><input name="phone_number" type="text" value="${phone_number}"><br />
                        <shiro:hasRole name="0">
                            <span>收货地址：</span><input name="address" type="text" value="${address}"><br />
                        </shiro:hasRole>
                        <shiro:hasRole name="1">
                            <span>发货地址：</span><input name="address" type="text" value="${address}"><br />
                        </shiro:hasRole>
                    </div>
                    <div>
                        <span>用&nbsp;&nbsp;户&nbsp;&nbsp;名：</span><input name="username" type="text" value="${username}" readonly><br />
                        <span>电子邮箱：</span><input id="personal_mail" name="mail_address" type="text" value="${mail_address}"><span class="mail_address_error" style="color: red"></span><br />
                        <span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</span><input name="remark" type="text" value="${remark}">
                    </div>
                    <input class="personal_btn" id="update_user_btn" type="submit" value="保存修改">
                    <input class="personal_btn" id="update_password_btn" type="button" value="修改密码"><br/>
                </form>
            </div>
        </div>
        <!--addUser-end-->
        <!--footer-starts-->
        <div class="footer" style="margin-top: 10px">
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
        <script type="text/javascript" src="js/manager.js"></script>
    </body>
</html>