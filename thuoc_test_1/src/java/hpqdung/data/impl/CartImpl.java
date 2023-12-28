package hpqdung.data.impl;

import hpqdung.data.dao.CartDao;
import hpqdung.data.driver.MySQLDriver;
import hpqdung.data.model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CartImpl implements CartDao {

    private Connection con = MySQLDriver.getConnection();

    public List<Cart> findAll(int userId) {
        List<Cart> listCart = new ArrayList<>();

        String sql = "SELECT cart_item.*, products.product_name, products.price, products.image "
                + "FROM cart_item "
                + "JOIN products ON cart_item.product_id = products.product_id "
                + "WHERE cart_item.cart_id = (SELECT cart_id FROM cart WHERE user_id = ?)";

        try (PreparedStatement sttm = con.prepareStatement(sql)) {
            sttm.setInt(1, userId);

            try (ResultSet rs = sttm.executeQuery()) {
                while (rs.next()) {
                    int idCartItem = rs.getInt("cart_item_id");
                    int idCart = rs.getInt("cart_id");
                    int idProduct = rs.getInt("product_id");
                    int quantity = rs.getInt("quantity");
                    String productName = rs.getString("product_name");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");

                    listCart.add(new Cart(idCartItem, idCart, idProduct, quantity, productName, price, image));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCart;
    }

    // ... Các phương thức khác ...
    public void insertToCart(int userId, int productId, int quantity) {
        Connection con = null;
        PreparedStatement sttm = null;

        try {
            con = MySQLDriver.getConnection();
            con.setAutoCommit(false);  // Tắt chế độ tự động commit để có thể kiểm soát giao dịch

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            String checkIfExistsSql = "SELECT * FROM cart_item\n"
                    + "WHERE cart_id IN (SELECT cart_id FROM cart WHERE user_id = ?)\n"
                    + "AND product_id = ?;";

            sttm = con.prepareStatement(checkIfExistsSql);
            sttm.setInt(1, userId);
            sttm.setInt(2, productId);

            ResultSet rs = sttm.executeQuery();

            if (rs.next()) {
                // Sản phẩm đã tồn tại trong giỏ hàng, cộng thêm vào số lượng
                int existingQuantity = rs.getInt("quantity");
                int newQuantity = existingQuantity + quantity;

                String updateQuantitySql = "UPDATE cart_item\n"
                        + "SET quantity = ?\n"
                        + "WHERE cart_id = (SELECT cart_id FROM cart WHERE user_id = ?)\n"
                        + "AND product_id = ?;";
                sttm = con.prepareStatement(updateQuantitySql);
                sttm.setInt(1, newQuantity);
                sttm.setInt(2, userId);
                sttm.setInt(3, productId);

                sttm.executeUpdate();
            } else {
                // Sản phẩm chưa có trong giỏ hàng, thêm mới
                String insertSql = "INSERT INTO cart_item (cart_id, product_id, quantity)\n"
                        + "VALUES ((SELECT cart_id FROM cart WHERE user_id = ?), ?, ?);";
                sttm = con.prepareStatement(insertSql);
                sttm.setInt(1, userId);
                sttm.setInt(2, productId);
                sttm.setInt(3, quantity);

                sttm.executeUpdate();
            }

            // Commit giao dịch
            con.commit();
        } catch (SQLException ex) {
            try {
                // Rollback giao dịch nếu có lỗi
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            // Đảm bảo đóng tài nguyên
            try {
                if (con != null) {
                    con.setAutoCommit(true);  // Bật lại chế độ tự động commit trước khi đóng kết nối
                    con.close();
                }
                if (sttm != null) {
                    sttm.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }

    public void updateProductCart(int userId, int productId, int quantity) {
        Connection con = null;
        PreparedStatement sttm = null;

        try {
            con = MySQLDriver.getConnection();
            con.setAutoCommit(false);

            String updateQuantitySql = "UPDATE cart_item\n"
                    + "SET quantity = ?\n"
                    + "WHERE cart_id = (SELECT cart_id FROM cart WHERE user_id = ?)\n"
                    + "AND product_id = ?;";
            sttm = con.prepareStatement(updateQuantitySql);
            sttm.setInt(1, quantity);
            sttm.setInt(2, userId);
            sttm.setInt(3, productId);

            sttm.executeUpdate();

            // Kiểm tra xem quantity có là 0 sau khi cập nhật không
            if (quantity == 0) {
                removeProductFromCart(userId, productId);
            }

            // Commit giao dịch
            con.commit();
        } catch (SQLException ex) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
                if (sttm != null) {
                    sttm.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }

    public void removeProductFromCart(int userId, int productId) {
        Connection con = null;
        PreparedStatement sttm = null;

        try {
            con = MySQLDriver.getConnection();
            con.setAutoCommit(false);

            // Xóa sản phẩm cụ thể từ giỏ hàng
            String deleteProductSql = "DELETE FROM cart_item\n"
                    + "WHERE cart_id IN (SELECT cart_id FROM cart WHERE user_id = ?)\n"
                    + "AND product_id = ?;";

            sttm = con.prepareStatement(deleteProductSql);
            sttm.setInt(1, userId);
            sttm.setInt(2, productId);

            sttm.executeUpdate();

            // Commit giao dịch
            con.commit();
        } catch (SQLException ex) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
                if (sttm != null) {
                    sttm.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }

    public void removeAllProductsFromCart(int userId) {
        Connection con = null;
        PreparedStatement sttm = null;

        try {
            con = MySQLDriver.getConnection();
            con.setAutoCommit(false);

            // Xóa tất cả sản phẩm từ giỏ hàng
            String deleteAllProductsSql = "DELETE FROM cart_item\n"
                    + "WHERE cart_id IN (SELECT cart_id FROM cart WHERE user_id = ?);";

            sttm = con.prepareStatement(deleteAllProductsSql);
            sttm.setInt(1, userId);

            sttm.executeUpdate();

            // Commit giao dịch
            con.commit();
        } catch (SQLException ex) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            ex.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
                if (sttm != null) {
                    sttm.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }

}
