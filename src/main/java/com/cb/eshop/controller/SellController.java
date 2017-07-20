package com.cb.eshop.controller;

import com.cb.eshop.model.Commodity;
import com.cb.eshop.model.User;
import com.cb.eshop.service.interfaces.ICommodityService;
import com.cb.eshop.service.interfaces.IUserService;
import com.cb.eshop.utils.DecriptUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/")
public class SellController {

    private Logger log = Logger.getLogger(SellController.class);

    @Resource
    private ICommodityService commodityService;

    @RequestMapping(value = "/add-commodity", method = RequestMethod.GET)
    public String addCommodity() {
        return "seller/addCommodity";
    }

    @RequestMapping(value = "/add-commodity", method = RequestMethod.POST)
    public String addCommodityPost(@RequestParam("commodity_name") String commodityName, @RequestParam("storage") Integer storage,
                                   @RequestParam("category") Integer category, @RequestParam("price") Double price,
                                   @RequestParam("description") String description, @RequestParam("image_url") String imageUrl,
                                   @RequestParam("discount") Double discount, @RequestParam("remark") String remark,
                                   @RequestParam("seller_id") Integer sellerId, Model model) {

        commodityService.saveCommodity(commodityName, storage, category, price, description, imageUrl, sellerId, discount, remark);
        model.addAttribute("add_commodity_success", "添加用户成功！");

        return "seller/addCommodity";
    }

    @RequestMapping(value = "/delete-commodity", method = {RequestMethod.POST, RequestMethod.GET})
    public String deleteCommodity(HttpServletRequest request) {
        Integer commodityId = Integer.parseInt(request.getParameter("commodityId"));
        Integer pageId = Integer.parseInt(request.getParameter("pageId"));
        commodityService.deleteCommodityByCommodityId(commodityId);
        return "forward:/seller-init?pageId=" + pageId;
    }

    @RequestMapping(value = "/update-commodity", method = RequestMethod.GET)
    public String updateCommodity(HttpServletRequest request, Model model) {
        Integer commodityId = Integer.parseInt(request.getParameter("commodityId"));
        Commodity commodity = commodityService.getCommodityByCommodityId(commodityId);
        model.addAttribute("commodity_id", commodity.getId());
        model.addAttribute("commodity_name", commodity.getCommodityName());
        model.addAttribute("storage", commodity.getStorage());
        model.addAttribute("category", commodity.getCategory());
        model.addAttribute("price", commodity.getPrice());
        model.addAttribute("description", commodity.getDescription());
        model.addAttribute("image_url", commodity.getImageUrl());
        model.addAttribute("discount", commodity.getDiscount());
        model.addAttribute("remark", commodity.getRemark());

        return "seller/updateCommodity";
    }

    @RequestMapping(value = "/update-commodity", method = RequestMethod.POST)
    public String updateCommodityPost(@RequestParam("commodity_id") Integer commodityId, @RequestParam("commodity_name") String commodityName,
                                      @RequestParam("storage") Integer storage, @RequestParam("category") Integer category,
                                      @RequestParam("price") Double price, @RequestParam("description") String description,
                                      @RequestParam("image_url") String imageUrl, @RequestParam("discount") Double discount,
                                      @RequestParam("remark") String remark, Model model) {
        commodityService.updateCommodityByCommodityId(commodityId, commodityName, storage, category, price,
                        description, imageUrl, discount, remark);
        model.addAttribute("update_commodity_success", "修改商品信息成功！");
        model.addAttribute("commodity_id", commodityId);
        model.addAttribute("commodity_name", commodityName);
        model.addAttribute("storage", storage);
        model.addAttribute("category", category);
        model.addAttribute("price", price);
        model.addAttribute("description", description);
        model.addAttribute("image_url", imageUrl);
        model.addAttribute("discount", discount);
        model.addAttribute("remark", remark);

        return "seller/updateCommodity";
    }

    @RequestMapping(value = "/commodity-info", method = RequestMethod.GET)
    public String displayCommodityInfo(HttpServletRequest request, Model model) {
        Integer commodityId = Integer.parseInt(request.getParameter("commodityId"));
        Commodity commodity = commodityService.getCommodityByCommodityId(commodityId);
        model.addAttribute("commodity_id", commodity.getId());
        model.addAttribute("commodity_name", commodity.getCommodityName());
        model.addAttribute("storage", commodity.getStorage());
        model.addAttribute("category", commodity.getCategory());
        model.addAttribute("price", commodity.getPrice());
        model.addAttribute("description", commodity.getDescription());
        model.addAttribute("image_url", commodity.getImageUrl());
        model.addAttribute("discount", commodity.getDiscount());
        model.addAttribute("remark", commodity.getRemark());

        return "ordinaryuser/commodityInfo";
    }

}
