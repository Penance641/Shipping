package com.service;


import com.pojo.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    int addUser(User user);//注册
    boolean isNameExist(String name);//名字存在
    boolean isLogin(String name,String password);//登录
    int isChange(int id,String oldpassword,String newpassword);//改密码
    int getNotice();
}