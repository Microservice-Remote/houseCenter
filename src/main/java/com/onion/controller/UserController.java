package com.onion.controller;

import com.onion.bean.User;
import com.onion.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Administrator on 2018/2/23 0023.
 */
@RestController
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("getAllUser")
    public List<User> getAllUser(){
        return userService.getAllUser();
    }


}
