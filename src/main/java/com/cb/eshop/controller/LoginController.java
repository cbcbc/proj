package com.cb.eshop.controller;

import com.cb.eshop.model.User;
import com.cb.eshop.service.interfaces.IUserService;
import com.cb.eshop.utils.DecriptUtil;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
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
public class LoginController {

    private Logger log = Logger.getLogger(LoginController.class);

    @Resource
    private IUserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginWithoutParams() {
        return "/login";
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public String index(@RequestParam("username") String username,
                        @RequestParam("password") String password, Model model, HttpServletRequest request) {
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();

        UsernamePasswordToken upToken = new UsernamePasswordToken(username, DecriptUtil.MD5(password));
        upToken.setRememberMe(false);
        try {
            currentUser.login(upToken);
            User user = userService.getUserByUsername(username);
            HttpSession session = request.getSession();
            session.setAttribute("nickname", user.getNickname());
            session.setAttribute("phone_number", user.getPhoneNumber());
            session.setAttribute("address", user.getAddress());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("remark", user.getRemark());
            if (currentUser.hasRole("0")) {
                session.setAttribute("role_type", "普通用户");
                return "ordinaryuser/index";
            } else if (currentUser.hasRole("1")) {
                session.setAttribute("role_type", "销售商");
                return "seller/index";
            } else if (currentUser.hasRole("2")) {
                session.setAttribute("role_type", "管理员");
                return "forward:/admin-init?pageId=0";
            }

        } catch (IncorrectCredentialsException | UnknownAccountException e) {
            model.addAttribute("loginError", "账号或密码不正确，请重新输入！");
        } catch (LockedAccountException lae) {
            model.addAttribute("loginError", "账户已被冻结！");
            System.out.println("账户已被冻结！");
        } catch (AuthenticationException ae) {
            System.out.println(ae.getMessage());
        }

        return "login";
    }

    @RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
    public String logout() {
        SecurityUtils.getSubject().logout();

        return "login";
    }
}
