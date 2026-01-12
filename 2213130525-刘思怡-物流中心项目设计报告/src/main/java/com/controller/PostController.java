package com.controller;

import com.pojo.Post;
import com.pojo.Pstate;
import com.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/post")
public class PostController {

    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    // 寄快递
    @PostMapping("/add")
    public int addPost(@RequestBody Post post) {
        return postService.addPost(post);
    }

    // 收快递
    @PutMapping("/change")
    public int changePost(@RequestBody Pstate pstate) {
        return postService.changePost(pstate);
    }

    // 查快递
    @GetMapping("/find")
    public Post findPost(@RequestParam("puc") String puc, @RequestParam("name") String name) {
        return postService.findPost(puc, name);
    }

}