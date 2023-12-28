/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hpqdung.data.model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class User {
    int user_id;
    String username;
    String password;  
    String phonenumber; 
    String name;
    String email;

    public User(ResultSet rs) throws SQLException{
        this.user_id = rs.getInt("user_id");
        this.username = rs.getString("username");
        this.password = rs.getString("password");
        this.phonenumber = rs.getString("phonenumber");
        this.name = rs.getString("name");
        this.email = rs.getString("email");
    }
      
    public User(int user_id, String username, String password, String phonenumber, String name, String email) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.phonenumber = phonenumber;
        this.name = name;
        this.email = email;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   
   
}
