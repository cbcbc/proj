package com.cb.eshop.controller;

import com.cb.eshop.model.Commodity;
import com.cb.eshop.model.User;
import com.cb.eshop.service.interfaces.ICommodityService;
import com.cb.eshop.service.interfaces.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class InitController {

    private Logger log = Logger.getLogger(InitController.class);

    @Resource
    private IUserService userService;

    @Resource
    private ICommodityService commodityService;

    @RequestMapping(value = "/admin-init", method = {RequestMethod.POST, RequestMethod.GET})
    public String adminInit(HttpServletRequest request, Model model) {
        Integer pageId = Integer.parseInt(request.getParameter("pageId"));
        List<User> users = userService.getTenUsersByPageId(pageId);
        model.addAttribute("pageId", pageId);
        model.addAttribute("users", users);
        model.addAttribute("startId",pageId * 10 + 1);
        model.addAttribute("pageNumbers", userService.getUserPageNumbers());
        return "manager/index";
    }

    @RequestMapping(value = "/seller-init", method = {RequestMethod.POST, RequestMethod.GET})
    public String sellerInit(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Integer sellerId = (Integer) session.getAttribute("user_id");
        Integer pageId = Integer.parseInt(request.getParameter("pageId"));
        List<Commodity> commoditys = commodityService.getSomeCommoditysByPageId(pageId, sellerId, 10);
        model.addAttribute("pageId", pageId);
        model.addAttribute("commoditys", commoditys);
        model.addAttribute("startId",pageId * 10 + 1);
        model.addAttribute("pageNumbers", commodityService.getCommodityPageNumbers(sellerId,10));
        return "seller/index";
    }

    @RequestMapping(value = "/ordinaryuser-init", method = {RequestMethod.POST, RequestMethod.GET})
    public String ordinaryUserInit(HttpServletRequest request, Model model) {
        Integer pageId = Integer.parseInt(request.getParameter("pageId"));
        List<Commodity> commoditys =
                commodityService.getSomeCommoditysByPageId(pageId, 1, 6); //1表示供应商id
        model.addAttribute("pageId", pageId);
        model.addAttribute("commoditys", commoditys);
        model.addAttribute("startId",pageId * 6 + 1);
        model.addAttribute("pageNumbers", commodityService.getCommodityPageNumbers(1, 6));
        return "ordinaryuser/index";
    }
}
