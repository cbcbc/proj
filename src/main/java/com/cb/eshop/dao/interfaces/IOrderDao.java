package com.cb.eshop.dao.interfaces;

import com.cb.eshop.model.Commodity;
import com.cb.eshop.model.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface IOrderDao {

    void insertOrder(@Param("orderId") String orderId, @Param("purchaserId") Integer purchaserId,
                     @Param("totalPrice") Double totalPrice, @Param("sellerId") Integer sellerId,
                     @Param("orderStatus") Integer orderStatus, @Param("createTime") Timestamp createTime,
                     @Param("updateTime") Timestamp updateTime);

    List<Order> selectOrdersByPurchaserId(@Param("purchaserId") Integer purchaserId);

    List<Order> selectOrdersBySellerId(@Param("sellerId") Integer sellerId);

    void updateOrderStatusAndSellerRemarkByOrderId(@Param("orderId") String orderId, @Param("orderStatus") Integer orderStatus,
                                    @Param("sellerRemark") String sellerRemark);

    void updateOrderStatusAndPurchaserRemarkByOrderId(@Param("orderId") String orderId, @Param("orderStatus") Integer orderStatus,
                                                   @Param("purchaserRemark") String purchaserRemark);
}
