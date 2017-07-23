package com.cb.eshop.dao.interfaces;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;

@Repository
public interface IOrderDetailDao {

    void insertOrderDetail(@Param("orderId") String orderId, @Param("commodityId") Integer commodityId,
                     @Param("quantity") Integer quantity);

}
