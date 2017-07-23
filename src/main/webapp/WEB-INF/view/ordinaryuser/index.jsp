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
        <!--prdt-starts-->
        <div class="prdt" style="padding-top:50px">
            <div class="container">
                <div class="prdt-top">
                    <div class="col-md-9 prdt-left">
                        <div class="product-one">
                            <c:forEach var="commodity" items="${commoditys}" varStatus="status" begin="0" end="2" step="1">
                                <div class="col-md-4 product-left p-left">
                                    <div class="product-main simpleCart_shelfItem" style="padding-bottom: 16px">
                                        <a href="commodity-info?commodityId=${commodity.id}" class="mask"><img class="img-responsive zoom-img" src="images/cm${commodity.imageUrl}.png" alt="" /></a>
                                        <div class="product-bottom">
                                            <h3><a href="commodity-info?commodityId=${commodity.id}" style="color: black">${commodity.commodityName}</a></h3>
                                            <p style="line-height: 20px; padding-top: 5px"><a href="commodity-info?commodityId=${commodity.id}">查看详情</a></p>
                                            <h4>
                                                <span class="item_price" style="text-decoration: line-through">￥ <fmt:formatNumber type="number" value="${commodity.price}" maxFractionDigits="2"/></span>
                                                &nbsp;
                                                <span class="item_price">￥ <fmt:formatNumber type="number" value="${commodity.price - commodity.discount * commodity.price}" maxFractionDigits="2"/></span>
                                            </h4>
                                            <a href="pay?commodityId=${commodity.id}">购买该商品</a>
                                        </div>
                                        <div class="srch srch1">
                                            <span>-${commodity.discount * 100}%</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="clearfix"></div>
                        </div>
                        <div class="product-one">
                            <c:forEach var="commodity" items="${commoditys}" varStatus="status" begin="3" end="5" step="1">
                                <div class="col-md-4 product-left p-left">
                                    <div class="product-main simpleCart_shelfItem" style="padding-bottom: 16px">
                                        <a href="commodity-info?commodityId=${commodity.id}" class="mask"><img class="img-responsive zoom-img" src="images/cm${commodity.imageUrl}.png" alt="" /></a>
                                        <div class="product-bottom">
                                            <h3><a href="commodity-info?commodityId=${commodity.id}" style="color: black">${commodity.commodityName}</a></h3>
                                            <p style="line-height: 20px; padding-top: 5px"><a href="commodity-info?commodityId=${commodity.id}">查看详情</a></p>
                                            <h4>
                                                <span class="item_price" style="text-decoration: line-through">￥ <fmt:formatNumber type="number" value="${commodity.price}" maxFractionDigits="2"/></span>
                                                &nbsp;
                                                <span class="item_price">￥ <fmt:formatNumber type="number" value="${commodity.price - commodity.discount * commodity.price}" maxFractionDigits="2"/></span>
                                            </h4>
                                            <a href="pay?commodityId=${commodity.id}">购买该商品</a>
                                        </div>
                                        <div class="srch srch1">
                                            <span>-${commodity.discount * 100}%</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="clearfix"></div>
                        </div>
                        <div id="pages">
                            <ul>
                                <li class="page_select"><a href="ordinaryuser-init?pageId=0&category=${category}">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                <li class="page_select">
                                    <c:choose>
                                        <c:when test="${pageId == 0}">
                                            <a href="ordinaryuser-init?pageId=${pageId }&category=${category}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:when>
                                        <c:otherwise>
                                            <a href="ordinaryuser-init?pageId=${pageId-1 }&category=${category}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="page_select">
                                    <a href="ordinaryuser-init?pageId=${pageId}&category=${category}" class="current_page">${pageId + 1}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                </li>
                                <c:forEach begin="2" end="5" var="i">
                                    <li class="page_select">
                                        <c:choose>
                                            <c:when test="${pageId + i <= pageNumbers}">
                                                <a href="ordinaryuser-init?pageId=${pageId + i - 1}&category=${category}">${pageId + i}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                            </c:when>
                                        </c:choose>
                                    </li>
                                </c:forEach>
                                <li class="page_select">
                                    <c:choose>
                                        <c:when test="${pageId==pageNumbers-1}">
                                            <a href="ordinaryuser-init?pageId=${pageId }&category=${category}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:when>
                                        <c:otherwise>
                                            <a href="ordinaryuser-init?pageId=${pageId+1 }&category=${category}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="page_select"><a href="ordinaryuser-init?pageId=${pageNumbers-1 }&category=${category}">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                                <li class="page_select">共${pageNumbers}页</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 header-right" style="display: none; padding-bottom: 20px; padding-left: 0px; z-index: 1">
                        <div class="search-bar" style="border: 1px solid #ECECEC">
                            <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
                            <input type="submit" value="">
                        </div>
                    </div>
                    <div class="col-md-3 prdt-right">
                        <div class="w_sidebar">
                            <section  class="sky-form">
                                <h4>商品类目</h4>
                                <div class="row1 scroll-pane" style="height: auto">
                                    <input type="hidden" value="${category}" id="category">
                                    <div class="col col-4">
                                        <label class="radio"><input type="radio" id="all_commodity" name="commodity_radio" value="(1,2,3,4,0)"><i></i>所有商品</label>
                                    </div>
                                    <div class="col col-4">
                                        <label class="radio"><input type="radio" class="category_commodity" name="commodity_radio" value="(1)"><i></i>类目1</label>
                                        <label class="radio"><input type="radio" class="category_commodity" name="commodity_radio" value="(2)"><i></i>类目2</label>
                                        <label class="radio"><input type="radio" class="category_commodity" name="commodity_radio" value="(3)"><i></i>类目3</label>
                                        <label class="radio"><input type="radio" class="category_commodity" name="commodity_radio" value="(4)"><i></i>类目4</label>
                                        <label class="radio"><input type="radio" class="category_commodity" name="commodity_radio" value="(0)"><i></i>类目5</label>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--product-end-->
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