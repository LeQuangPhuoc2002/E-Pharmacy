/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package hpqdung.data.dao;

import hpqdung.data.model.User;

/**
 *
 * @author admin
 */
public interface UserDao {
    public User findUser(String email,String password);
    public User findUser(String emailphone);
    public void insertUser(String username,String password,String phonenumber,String name,String email);
}
