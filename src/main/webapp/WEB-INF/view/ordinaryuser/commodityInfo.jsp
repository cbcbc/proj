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
        <title>商品详情</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/index.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" />
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
                                    <a href="view-order?pageId=0"><li class="personal">查看订单</li></a>
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
        <div class="single contact">
            <div class="container">
                <div class="single-main">
                    <div class="col-md-9 single-main-left">
                        <div class="sngl-top">
                            <div class="col-md-5 single-top-left">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <li data-thumb="images/cm${image_url}.png">
                                            <div class="thumb-image"> <img src="images/cm${image_url}.png" data-imagezoom="true" class="img-responsive" alt=""/> </div>
                                        </li>
                                        <li data-thumb="images/cm${image_url}.png">
                                            <div class="thumb-image"> <img src="images/cm${image_url}.png" data-imagezoom="true" class="img-responsive" alt=""/> </div>
                                        </li>
                                        <li data-thumb="images/cm${image_url}.png">
                                            <div class="thumb-image"> <img src="images/cm${image_url}.png" data-imagezoom="true" class="img-responsive" alt=""/> </div>
                                        </li>
                                    </ul>
                                </div>
                                <!-- FlexSlider -->
                            </div>
                            <div class="col-md-7 single-top-right">
                                <div class="single-para simpleCart_shelfItem">
                                    <h2>${commodity_name}</h2>
                                    <h5 class="item_price" style="color: red; padding-bottom: 15px">
                                        &nbsp;&nbsp;
                                        <span class="item_price" style="text-decoration: line-through">￥ <fmt:formatNumber type="number" value="${price}" maxFractionDigits="2"/></span>
                                        &nbsp;
                                        <span class="item_price">￥ <fmt:formatNumber type="number" value="${price - discount * price}" maxFractionDigits="2"/></span>
                                    </h5>
                                    <p style="padding-top: 15px; padding-bottom: 15px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${description}</p>
                                    <ul class="tag-men" style="padding-top: 15px; padding-bottom: 15px">
                                        <li><h4>库存： &nbsp;${storage}</h4></li>
                                        <li><h4>备注： &nbsp;${remark}</h4></li>
                                    </ul>
                                    <a href="pay?commodityId=${commodity_id}" class="add-cart item_add" style="background-color: red">购买该商品</a>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>

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
        <script src="js/imagezoom.js"></script>
        <script defer src="js/jquery.flexslider.js"></script>
        <script>
            $(window).load(function() {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>
    </body>
</html>