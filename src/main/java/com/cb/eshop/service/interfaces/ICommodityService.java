package com.cb.eshop.service.interfaces;

import com.cb.eshop.model.Commodity;
import com.cb.eshop.model.User;

import java.util.List;

public interface ICommodityService {
    List<Commodity> getCommoditysByCategory(Integer category);

    List<Commodity> getTenCommoditysByPageId(Integer pageId, Integer userId);

    Integer getCommodityPageNumbers(Integer userId);

    void saveCommodity(String commodityName, Integer storage, Integer category, Double price,
                       String description, String imageUrl, Integer sellerId, Double discount, String remark);

    void deleteCommodityByCommodityId(Integer commodityId);

    Commodity getCommodityByCommodityId(Integer commodityId);

    void updateCommodityByCommodityId(Integer commodityId, String commodityName, Integer storage, Integer category,
                                      Double price, String description, String imageUrl, Double discount, String remark);
}
