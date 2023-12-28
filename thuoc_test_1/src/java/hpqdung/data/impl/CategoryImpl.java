/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hpqdung.data.impl;

import hpqdung.data.driver.MySQLDriver;
import hpqdung.data.dao.CategoryDao;
import hpqdung.data.model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class CategoryImpl implements CategoryDao {
    Connection con = MySQLDriver.getConnection();
    @Override
    public List<Category> findAll(){
        List<Category> listCategory = new ArrayList<>();
        String sql = "select * from categories";
        try {    
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            while(rs.next()){
                int category_id = rs.getInt("category_id");
                String category_name = rs.getString("category_name");
                String category_image = rs.getString("category_image");
                
                listCategory.add(new Category(category_id,category_name,category_image));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCategory;
    }
    
    @Override 
    public boolean insert(Category category){
        return true;
    }
    @Override 
    public boolean update(Category category){
        return true;
    }
    @Override 
    public boolean delete(int id){
        return true;
    }
    
    @Override       
    public Category find(int id){
        return null;
    }
}
