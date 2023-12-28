/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package hpqdung.data.dao;

import hpqdung.data.model.Category;
import hpqdung.data.model.Product;
import hpqdung.data.model.User;
import hpqdung.data.model.Cart;
import java.util.List;

/**
 *
 * @author admin
 */
public interface CartDao {
    public List<Cart> findAll(int id);
    public void insertToCart(int userId, int productId, int quantity);
    public void removeProductFromCart(int userId, int productId);
    public void updateProductCart(int userId, int productId, int quantity);
    public void removeAllProductsFromCart(int userId);
}
