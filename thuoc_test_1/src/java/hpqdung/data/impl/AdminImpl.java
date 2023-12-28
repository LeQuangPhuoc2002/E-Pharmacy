/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hpqdung.data.impl;

import hpqdung.data.dao.AdminDao;
import hpqdung.data.driver.MySQLDriver;
import hpqdung.data.model.Admins;
import hpqdung.data.model.User;
import hpqdung.data.model.uadmin;
import hpqdung.utils.API;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class AdminImpl implements AdminDao {
   
    Connection con = MySQLDriver.getConnection();

    @Override
    public Admins findAdmin(String email, String password) {
        String sql;
        sql = "select * from admins where (email = '" + email + "' OR admin_username = '" + email + "') and admin_password = '" + API.getMd5(password) + "'";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            if (rs.next()) {
                return new Admins(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Admins findAdmin(String email) {
        String sql;
        sql = "select * from users where email = '" + email + "' OR username = '" + email + "' ";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            if (rs.next()) {
                return new Admins(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAdmin(String username, String password, String phonenumber, String name, String email) {
        String sql = "insert into users(username,password,phonenumber,name,email) values('" + username + "','" + password + "','" + phonenumber + "','" + name + "','" + email + "')";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            sttm.execute();
        } catch (SQLException ex) {
            Logger.getLogger(AdminImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
