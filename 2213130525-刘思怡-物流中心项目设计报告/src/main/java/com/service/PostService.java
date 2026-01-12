package com.service;

import com.pojo.Post;
import com.pojo.Pstate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PostService {
    int addPost(Post post);//寄快递
    int changePost(Pstate pstate);//收快递
    Post findPost(String puc,String name); // 查快递，根据快递单号和用户ID查询快递信息

}
