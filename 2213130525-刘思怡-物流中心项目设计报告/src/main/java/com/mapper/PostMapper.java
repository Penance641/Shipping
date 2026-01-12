package com.mapper;

import com.pojo.Post;
import com.pojo.Pstate;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface PostMapper {
    // 用户寄快递
    @Insert("insert into post(pname, uid, puc) values(#{pname}, #{uid}, #{puc})")
    @Options(useGeneratedKeys = true)
    int insertPost(Post post);

    // 查快递
    @Select("SELECT p.pname, p.pstate, p.pid, p.uname FROM post p JOIN user u ON p.uname = u.name WHERE p.puc = #{puc} ")
    Post findPost(@Param("puc") String puc, @Param("uname") String uname);

    // 收快递
    @Update("UPDATE post SET pstate = '已取件' WHERE puc = #{puc} ")
    int updatePostStatus(@Param("puc") String puc);


}