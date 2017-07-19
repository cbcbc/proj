package com.cb.eshop.service.interfaces;

import com.cb.eshop.model.Commodity;
import com.cb.eshop.model.User;

import java.util.List;

public interface ICommodityService {
    List<Commodity> getCommoditysByCategory(Integer category);

    List<Commodity> getTenCommoditysByPageId(Integer pageId, Integer userId);

    Integer getCommodityPageNumbers(Integer userId);
}
