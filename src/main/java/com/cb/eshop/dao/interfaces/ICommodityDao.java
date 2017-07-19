package com.cb.eshop.dao.interfaces;

import com.cb.eshop.model.Commodity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICommodityDao {
    List<Commodity> selectCommoditysByCategory(@Param("category") Integer category);

    void deleteCommoditysBySellerId(@Param("sellerId") Integer sellerId);

    List<Commodity> selectSomeCommoditysFromStartId(@Param("startId") Integer startId, @Param("sellerId") Integer sellerId);

    Integer selectCommodityNumbers(@Param("sellerId") Integer sellerId);
}
