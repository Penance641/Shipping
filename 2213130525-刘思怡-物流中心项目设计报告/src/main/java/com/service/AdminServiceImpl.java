package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;

    @Autowired
    public AdminServiceImpl(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    // 用户
    @Override
    public int dealUser(String type, int id) {
        switch (type) {
            case "insert":
                return adminMapper.addUser(null, null)? 1 : 0;  // 这里暂时传入null，实际使用时需传入具体的用户名和密码参数

            case "delete":
                return adminMapper.deleteById(id)? 1 : 0;

            case "update":
                return adminMapper.updateUser(null,id)? 1 : 0;

            default:
                return -1;
        }
    }


    @Override
    public int dealPost(String type, int pid) {
        switch (type) {
            case "insert":
                return adminMapper.addPost(null, null)? 1 : 0;

            case "delete":
                return adminMapper.deletePost(pid)? 1 : 0;

            case "update":
                return adminMapper.updatePost(pid)? 1 : 0;

            default:
                return -1;
        }
    }

    // 公告
    @Override
    public boolean addNotice(String text) {
        return adminMapper.insert(text);

    }
}