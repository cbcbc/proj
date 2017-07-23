package com.cb.eshop.service.interfaces;

import com.cb.eshop.model.User;

import java.sql.Timestamp;
import java.util.List;

public interface IOrderService {

    void saveOrder(String orderId, Integer purchaserId, Double totalPrice, Integer orderStatus,
                   Timestamp createTime, Timestamp updateTime, Integer commodityId, Integer quantity);

}
