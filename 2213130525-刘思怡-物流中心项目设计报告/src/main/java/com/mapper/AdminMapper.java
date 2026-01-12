package com.mapper;

import org.apache.ibatis.annotations.*;


public interface AdminMapper {
    //用户
    @Insert("insert into user(name,password) values (#{name},#{password})")
    boolean addUser(@Param("name") String name, @Param("password") String password);
    @Delete("delete * from user where id=#{id}")
    boolean deleteById(int id);
    @Update("UPDATE user SET name = #{name} WHERE id = #{id} ")
    boolean updateUser(@Param("name") String name, @Param("id") int id);

    //快递
    @Insert("insert into post(pname,puc) values (#{pname},#{puc})")
    boolean addPost(@Param("pname") String pname, @Param("puc") String puc);
    @Delete("delete * from post where pid=#{pid}")
    boolean deletePost(int pid);
    @Update("UPDATE post SET pstate = '已退回' WHERE pid = #{pid} ")
    boolean updatePost(@Param("pid") int pid);

    //公告
    @Insert("insert into notice(text) values (#{text})")
    boolean insert(@Param("text") String text);
}
