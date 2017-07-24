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
        <title>处理订单</title>

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
                                    <a href="process-order?pageId=0"><li class="personal">处理订单</li></a>
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
        <!--manager-starts-->
        <div class="manager_module">
            <h3 class="ghj">处理订单</h3>
            <div>
                订单查询：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="order_id_query" value="${orderIdQuery}" placeholder="订单号">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" id="start_time_query" value="${startTime}" placeholder="起始时间"> -
                        <input type="text" id="over_time_query" value="${overTime}" placeholder="结束时间"> &nbsp;&nbsp;&nbsp;&nbsp;
                        订单状态：<select style="height: 24px" id="order_status_query">
                            <option value="-1"></option>
                            <option value="0">已提交</option>
                            <option value="1">已发货</option>
                            <option value="2">确认收货，订单关闭</option>
                            <option value="3">不发货</option>
                            <option value="4">确认不发货，订单关闭</option>
                        </select> &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="hidden" id="order_status_query_vale" value="${orderStatusQuery}">
                        <input type="button" id="submit_process_btn" value="提交查询">
            </div>
            <br />
            <input type="hidden" value="${submit_order_error}" id="submit_order_error">
            <table id="manager_table">
                <thead>
                <tr>
                    <th class="manager_table th">id</th>
                    <th class="manager_table th">订单号</th>
                    <th class="manager_table th">订单总价</th>
                    <th class="manager_table th">购买者id</th>
                    <th class="manager_table th">创建时间</th>
                    <th class="manager_table th">更新时间</th>
                    <th class="manager_table th">购买者备注</th>
                    <th class="manager_table th">订单状态</th>
                    <th class="manager_table th">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}" varStatus="status">
                    <tr>
                        <td class="manager_table">${status.index + startId}</td>
                        <td class="manager_table" id="orderId${status.index}"><a href="order-detail?orderId=${order.orderId}">${order.orderId}</a></td>
                        <td class="manager_table">￥ <fmt:formatNumber type="number" value="${order.totalPrice}" maxFractionDigits="2"/></td>
                        <td class="manager_table">${order.purchaserId}</td>
                        <td class="manager_table">${order.createTime}</td>
                        <td class="manager_table">${order.updateTime}</td>
                        <td class="manager_table">${order.purchaserRemark}</td>
                        <td class="manager_table" id="process_order_status${status.index}">${order.orderStatus}</td>
                        <td class="manager_table">
                            <input class="order_btn" id="process_order_btn${status.index}" type="button">
                            <input class="order_btn" id="process_order_btn2${status.index}" type="button">
                            <input id="process_order_remark${status.index}" type="text" placeholder="操作备注" style="width: 60px; height: 33px; margin-left:5px; font-size: 14px"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="pages">
                <ul>
                    <li class="page_select"><a href="process-order?pageId=0&orderIdQuery=${orderIdQuery}&startTime=${startTime}&overTime=${overTime}&orderStatusQuery=${orderStatusQuery}">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    <li class="page_select">
                        <c:choose>
                            <c:when test="${pageId == 0}">
                                <a href="process-order?pageId=${pageId }&orderIdQuery=${orderIdQuery}&startTime=${startTime}&overTime=${overTime}&orderStatusQuery=${orderStatusQuery}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="process-order?pageId=${pageId-1 }&orderIdQuery=${orderIdQuery}&startTime=${startTime}&overTime=${overTime}&orderStatusQuery=${orderStatusQuery}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="page_select">
                        <a href="process-order?pageId=${pageId}&orderIdQuery=${orderIdQuery}&startTime=${startTime}&overTime=${overTime}&orderStatusQuery=${orderStatusQuery}" class="current_page">${pageId + 1}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </li>
                    <c:forEach begin="2" end="5" var="i">
                        <li class="page_select">
                            <c:choose>
                                <c:when test="${pageId + i <= pageNumbers}">
                                    <a href="process-order?pageId=${pageId + i - 1}&orderIdQuery=${orderIdQuery}&startTime=${startTime}&overTime=${overTime}&orderStatusQuery=${orderStatusQuery}">${pageId + i}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                </c:when>
                            </c:choose>
                        </li>
                    </c:forEach>
                    <li class="page_select">
                        <c:choose>
                            <c:when test="${pageId==pageNumbers-1}">
                                <a href="process-order?pageId=${pageId }&orderIdQuery=${orderIdQuery}&startTime=${startTime}&overTime=${overTime}&orderStatusQuery=${orderStatusQuery}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="process-order?pageId=${pageId+1 }&orderIdQuery=${orderIdQuery}&startTime=${startTime}&overTime=${overTime}&orderStatusQuery=${orderStatusQuery}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="page_select"><a href="process-order?pageId=${pageNumbers-1 }&orderIdQuery=${orderIdQuery}&startTime=${startTime}&overTime=${overTime}&orderStatusQuery=${orderStatusQuery}">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
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
        <script type="text/javascript" src="js/process.order.js"></script>
    </body>
</html>