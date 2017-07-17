package com.cb.eshop.controller;

import com.cb.eshop.service.interfaces.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/")
public class ManageController {

    private Logger log = Logger.getLogger(ManageController.class);

    @Resource
    private IUserService userService;

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
        if(userService.judgeUserIsInAllUserByUsername(username)) {
            model.addAttribute("username_error", "  用户名已存在！");
        } else {
            userService.saveUser(roleType, nickname, phoneNumber, address, username, password, remark);
            model.addAttribute("add_user_success", "添加用户成功！");
        }

        return "manager/addUser";
    }
}
