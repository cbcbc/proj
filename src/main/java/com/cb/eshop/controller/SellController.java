package com.cb.eshop.controller;

import com.cb.eshop.model.Commodity;
import com.cb.eshop.model.Order;
import com.cb.eshop.service.interfaces.ICommodityService;
import com.cb.eshop.service.interfaces.IOrderService;
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
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class SellController {

    private Logger log = Logger.getLogger(SellController.class);

    @Resource
    private ICommodityService commodityService;

    @Resource
    private IOrderService orderService;

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

    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public String pay(HttpServletRequest request, Model model) {
        Integer commodityId = Integer.parseInt(request.getParameter("commodityId"));
        model.addAttribute("commodity_id", commodityId);
        return "ordinaryuser/pay";
    }

    @RequestMapping(value = "/make-order", method = RequestMethod.POST)
    public String makeOrder(HttpServletRequest request, Model model, @RequestParam("commodity_id") Integer commodityId,
                            @RequestParam("password") String password) {
        HttpSession session = request.getSession();
        String correctPassword = (String) session.getAttribute("password");
        if (correctPassword.equals(DecriptUtil.MD5(password))) {
            if (commodityId != null) {
                Commodity commodity = commodityService.getCommodityByCommodityId(commodityId);
                if (commodity != null) {
                    model.addAttribute("commodity_id", commodity.getId());
                    model.addAttribute("commodity_name", commodity.getCommodityName());
                    model.addAttribute("storage", commodity.getStorage());
                    model.addAttribute("category", commodity.getCategory());
                    model.addAttribute("price", commodity.getPrice());
                    model.addAttribute("description", commodity.getDescription());
                    model.addAttribute("image_url", commodity.getImageUrl());
                    model.addAttribute("discount", commodity.getDiscount());
                    model.addAttribute("remark", commodity.getRemark());
                }
            }

            return "ordinaryuser/makeOrder";
        } else {
            model.addAttribute("password_error", " 密码不正确！");

            return "ordinaryuser/pay";
        }
    }

    @RequestMapping(value = "/view-order", method = {RequestMethod.POST, RequestMethod.GET})
    public String viewOrder(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
        String commodityIdString = request.getParameter("commodityId");
        HttpSession session = request.getSession();
        Integer purchaserId = (Integer) session.getAttribute("user_id");
        if (commodityIdString != null) {
            Integer commodityId = Integer.parseInt(commodityIdString);
            synchronized (commodityService){
                Commodity commodity = commodityService.getCommodityByCommodityId(commodityId);
                if (commodity != null) {
                    Integer storage = commodity.getStorage();
                    if (storage >= 1){
                        Double price = commodity.getPrice();
                        Double discount = commodity.getDiscount();
                        Double totalPrice = (1 - discount) * price;
                        totalPrice = (double)Math.round(totalPrice * 100) / 100;
                        Integer orderStatus = 0;

                        Timestamp currentTime = new Timestamp(new Date().getTime());

                        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
                        String orderId = sdf.format(currentTime) + purchaserId;
                        Integer sellerId = commodity.getSellerId();
                        orderService.saveOrder(orderId, purchaserId, totalPrice, sellerId, orderStatus, currentTime, currentTime,commodityId, 1);
                        commodityService.purchaseCommodity(commodityId, 1);
                    } else {
                        model.addAttribute("submit_order_error", "商品库存不足！");
                    }
                } else {
                    model.addAttribute("submit_order_error", "提交订单失败！");
                }
            }
        }

        String orderStatusString = request.getParameter("orderStatus");
        String orderId = request.getParameter("orderId");
        if (orderStatusString != null && orderId != null) {
            Integer orderStatus = Integer.parseInt(orderStatusString);
            String purchaserRemark = java.net.URLDecoder.decode(request.getParameter("purchaserRemark"),"UTF-8");
            orderService.setOrderStatusAndPurchaserRemarkByOrderId(orderId, orderStatus, purchaserRemark);
        }
        List<Order> orders = orderService.getOrdersByPurchaserId(purchaserId);
        model.addAttribute("orders", orders);
        Integer pageId = Integer.parseInt(request.getParameter("pageId"));
        model.addAttribute("pageId", pageId);
        model.addAttribute("startId",pageId * 10 + 1);
//        model.addAttribute("pageNumbers", userService.getUserPageNumbers());

        return "ordinaryuser/viewOrder";
    }

    @RequestMapping(value = "/process-order", method = {RequestMethod.POST, RequestMethod.GET})
    public String processOrder(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
        String orderStatusString = request.getParameter("orderStatus");
        String orderId = request.getParameter("orderId");
        if (orderStatusString != null && orderId != null) {
            Integer orderStatus = Integer.parseInt(orderStatusString);
            String sellerRemark = java.net.URLDecoder.decode(request.getParameter("sellerRemark"),"UTF-8");
            orderService.setOrderStatusAndSellerRemarkByOrderId(orderId, orderStatus, sellerRemark);
        }
        HttpSession session = request.getSession();
        Integer sellerId = (Integer) session.getAttribute("user_id");
        List<Order> orders = orderService.getOrdersBySellerId(sellerId);
        model.addAttribute("orders", orders);
        Integer pageId = Integer.parseInt(request.getParameter("pageId"));
        model.addAttribute("pageId", pageId);
        model.addAttribute("startId",pageId * 10 + 1);
//        model.addAttribute("pageNumbers", userService.getUserPageNumbers());

        return "seller/processOrder";
    }

}
