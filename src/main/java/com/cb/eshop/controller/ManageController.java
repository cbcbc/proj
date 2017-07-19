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
public class ManageController {

    private Logger log = Logger.getLogger(ManageController.class);

    @Resource
    private IUserService userService;

    @Resource
    private ICommodityService commodityService;

    @RequestMapping(value = "/update-user", method = {RequestMethod.POST, RequestMethod.GET})
    public String updateUser(HttpServletRequest request) {
        Integer userId = Integer.parseInt(request.getParameter("userId"));
        Integer pageId = Integer.parseInt(request.getParameter("pageId"));
        Integer roleType = Integer.parseInt(request.getParameter("roleType"));
        userService.updateUserRoleTypeByUserId(roleType, userId);

        return "forward:/admin-init?pageId=" + pageId;
    }

    @RequestMapping(value = "/delete-user", method = {RequestMethod.POST, RequestMethod.GET})
    public String deleteUser(HttpServletRequest request) {
        Integer userId = Integer.parseInt(request.getParameter("userId"));
        Integer pageId = Integer.parseInt(request.getParameter("pageId"));
        userService.deleteUserByUserId(userId);
        return "forward:/admin-init?pageId=" + pageId;
    }

    @RequestMapping(value = "/add-user", method = RequestMethod.GET)
    public String addUser() {
        return "manager/addUser";
    }

    @RequestMapping(value = "/add-user", method = RequestMethod.POST)
    public String addUserPost(@RequestParam("role_type") Integer roleType, @RequestParam("nickname") String nickname,
                              @RequestParam("phone_number") String phoneNumber, @RequestParam("address") String address,
                              @RequestParam("username") String username, @RequestParam("password") String password,
                              @RequestParam("remark") String remark, Model model) {
        if (userService.judgeUserIsInAllUserByUsername(username)) {
            model.addAttribute("username_error", "  用户名已存在！");
        } else {
            userService.saveUser(roleType, nickname, phoneNumber, address, username, password, remark);
            model.addAttribute("add_user_success", "添加用户成功！");
        }

        return "manager/addUser";
    }

    @RequestMapping(value = "/user-info", method = {RequestMethod.GET, RequestMethod.POST})
    public String userInfo() {
        return "manager/personal";
    }

    @RequestMapping(value = "/update-user-info", method = {RequestMethod.GET, RequestMethod.POST})
    public String updateUserInfo(@RequestParam("nickname") String nickname,
                                 @RequestParam("phone_number") String phoneNumber, @RequestParam("remark") String remark,
                                 @RequestParam("username") String username, @RequestParam("mail_address") String mailAddress,
                                 HttpServletRequest request) {
        userService.updateManagerInfoByUsername(nickname, phoneNumber, remark, username);
        HttpSession session = request.getSession();
        session.setAttribute("nickname", nickname);
        session.setAttribute("phone_number", phoneNumber);
        session.setAttribute("mail_address", mailAddress);
        session.setAttribute("remark", remark);
        return "manager/personal";
    }

    @RequestMapping(value = "/update-password", method = RequestMethod.GET)
    public String updatePassword() {
        return "manager/updatePassword";
    }

    @RequestMapping(value = "/update-password", method = RequestMethod.POST)
    public String updatePasswordByUsername(@RequestParam("username") String username, @RequestParam("old_password") String oldPssword,
                                           @RequestParam("password") String password, Model model) {
        User user = userService.getUserByUsername(username);
        if (!user.getPassword().equals(DecriptUtil.MD5(oldPssword))) {
            model.addAttribute("old_password_error", "  密码不正确，请重试！");
        } else {
            userService.updatePasswordByUsername(username, password);
            model.addAttribute("update_password_success", "密码更新成功！");
        }
        return "manager/updatePassword";
    }

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

}
