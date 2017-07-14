package com.cb.eshop.controller;

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

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();

        UsernamePasswordToken upToken = new UsernamePasswordToken(username, DecriptUtil.MD5(password));
        upToken.setRememberMe(false);
        try {
            currentUser.login(upToken);
            if (currentUser.hasRole("0")) {
                return "ordinaryuser/index";
            } else if (currentUser.hasRole("1")) {
                return "seller/index";
            } else if (currentUser.hasRole("2")) {
                return "manager/index";
            }

        } catch (IncorrectCredentialsException ice) {
            model.addAttribute("loginError", "账号或密码不正确，请重新输入！");
        } catch (UnknownAccountException lae) {
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
        return "logout";
    }
}
