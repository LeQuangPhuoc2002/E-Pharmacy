/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package hpqdung.data.dao;

import hpqdung.data.model.Category;
import java.util.List;

/**
 *
 * @author admin
 */
public interface CategoryDao {

    public List<Category> findAll();

    public boolean insert(Category category);

    public boolean update(Category category);

    public boolean delete(int id);

    public Category find(int id);
}
