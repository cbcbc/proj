package com.cb.eshop.service.impl;

import com.cb.eshop.dao.interfaces.ICommodityDao;
import com.cb.eshop.dao.interfaces.IOrderDao;
import com.cb.eshop.dao.interfaces.IOrderDetailDao;
import com.cb.eshop.dao.interfaces.IUserDao;
import com.cb.eshop.model.Order;
import com.cb.eshop.model.OrderDetail;
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

    @Resource
    private ICommodityDao commodityDao;

    @Override
    public void saveOrder(String orderId, Integer purchaserId, Double totalPrice, Integer sellerId, Integer orderStatus, Timestamp createTime, Timestamp updateTime, Integer commodityId, Integer quantity) {
        orderDao.insertOrder(orderId, purchaserId, totalPrice, sellerId, orderStatus, createTime, updateTime);
        orderDetailDao.insertOrderDetail(orderId, commodityId, quantity);
    }

    @Override
    public List<Order> getTenOrdersByPurchaserIdAndQueryCriteria(Integer purchaserId, String orderId,
                                  String startTime, String overTime, String orderStatusString, Integer pageId) {
        String queryString = "SELECT * FROM t_order WHERE purchaser_id = " + purchaserId;
        if (orderId != null && !orderId.trim().equals("")){
            queryString += " and order_id = " + orderId.trim();
        }
        if (orderStatusString != null && orderStatusString.trim().equals("-1")){
            queryString += " and order_status <> -1";
        } else if (orderStatusString != null && !orderStatusString.trim().equals("")) {
            queryString += " and order_status = " + orderStatusString;
        }
        if (startTime != null && !startTime.trim().equals("")){
            queryString += " and create_time >= '" + startTime.trim() + "'";
        }
        if (overTime != null && !overTime.trim().equals("")) {
            queryString += " and create_time <= '" + overTime.trim() + "'";
        }
        queryString += " ORDER BY create_time DESC LIMIT " + pageId * 10 + ", 10";
        return orderDao.selectOrdersByPurchaserIdAndQueryCriteria(queryString);
    }

    @Override
    public Integer getOrderPageNumbersByPurchaserIdAndQueryCriteria(Integer purchaserId, String orderId,String startTime,
                                                                 String overTime, String orderStatusString) {
        String queryString = "SELECT count(*) FROM t_order WHERE purchaser_id = " + purchaserId;
        if (orderId != null && !orderId.trim().equals("")){
            queryString += " and order_id = " + orderId.trim();
        }
        if (orderStatusString != null && orderStatusString.trim().equals("-1")){
            queryString += " and order_status <> -1";
        } else if (orderStatusString != null && !orderStatusString.trim().equals("")) {
            queryString += " and order_status = " + orderStatusString;
        }
        if (startTime != null && !startTime.trim().equals("")){
            queryString += " and create_time >= '" + startTime.trim() + "'";
        }
        if (overTime != null && !overTime.trim().equals("")) {
            queryString += " and create_time <= '" + overTime.trim() + "'";
        }
        Integer orderNumbers = orderDao.selectOrderNumbersByPurchaserIdAndQueryCriteria(queryString);
        return orderNumbers % 10 == 0 ? orderNumbers / 10 : orderNumbers / 10 + 1;
    }

    @Override
    public List<Order> getTenOrdersBySellerIdAndQueryCriteria(Integer sellerId, String orderId,
                                           String startTime, String overTime, String orderStatusString, Integer pageId) {
        String queryString = "SELECT * FROM t_order WHERE seller_id = " + sellerId;
        if (orderId != null && !orderId.trim().equals("")){
            queryString += " and order_id = " + orderId.trim();
        }
        if (orderStatusString != null && orderStatusString.trim().equals("-1")){
            queryString += " and order_status <> -1";
        } else if (orderStatusString != null && !orderStatusString.trim().equals("")) {
            queryString += " and order_status = " + orderStatusString;
        }
        if (startTime != null && !startTime.trim().equals("")){
            queryString += " and create_time >= '" + startTime.trim() + "'";
        }
        if (overTime != null && !overTime.trim().equals("")) {
            queryString += " and create_time <= '" + overTime.trim() + "'";
        }
        queryString += " ORDER BY create_time DESC LIMIT " + pageId * 10 + ", 10";
        return orderDao.selectOrdersBySellerIdAndQueryCriteria(queryString);
    }

    @Override
    public Integer getOrderPageNumbersBySellerIdAndQueryCriteria(Integer sellerId, String orderId,String startTime,
                                           String overTime, String orderStatusString) {
        String queryString = "SELECT count(*) FROM t_order WHERE seller_id = " + sellerId;
        if (orderId != null && !orderId.trim().equals("")){
            queryString += " and order_id = " + orderId.trim();
        }
        if (orderStatusString != null && orderStatusString.trim().equals("-1")){
            queryString += " and order_status <> -1";
        } else if (orderStatusString != null && !orderStatusString.trim().equals("")) {
            queryString += " and order_status = " + orderStatusString;
        }
        if (startTime != null && !startTime.trim().equals("")){
            queryString += " and create_time >= '" + startTime.trim() + "'";
        }
        if (overTime != null && !overTime.trim().equals("")) {
            queryString += " and create_time <= '" + overTime.trim() + "'";
        }
        Integer orderNumbers = orderDao.selectOrderNumbersBySellerIdAndQueryCriteria(queryString);
        return orderNumbers % 10 == 0 ? orderNumbers / 10 : orderNumbers / 10 + 1;
    }

    @Override
    public void setOrderStatusAndSellerRemarkByOrderId(String orderId, Integer orderStatus, String sellerRemark) {
        orderDao.updateOrderStatusAndSellerRemarkByOrderId(orderId, orderStatus, sellerRemark);
        if(orderStatus == 3) {
            OrderDetail orderDetail = orderDetailDao.selectOrderDetailByOrderId(orderId);
            commodityDao.updateStorageByCommodityIdRoll(orderDetail.getCommodityId(), 1);
        }
    }

    @Override
    public void setOrderStatusAndPurchaserRemarkByOrderId(String orderId, Integer orderStatus, String purchaserRemark) {
        orderDao.updateOrderStatusAndPurchaserRemarkByOrderId(orderId, orderStatus, purchaserRemark);
    }

    @Override
    public OrderDetail getOrderDetailByOrderId(String orderId) {
        return orderDetailDao.selectOrderDetailByOrderId(orderId);
    }
}

