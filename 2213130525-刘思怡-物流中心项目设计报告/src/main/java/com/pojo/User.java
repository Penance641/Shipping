package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    int id;
    String name;
    String password;
    int level;
    int score;

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

}
