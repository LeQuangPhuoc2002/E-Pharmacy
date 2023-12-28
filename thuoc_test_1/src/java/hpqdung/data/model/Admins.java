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
public class Admins {
    int admin_id;
    String admin_username;
    String admin_password;  
    String phonenumber; 
    String email;
    String name;

    public Admins(ResultSet rs) throws SQLException{
        this.admin_id = rs.getInt("admin_id");
        this.admin_username = rs.getString("admin_username");
        this.admin_password = rs.getString("admin_password");
        this.phonenumber = rs.getString("phonenumber");
        this.email = rs.getString("email");
        this.name = rs.getString("name");
    }

    public Admins(int admin_id, String admin_username, String admin_password, String phonenumber, String email, String name) {
        this.admin_id = admin_id;
        this.admin_username = admin_username;
        this.admin_password = admin_password;
        this.phonenumber = phonenumber;
        this.email = email;
        this.name = name;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_username() {
        return admin_username;
    }

    public void setAdmin_username(String admin_username) {
        this.admin_username = admin_username;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
      
    

   
   
}
