package com.service;

import com.mapper.UserMapper;
import com.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
    @Override
    @Transactional
    public int addUser(User user) {

        if (user.getName() == null || user.getName().trim().isEmpty()) {
            throw new RuntimeException("用户名不能为空");
        }

        if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
            throw new RuntimeException("密码不能为空");
        }

        if (isNameExist(user.getName())) {
            throw new RuntimeException("用户名已存在");
        }

        return userMapper.insertUser(user);
    }

    @Override
    public boolean isNameExist(String name) {
        int count = userMapper.countByName(name);
        return count > 0;
    }

    @Override
    public boolean isLogin(String name, String password) {
        User user = userMapper.findUser(name, password);

        return user!= null;
    }

    @Override
    public int isChange(int id, String password, String newpassword) {


        int updated = userMapper.updateUser(id, password, newpassword);
        if (updated > 0) {
            return 1;
        }
        return 0;
    }

    @Override
    public int getNotice() {
        return userMapper.getNotice();
    }



}
