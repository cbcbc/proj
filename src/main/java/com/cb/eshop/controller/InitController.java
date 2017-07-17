package com.cb.eshop.controller;

import com.cb.eshop.model.User;
import com.cb.eshop.service.interfaces.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class InitController {

    private Logger log = Logger.getLogger(InitController.class);

    @Resource
    private IUserService userService;

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

}
