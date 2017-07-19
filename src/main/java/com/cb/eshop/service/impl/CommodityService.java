package com.cb.eshop.service.impl;

import com.cb.eshop.dao.interfaces.ICommodityDao;
import com.cb.eshop.model.Commodity;
import com.cb.eshop.service.interfaces.ICommodityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class CommodityService implements ICommodityService {

    @Resource
    private ICommodityDao commodityDao;


    @Override
    public List<Commodity> getCommoditysByCategory(Integer category) {
        return commodityDao.selectCommoditysByCategory(category);
    }

    @Override
    public List<Commodity> getTenCommoditysByPageId(Integer pageId, Integer sellerId) {
        return commodityDao.selectSomeCommoditysFromStartId(pageId * 10, sellerId);
    }

    @Override
    public Integer getCommodityPageNumbers(Integer sellerId) {
        Integer commodityNumbers = commodityDao.selectCommodityNumbers(sellerId);
        return commodityNumbers % 10 == 0 ? commodityNumbers / 10 : commodityNumbers / 10 + 1;
    }

    @Override
    public void saveCommodity(String commodityName, Integer storage, Integer category, Double price, String description, String imageUrl, Integer sellerId, Double discount, String remark) {
        commodityDao.insertCommodity(commodityName, storage, category, price, description, imageUrl, sellerId, discount, remark);
    }

    @Override
    public void deleteCommodityByCommodityId(Integer commodityId) {
        commodityDao.deleteCommodityByCommodityId(commodityId);
    }

    @Override
    public Commodity getCommodityByCommodityId(Integer commodityId) {
        return commodityDao.selectCommodityByCommodityId(commodityId);
    }

    public void updateCommodityByCommodityId(Integer commodityId, String commodityName, Integer storage, Integer category,
                      Double price, String description, String imageUrl, Double discount, String remark) {
        commodityDao.updateCommodityByCommodityId(commodityId, commodityName, storage, category, price,
                description, imageUrl, discount, remark);
    }
}

