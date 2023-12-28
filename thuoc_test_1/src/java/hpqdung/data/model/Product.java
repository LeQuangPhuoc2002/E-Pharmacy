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
public class Product {

    int product_id;
    int category_id;
    String product_name;
    String image;
    double price;
    int quantity;
    String description;

    public Product(int product_id, int category_id, String product_name, String image, double price, int quantity, String description) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.product_name = product_name;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
    }

    public Product(ResultSet rs) throws SQLException {
        this.product_id = rs.getInt("product_id");
        this.category_id = rs.getInt("category_id");
        this.product_name = rs.getString("product_name");
        this.image = rs.getString("image");
        this.price = rs.getDouble("price");
        this.quantity = rs.getInt("quantity");
        this.description = rs.getString("description");
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
