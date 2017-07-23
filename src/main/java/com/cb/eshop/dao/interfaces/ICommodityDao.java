package com.cb.eshop.dao.interfaces;

import com.cb.eshop.model.Commodity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICommodityDao {
    List<Commodity> selectCommoditysByCategory(@Param("category") Integer category);

    void deleteCommoditysBySellerId(@Param("sellerId") Integer sellerId);

    List<Commodity> selectSomeCommoditysFromStartId(@Param("startId") Integer startId, @Param("sellerId") Integer sellerId,
                                                    @Param("pageNum") Integer pageNum, @Param("category") String category);

    Integer selectCommodityNumbers(@Param("sellerId") Integer sellerId, @Param("category") String category);

    void insertCommodity(@Param("commodityName") String commodityName, @Param("storage") Integer storage,
                         @Param("category") Integer category, @Param("price") Double price,
                         @Param("description") String description, @Param("imageUrl") String imageUrl,
                         @Param("sellerId") Integer sellerId, @Param("discount") Double discount,
                         @Param("remark") String remark);

    void deleteCommodityByCommodityId(@Param("commodityId") Integer commodityId);

    Commodity selectCommodityByCommodityId(@Param("commodityId") Integer commodityId);

    void updateCommodityByCommodityId(@Param("commodityId") Integer commodityId, @Param("commodityName") String commodityName,
                                      @Param("storage") Integer storage, @Param("category") Integer category,
                                      @Param("price") Double price, @Param("description") String description,
                                      @Param("imageUrl") String imageUrl, @Param("discount") Double discount,
                                      @Param("remark") String remark);
    void updateStorageByCommodityId(@Param("commodityId") Integer commodityId, @Param("purchaseNum") Integer purchaseNum);
}
