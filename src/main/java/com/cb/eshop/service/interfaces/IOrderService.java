package com.cb.eshop.service.interfaces;

import com.cb.eshop.model.Order;
import com.cb.eshop.model.User;

import java.sql.Timestamp;
import java.util.List;

public interface IOrderService {

    void saveOrder(String orderId, Integer purchaserId, Double totalPrice, Integer sellerId, Integer orderStatus,
                   Timestamp createTime, Timestamp updateTime, Integer commodityId, Integer quantity);

    List<Order> getOrdersByPurchaserId(Integer purchaserId);

    List<Order> getOrdersBySellerId(Integer sellerId);

    void setOrderStatusAndSellerRemarkByOrderId(String orderId, Integer orderStatus, String sellerRemark);

    void setOrderStatusAndPurchaserRemarkByOrderId(String orderId, Integer orderStatus, String purchaserRemark);
}
