<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="E-SHOP, Bootstrap Web Templates" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>添加商品</title>

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
                                    <a href="#"><li class="personal">订单处理</li></a>
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
            <a href="seller-init?pageId=0"><h1>E-SHOP</h1></a>
        </div>
        <!--start-logo-->
        <!--addUser-starts-->
        <div style="margin-top: 50px; margin-left: 30px">
            <h3 class="ghj">添加商品</h3>
            <div>
                <form action="add-commodity" method="post" id="commit_commodity" onsubmit="return commitCommodity()">
                    <span id="add_commodity_success" style="color: red">${add_commodity_success}</span>
                    <div id="add_user_part1">
                        <input type="hidden" name="seller_id" value="${user_id}">
                        <span>商品名称：</span><input name="commodity_name" type="text" required><span> *</span><br />
                        <span>商品库存：</span><input id="storage" name="storage" type="text" required><span> *</span><span id="storage_error" style="color: red"></span><br />
                        <span>商品类目：</span>
                        <select class="add_commodity_select" name="category">
                            <option value="0">类目5</option>
                            <option value="1">类目1</option>
                            <option value="2">类目2</option>
                            <option value="3">类目3</option>
                            <option value="4">类目4</option>
                        </select><br />
                        <span>商品价格：</span><input id="price" name="price" type="text" required><span> *</span><span id="price_error" style="color: red"></span><br />
                    </div>
                    <div>
                        <span>商品描述：</span><input name="description" type="text"><br />
                        <span>图片编号：</span><input name="image_url" type="text"><br />
                        <span>商品折扣：</span><input id="discount" name="discount" type="text" required><span> *</span><span id="discount_error" style="color: red"></span><br />
                        <span>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</span><input name="remark" type="text">
                    </div>
                    <input id="commit_commodity_btn" type="submit" value="提交"><br />
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