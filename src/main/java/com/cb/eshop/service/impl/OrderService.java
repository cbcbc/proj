package com.cb.eshop.service.impl;

import com.cb.eshop.dao.interfaces.ICommodityDao;
import com.cb.eshop.dao.interfaces.IOrderDao;
import com.cb.eshop.dao.interfaces.IOrderDetailDao;
import com.cb.eshop.dao.interfaces.IUserDao;
import com.cb.eshop.model.User;
import com.cb.eshop.service.interfaces.IOrderService;
import com.cb.eshop.service.interfaces.IUserService;
import com.cb.eshop.utils.DecriptUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class OrderService implements IOrderService {

    @Resource
    private IOrderDao orderDao;

    @Resource
    private IOrderDetailDao orderDetailDao;


    @Override
    public void saveOrder(String orderId, Integer purchaserId, Double totalPrice, Integer orderStatus, Timestamp createTime, Timestamp updateTime, Integer commodityId, Integer quantity) {
        orderDao.insertOrder(orderId, purchaserId, totalPrice, orderStatus, createTime, updateTime);
        orderDetailDao.insertOrderDetail(orderId, commodityId, quantity);
    }
}

