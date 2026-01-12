package com.mapper;

import com.pojo.User;
import org.apache.ibatis.annotations.*;

public interface UserMapper {
    //    注册
    @Insert("INSERT  user (name, password) VALUES (#{name}, #{password})")
    @Options(useGeneratedKeys = true)
    int insertUser(User user);

    //    登录/改前置
    @Select("SELECT name,password FROM user WHERE name = #{name} and password=#{password}")
    User findUser(@Param("name") String name, @Param("password") String password);

    //获取id
    @Select("select id from user where name=#{name}")
    int getId(@Param("name")String name);

    // 修改用户和密码
    @Update("UPDATE user SET password = #{newpassword} WHERE id = #{id} AND password = #{password}")
    int updateUser(@Param("id") int id, @Param("newpassword") String newpassword, @Param("password") String password);

    // 查询用户名是否存在
    @Select("SELECT COUNT(*) FROM user WHERE name = #{name}")
    int countByName(String name);


//    通知
    @Select({
            "SELECT text FROM notice  <if test='type!= null'> WHERE type = #{type} </if> "

    })
    int getNotice();
}