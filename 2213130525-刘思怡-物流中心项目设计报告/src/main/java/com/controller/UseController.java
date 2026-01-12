package com.controller;

import com.pojo.User;
import com.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UseController {
    private final UserService userService;
    private final HttpSession httpSession;

    @Autowired
    public UseController(UserService userService, HttpSession httpSession) {
        this.userService = userService;
        this.httpSession = httpSession;
    }

    @PostMapping(value = "/register", name = "注册")
    @ResponseBody
    public int useController(@RequestParam("name") String name,
                             @RequestParam("password") String password) {
        // 校验用户名不能为空
        if (name == null || name.trim().isEmpty()) {
            return -1;
        }
        // 校验密码不能为空
        if (password == null || password.trim().isEmpty()) {
            return -1;
        }
        try {
            User user = new User(name, password);
            return userService.addUser(user);
        } catch (RuntimeException e) {
            return -1;
        }
    }


    @PostMapping(value = "/login", name = "登录")
    @ResponseBody
    public int login(@RequestParam("name") String name,
                     @RequestParam("password") String password,
                     HttpSession session) {
        boolean isLoginSuccessful = userService.isLogin(name, password);
        if (isLoginSuccessful) {

            session.setAttribute("username", name);
            return 1;
        } else {
            return 0;
        }
    }

    @GetMapping("/checkLogin")
    @ResponseBody
    public int checkLogin(HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username!= null) {
            return 1;  // 表示已登录，因为在会话中能获取到用户名
        }
        return 0;  // 表示未登录，会话中不存在用户名属性
    }


    @ResponseBody
    @PutMapping("/change")
    public int changePassword(javax.servlet.http.HttpSession session,
                              @RequestParam("password") String password,
                              @RequestParam("newpassword") String newpassword) {

        if (session == null) {
            // 表示没有获取到有效的会话，可能用户未登录等情况，返回相应错误码，这里返回 -1
            return -1;
        }
        Object getid = session.getAttribute("id");
        if (getid == null) {
            return -1;
        }
        if (!(getid instanceof Integer)) {
            return -1;
        }
        int id = (Integer) getid;
        int result =userService.isChange(id, password, newpassword);
        return result;
    }

    @GetMapping("/getUser")
    @ResponseBody
    public int getUserInfo(HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username != null) {
        return userService.getNotice();
        }
        return -6;
    }

}
