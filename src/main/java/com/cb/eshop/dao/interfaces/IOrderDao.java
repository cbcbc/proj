package com.cb.eshop.dao.interfaces;

import com.cb.eshop.model.Commodity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface IOrderDao {

    void insertOrder(@Param("orderId") String orderId, @Param("purchaserId") Integer purchaserId,
                     @Param("totalPrice") Double totalPrice, @Param("orderStatus") Integer orderStatus,
                     @Param("createTime") Timestamp createTime, @Param("updateTime") Timestamp updateTime);

}
