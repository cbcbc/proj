<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="E-SHOP, Bootstrap Web Templates" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>添加用户</title>

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
            <a href="admin-init?pageId=0"><h1>E-SHOP</h1></a>
        </div>
        <!--start-logo-->
        <!--addUser-starts-->
        <div style="margin-top: 50px; margin-left: 30px">
            <h3 class="ghj">添加用户</h3>
            <div>
                <form action="add-user" method="post" id="commit_user" onsubmit="return commitUser()">
                    <span id="add_user_success" style="color: red">${add_user_success}</span>
                    <div id="add_user_part1">
                        <span>角色类型：</span>
                        <select class="add_user_select" name="role_type">
                            <option value="0">普通用户</option>
                            <option value="1">供应商</option>
                            <option value="2">管理员</option>
                        </select>
                        <span> *</span><br />
                        <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span><input name="nickname" type="text" required><span> *</span><br />
                        <span>联系电话：</span><input name="phone_number" type="text"><br />
                        <span>收货地址：</span><input name="address" type="text"><br />
                        <span>电子邮箱：</span><input id="add_mail" name="mail_address" type="text"><span class="mail_address_error" style="color: red"></span><br />
                    </div>
                    <div>
                        <span>用&nbsp;&nbsp;户&nbsp;&nbsp;名：</span><input id="add_username" name="username" type="text" required><span> *</span><span id="username_error" style="color: red">${username_error}</span><br />
                        <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input name="password" id="password" type="password" required><span> *</span><br />
                        <span>确认密码：</span><input class="password_confirm" type="password" required><span> *</span><span class="confirm_error" style="color: red"></span><br />
                        <span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</span><input name="remark" type="text">

                    </div>
                    <input id="commit_user_btn" type="submit" value="提交"><br />
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