/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package hpqdung.data.dao;

import hpqdung.data.model.Admins;
import hpqdung.data.model.User;

/**
 *
 * @author admin
 */
public interface AdminDao {
    public Admins findAdmin(String email,String password);
    public Admins findAdmin(String emailphone);
    public void insertAdmin(String username,String password,String phonenumber,String name,String email);
}
