package com.service;

import com.mapper.PostMapper;
import com.mapper.UserMapper;
import com.pojo.Post;
import com.pojo.Pstate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PostServiceImpl implements PostService{
    @Resource
    private final PostMapper postMapper;
    private final UserMapper userMapper;
    public PostServiceImpl(PostMapper postMapper, UserMapper userMapper) {
        this.postMapper = postMapper;
        this.userMapper = userMapper;
    }

    @Override
    public int addPost(Post post) {
        return postMapper.insertPost(post);
    }

    @Override
    public int changePost(Pstate pstate) {
        return postMapper.updatePostStatus("已收件");
    }

    @Override
    public Post findPost(String puc, String name) {
        Post post = postMapper.findPost(puc, name);
        return post;
    }


}
