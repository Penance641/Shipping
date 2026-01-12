package com.controller;

import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    @Autowired
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    // 删除用户
    @DeleteMapping("/deleteUser")
    @ResponseBody
    public boolean deleteUserById(@RequestParam("id") int id) {
        return adminService.dealUser("delete", id) == 1;
    }

    // 删除快递
    @DeleteMapping("/deletePost")
    @ResponseBody
    public boolean deletePostByPid(@RequestParam("pid") int pid) {
        return adminService.dealPost("delete", pid) == 1;
    }

    // 发布公告
    @PostMapping("/insertNotice")
    @ResponseBody
    public boolean insertNotice(@RequestParam("text") String text) {
        return adminService.addNotice(text);
    }

    // 新增用户（根据之前定义的AdminService接口的dealUser方法，添加此操作对应的接口）
    @PostMapping("/insertUser")
    @ResponseBody
    public boolean insertUser(@RequestParam("name") String name, @RequestParam("password") String password) {
        return adminService.dealUser("insert", 0) == 1;
    }

    // 更新用户
    @PutMapping("/updateUser")
    @ResponseBody
    public boolean updateUser(@RequestParam("id") int id, @RequestParam("name") String name) {
        return adminService.dealUser("update", id) == 1;
    }

    // 新增快递
    @PostMapping("/insertPost")
    @ResponseBody
    public boolean insertPost(@RequestParam("pname") String pname, @RequestParam("puc") String puc) {
        return adminService.dealPost("insert", 0) == 1;
    }

    // 更新快递
    @PutMapping("/updatePost")
    @ResponseBody
    public boolean updatePost(@RequestParam("pid") int pid) {
        return adminService.dealPost("update", pid) == 1;
    }
}