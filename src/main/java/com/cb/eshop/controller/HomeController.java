package com.cb.eshop.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
public class HomeController {

    private Logger log = Logger.getLogger(HomeController.class);

    @RequestMapping("")
    public String getIndex(Model model) throws IOException {
        log.debug("return index page !!!!!!!!!!!!!!!!!!!!!!!***");
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!");

        return "index";
    }
}
