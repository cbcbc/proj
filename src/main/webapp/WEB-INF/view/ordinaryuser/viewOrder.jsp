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
        <title>查看订单</title>

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
        <!--product-starts-->
        <div class="manager_module">
            <h3 class="ghj">查看订单</h3>
            <div class="add_user">
                <input class="add_user_btn" type="button" value="添加用户">
            </div>
            <input type="hidden" value="${submit_order_error}" id="submit_order_error">
            <table id="manager_table">
                <thead>
                <tr>
                    <th class="manager_table th">id</th>
                    <th class="manager_table th">订单号</th>
                    <th class="manager_table th">订单总价</th>
                    <th class="manager_table th">销售商id</th>
                    <th class="manager_table th">创建时间</th>
                    <th class="manager_table th">更新时间</th>
                    <th class="manager_table th">供应商备注</th>
                    <th class="manager_table th">订单状态</th>
                    <th class="manager_table th">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}" varStatus="status">
                    <tr>
                        <td class="manager_table">${status.index + startId}</td>
                        <td class="manager_table" id="orderId${status.index}">${order.orderId}</td>
                        <td class="manager_table">￥ <fmt:formatNumber type="number" value="${order.totalPrice}" maxFractionDigits="2"/></td>
                        <td class="manager_table">${order.sellerId}</td>
                        <td class="manager_table">${order.createTime}</td>
                        <td class="manager_table">${order.updateTime}</td>
                        <td class="manager_table">${order.sellerRemark}</td>
                        <td class="manager_table" id="view_order_status${status.index}">${order.orderStatus}</td>
                        <td class="manager_table">
                            <input class="order_btn" id="view_order_btn${status.index}" type="button">
                            <input id="view_order_remark${status.index}" type="text" placeholder="操作备注" style="width: 60px; height: 33px; margin-left:5px; font-size: 14px"/>
                        </td>
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
        <script type="text/javascript" src="js/view.order.js"></script>
    </body>
</html>