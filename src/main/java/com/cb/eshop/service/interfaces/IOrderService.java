package com.cb.eshop.service.interfaces;

import com.cb.eshop.model.Order;
import com.cb.eshop.model.OrderDetail;
import com.cb.eshop.model.User;

import java.sql.Timestamp;
import java.util.List;

public interface IOrderService {

    void saveOrder(String orderId, Integer purchaserId, Double totalPrice, Integer sellerId, Integer orderStatus,
                   Timestamp createTime, Timestamp updateTime, Integer commodityId, Integer quantity);

    List<Order> getTenOrdersByPurchaserIdAndQueryCriteria(Integer purchaserId, String orderId, String startTime,
                                                       String overTime, String orderStatusString, Integer pageId);

    Integer getOrderPageNumbersByPurchaserIdAndQueryCriteria(Integer purchaserId, String orderId,String startTime,
                                                             String overTime, String orderStatusString);

    List<Order> getTenOrdersBySellerIdAndQueryCriteria(Integer sellerId, String orderId, String startTime,
                                                    String overTime, String orderStatusString, Integer pageId);

    Integer getOrderPageNumbersBySellerIdAndQueryCriteria(Integer sellerId, String orderId,String startTime,
                                                                 String overTime, String orderStatusString);

    void setOrderStatusAndSellerRemarkByOrderId(String orderId, Integer orderStatus, String sellerRemark);

    void setOrderStatusAndPurchaserRemarkByOrderId(String orderId, Integer orderStatus, String purchaserRemark);

    OrderDetail getOrderDetailByOrderId(String orderId);
}
