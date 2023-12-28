/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hpqdung.data.impl;

import hpqdung.data.dao.UserDao;
import hpqdung.data.driver.MySQLDriver;
import hpqdung.data.model.User;
import hpqdung.utils.API;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class UserImpl implements UserDao {

    Connection con = MySQLDriver.getConnection();

//    public User findUser(String emailphone,String password){
//        String sql;
//        if(emailphone.contains("@"))
//            sql = "select * from users where email = '" + emailphone + "' and password = '" + API.getMd5(password) +"'";
//        else
//            sql = "select * from users where phone = '" + emailphone + "' and password = '" + API.getMd5(password) +"'";
//        try {    
//            PreparedStatement sttm = con.prepareStatement(sql);
//            ResultSet rs = sttm.executeQuery();
//            if(rs.next()){
//                return new User(rs);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
    public User findUser(String email, String password) {
        String sql;
        sql = "select * from users where (email = '" + email + "' OR username = '" + email + "') and password = '" + API.getMd5(password) + "'";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            if (rs.next()) {
                return new User(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User findUser(String email) {
        String sql;
        sql = "select * from users where email = '" + email + "' OR username = '" + email + "' ";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            if (rs.next()) {
                return new User(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insertUser(String username, String password, String phonenumber, String name, String email) {
        String insertUserSql = "INSERT INTO users (username, password, phonenumber, name, email) VALUES (?, ?, ?, ?, ?)";
        String insertCartSql = "INSERT INTO cart (user_id) VALUES (?)";

        try (PreparedStatement userSttm = con.prepareStatement(insertUserSql, Statement.RETURN_GENERATED_KEYS); PreparedStatement cartSttm = con.prepareStatement(insertCartSql)) {

            // Insert user
            userSttm.setString(1, username);
            userSttm.setString(2, password);
            userSttm.setString(3, phonenumber);
            userSttm.setString(4, name);
            userSttm.setString(5, email);
            userSttm.executeUpdate();

            // Lấy generatedKeys để lấy cart_id
            ResultSet generatedKeys = userSttm.getGeneratedKeys();
            int userId = -1;
            if (generatedKeys.next()) {
                userId = generatedKeys.getInt(1);
            }

            // Insert cart
            cartSttm.setInt(1, userId);
            cartSttm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
