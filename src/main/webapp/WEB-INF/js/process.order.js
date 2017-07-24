function sendCommoditys(i) {
    $("#process_order_btn" + i).click(function () {
        var pageId = $(".current_page").text() - 1;
        var orderId = $("#orderId" + i).text();
        var sellerRemark = $("#process_order_remark" + i).val();
        window.location.href = "process-order?pageId=" + pageId + "&changeStatus=1&orderStatus=1&orderId=" + orderId + "&sellerRemark=" + encodeURIComponent(encodeURIComponent(sellerRemark));
    })
}

function notSendCommoditys(i) {
    $("#process_order_btn2" + i).click(function () {
        var pageId = $(".current_page").text() - 1;
        var orderId = $("#orderId" + i).text();
        var sellerRemark = $("#process_order_remark" + i).val();
        window.location.href = "process-order?pageId=" + pageId + "&changeStatus=1&orderStatus=3&orderId=" + orderId + "&sellerRemark=" + encodeURIComponent(encodeURIComponent(sellerRemark));
    })
}

function parseOrderStatus(i) {
    var process_order_status = $("#process_order_status" + i).text();
    switch(process_order_status)
    {
        case "0":
            $("#process_order_status" + i).text("已提交");
            $("#process_order_btn" + i).show();
            $("#process_order_btn" + i).val("发货");
            $("#process_order_btn2" + i).show();
            $("#process_order_btn2" + i).val("不发货");
            $("#process_order_remark" + i).show();
            break;
        case "1":
            $("#process_order_status" + i).text("已发货");
            $("#process_order_btn" + i).hide();
            $("#process_order_btn2" + i).hide();
            $("#process_order_remark" + i).hide();
            break;
        case "2":
            $("#process_order_status" + i).text("确认收货，订单关闭");
            $("#process_order_btn" + i).hide();
            $("#process_order_btn2" + i).hide();
            $("#process_order_remark" + i).hide();
            break;
        case "3":
            $("#process_order_status" + i).text("不发货");
            $("#process_order_btn" + i).hide();
            $("#process_order_btn2" + i).hide();
            $("#process_order_remark" + i).hide();
            break;
        case "4":
            $("#process_order_status" + i).text("确认不发货，订单关闭");
            $("#process_order_btn" + i).hide();
            $("#process_order_btn2" + i).hide();
            $("#process_order_remark" + i).hide();
            break;
        default:
            alert("订单状态异常！");
    }
}

$(document).ready(function () {
    var t_length = $("#manager_table tr").length - 1;
    for (var i=0; i<t_length; i++) {
        parseOrderStatus(i);
        sendCommoditys(i);
        notSendCommoditys(i);
    }
});