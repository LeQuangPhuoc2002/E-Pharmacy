/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hpqdung.data.impl;

import hpqdung.data.dao.ProductDao;
import hpqdung.data.driver.MySQLDriver;
import hpqdung.data.model.Product;
import java.sql.Connection;
import java.util.List;
import hpqdung.data.model.Category;
import hpqdung.data.model.Producta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class ProductImpl implements ProductDao {

    Connection con = MySQLDriver.getConnection();

    @Override
    public List<Product> findAll() {
        List<Product> listProduct = new ArrayList<>();

        String sql = "select * from products";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int category_id = rs.getInt("category_id");
                String product_name = rs.getString("product_name");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");

                listProduct.add(new Product(product_id, category_id, product_name, image, price, quantity, description));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

    public Product findProduct(int id_product) {
        String sql = "select * from products where product_id=" + id_product;
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            if (rs.next()) {
                return new Product(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> findAllWithCategories(int id) {
        List<Product> listProduct = new ArrayList<>();

        String sql = "SELECT p.product_id, p.category_id, p.product_name, p.image, p.price, p.quantity, p.description, c.category_name , c.category_image "
                + "FROM products p "
                + "JOIN categories c ON p.category_id = c.category_id";

        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int category_id = rs.getInt("category_id");
                String product_name = rs.getString("product_name");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                String category_name = rs.getString("category_name");
                String category_image = rs.getString("category_image");

                // Tạo đối tượng Product và Category để thêm vào danh sách
                Category category = new Category(category_id, category_name, category_image);
                listProduct.add(new Product(product_id, category_id, product_name, image, price, quantity, description));

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

    @Override
    public boolean insertProduct(Producta product) {
        String sql = "INSERT INTO products (category_id, product_name, image, price, quantity, description) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = MySQLDriver.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, product.getCategory_id());
            preparedStatement.setString(2, product.getProduct_name());
            preparedStatement.setString(3, product.getImage());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setInt(5, product.getQuantity());
            preparedStatement.setString(6, product.getDescription());

            // Thực hiện truy vấn chèn dữ liệu
            int rowsAffected = preparedStatement.executeUpdate();

            // Kiểm tra xem dữ liệu đã được chèn thành công hay không
            if (rowsAffected > 0) {
                System.out.println("Thêm sản phẩm thành công.");
                return true;
            } else {
                System.out.println("Thêm sản phẩm không thành công.");
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    @Override
    public boolean deleteProduct(int productId) {
        // Thực hiện truy vấn xóa sản phẩm từ cơ sở dữ liệu
        Connection con = null;
        try {
            con = MySQLDriver.getConnection();
            String sql = "DELETE FROM products WHERE product_id = ?";
            try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
                preparedStatement.setInt(1, productId);

                // Thực hiện truy vấn xóa
                int rowsAffected = preparedStatement.executeUpdate();

                // Kiểm tra xem sản phẩm đã được xóa thành công hay không
                return rowsAffected > 0;
            }
        } catch (SQLException ex) {
            // Xử lý ngoại lệ SQL
            ex.printStackTrace();
            return false;
        } finally {
            // Đóng kết nối sau khi hoàn tất
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public boolean updateProduct(Product updatedProduct) {
        String sql = "UPDATE products SET category_id = ?, product_name = ?, image = ?, price = ?, quantity = ?, description = ? WHERE product_id = ?";

        try (Connection connection = MySQLDriver.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, updatedProduct.getCategory_id());
            preparedStatement.setString(2, updatedProduct.getProduct_name());
            preparedStatement.setString(3, updatedProduct.getImage());
            preparedStatement.setDouble(4, updatedProduct.getPrice());
            preparedStatement.setInt(5, updatedProduct.getQuantity());
            preparedStatement.setString(6, updatedProduct.getDescription());
            preparedStatement.setInt(7, updatedProduct.getProduct_id());

            // Thực hiện truy vấn cập nhật
            int rowsAffected = preparedStatement.executeUpdate();

            // Kiểm tra xem dữ liệu đã được cập nhật thành công hay không
            return rowsAffected > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public List<Product> searchProductsByName(String searchQuery) {
        List<Product> searchResults = new ArrayList<>();

        String sql = "SELECT * FROM products WHERE product_name LIKE ? OR description LIKE ?";
        try (Connection connection = MySQLDriver.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Thêm dấu % vào đầu và cuối chuỗi để thực hiện tìm kiếm tương đối
            String searchPattern = "%" + searchQuery + "%";
            preparedStatement.setString(1, searchPattern);
            preparedStatement.setString(2, searchPattern);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int category_id = rs.getInt("category_id");
                String product_name = rs.getString("product_name");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");

                searchResults.add(new Product(product_id, category_id, product_name, image, price, quantity, description));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return searchResults;
    }

    
}
