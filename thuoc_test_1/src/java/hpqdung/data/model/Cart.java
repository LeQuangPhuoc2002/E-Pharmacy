/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hpqdung.data.model;

/**
 *
 * @author admin
 */
public class Cart {

    int id_cart_item;
    int id_cart;
    int id_product;
    int quantity;
    String product_name;
    double price;
    String image;

    public Cart(int id_cart_item, int id_cart, int id_product, int quantity, String product_name, double price, String image) {
        this.id_cart_item = id_cart_item;
        this.id_cart = id_cart;
        this.id_product = id_product;
        this.quantity = quantity;
        this.product_name = product_name;
        this.price = price;
        this.image = image;
    }

    public int getId_cart_item() {
        return id_cart_item;
    }

    public void setId_cart_item(int id_cart_item) {
        this.id_cart_item = id_cart_item;
    }

    public int getId_cart() {
        return id_cart;
    }

    public void setId_cart(int id_cart) {
        this.id_cart = id_cart;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

   
    
}
