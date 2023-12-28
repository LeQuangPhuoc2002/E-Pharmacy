/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package hpqdung.data.dao;

import hpqdung.data.model.Category;
import hpqdung.data.model.Product;
import hpqdung.data.model.Producta;
import java.util.List;

/**
 *
 * @author admin
 */
public interface ProductDao {

    public List<Product> findAll();

    public Product findProduct(int id_product);

    public List<Product> findAllWithCategories(int id);

    public boolean insertProduct(Producta product);

    boolean deleteProduct(int productId);

    public boolean updateProduct(Product updatedProduct);
    
    public List<Product> searchProductsByName(String searchQuery) ;
}
