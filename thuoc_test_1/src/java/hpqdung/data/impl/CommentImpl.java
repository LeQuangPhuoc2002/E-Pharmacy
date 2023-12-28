package hpqdung.data.impl;

import hpqdung.data.dao.AdminDao;
import hpqdung.data.dao.CommentDao;
import hpqdung.data.driver.MySQLDriver;
import hpqdung.data.model.Comment;
import hpqdung.data.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CommentImpl implements CommentDao {

    Connection con = MySQLDriver.getConnection();

    @Override
    public void addComment(int userID, int productID, String commentText) {
        String sql = "INSERT INTO Comments (user_id, product_id, CommentText) VALUES (?, ?, ?)";

        try (Connection connection = MySQLDriver.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Thiết lập giá trị cho các tham số
            preparedStatement.setInt(1, userID);
            preparedStatement.setInt(2, productID);
            preparedStatement.setString(3, commentText);

            // Thực thi câu lệnh SQL
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ theo cách của bạn
        }
    }

    public List<Comment> getAllCommentsByProduct(int productID) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT c.*, u.name "
                + "FROM comments c "
                + "JOIN users u ON c.user_id = u.user_id "
                + "WHERE c.product_id = ?";

        try (PreparedStatement sttm = con.prepareStatement(sql)) {
            sttm.setInt(1, productID);
            ResultSet rs = sttm.executeQuery();

            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentID(rs.getInt("CommentID"));
                comment.setUser_id(rs.getInt("user_id"));
                comment.setProduct_id(rs.getInt("product_id"));
                comment.setCommentText(rs.getString("CommentText"));

                // Thêm thông tin về người dùng
                comment.setName(rs.getString("name"));

                comments.add(comment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return comments;
    }

}
