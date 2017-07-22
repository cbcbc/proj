<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="keywords" content="E-SHOP, Bootstrap Web Templates" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>提交订单</title>

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
                                    <a href=""><li class="personal">查看订单</li></a>
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
            <a href="ordinaryuser-init?pageId=0&category=(1,2,3,4,0)"><h1>E-SHOP</h1></a>
        </div>
        <!--start-logo-->
        <!--product-starts-->
        <div class="ckeckout">
            <div class="container">
                <div class="ckeckout-top">
                    <div class="cart-items">
                        <h3 class="ghj">提交订单</h3>
                        <div class="in-check" style="margin-top: 50px; margin-bottom: 30px">
                            <ul class="unit">
                                <li><span>商品</span></li>
                                <li><span>商品名称</span></li>
                                <li><span>购买数量</span></li>
                                <li><span>购买价格</span></li>
                                <li> </li>
                                <div class="clearfix"> </div>
                            </ul>
                            <ul class="cart-header">
                                <li><a href="commodity-info?commodityId=${commodity_id}" ><img src="images/cm${image_url}.png" width="50px" class="img-responsive" alt=""></a>
                                </li>
                                <li><a href="commodity-info?commodityId=${commodity_id}" ><span class="name" style="margin-top: 5px !important;">${commodity_name}</span></a></li>
                                <li><span class="quantity" style="margin-top: 0px !important;">1</span>
                                    <p>库存： ${storage}</p></li>
                                <li><span class="cost" style="margin-top: 5px !important;">￥ <fmt:formatNumber type="number" value="${price - discount * price}" maxFractionDigits="2"/></span></li>
                                <div class="clearfix"> </div>
                            </ul>
                        </div>
                        <input type="button" value="提交订单" id="make_order_btn">
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <!--product-end-->
        <!--footer-starts-->
        <div class="footer">
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