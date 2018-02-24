package com.onion.controller;

import com.onion.bean.User;
import com.onion.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by OnionMac on 2018/2/24.
 */
@Controller
public class HelloController {

    @Autowired
    UserService userService;

    @RequestMapping("hello")
    public String hello(ModelMap modelMap){

        User user = userService.getAllUser().get(0);
        modelMap.put("user",user);
        return "hello";
    }

    @RequestMapping("index")
    public String index(){
        return "homepage/index";
    }

    @RequestMapping("register")
    public String register(){
        return "user/accounts/registerSubmit";
    }
}
