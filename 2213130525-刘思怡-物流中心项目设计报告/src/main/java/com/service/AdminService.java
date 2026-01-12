package com.service;

import org.springframework.stereotype.Service;

@Service
public interface AdminService {
    // 用户
    int dealUser(String type, int id);

    // 快递
    int dealPost(String type, int pid);

    // 公告
    boolean addNotice(String text);
}