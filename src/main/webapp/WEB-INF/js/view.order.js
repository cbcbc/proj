function sendCommoditysConfirm(i) {
    $("#view_order_btn" + i).click(function () {
        var pageId = $(".current_page").text() - 1;
        var orderId = $("#orderId" + i).text();
        var purchaserRemark = $("#view_order_remark" + i).val();
        var orderStatus
        if ($("#view_order_status" + i).text() == "供应商已发货"){
            orderStatus = 2;
        } else {
            orderStatus = 4;
        }
        window.location.href = "view-order?pageId=" + pageId + "&changeStatus=1&orderStatus=" + orderStatus + "&orderId=" + orderId + "&purchaserRemark=" + encodeURIComponent(encodeURIComponent(purchaserRemark));
    })
}

function parseOrderStatus(i) {
    var view_order_status = $("#view_order_status" + i).text();
    switch(view_order_status)
    {
        case "0":
            $("#view_order_status" + i).text("已提交");
            $("#view_order_btn" + i).hide();
            $("#view_order_remark" + i).hide();
            break;
        case "1":
            $("#view_order_status" + i).text("供应商已发货");
            $("#view_order_btn" + i).show();
            $("#view_order_btn" + i).val("确认");
            $("#view_order_remark" + i).show();
            break;
        case "2":
            $("#view_order_status" + i).text("确认收货，订单关闭");
            $("#view_order_btn" + i).hide();
            $("#view_order_remark" + i).hide();
            break;
        case "3":
            $("#view_order_status" + i).text("供应商不发货");
            $("#view_order_btn" + i).show();
            $("#view_order_btn" + i).val("确认");
            $("#view_order_remark" + i).show();
            break;
        case "4":
            $("#view_order_status" + i).text("确认不发货，订单关闭");
            $("#view_order_btn" + i).hide();
            $("#view_order_remark" + i).hide();
            break;
        default:
            alert("订单状态异常！");
    }
}

$(document).ready(function () {
    if($("#submit_order_error").val() != "") {
        alert($("#submit_order_error").val());
    }

    var t_length = $("#manager_table tr").length - 1;
    for (var i=0; i<t_length; i++) {
        parseOrderStatus(i);
        sendCommoditysConfirm(i);
    }
});