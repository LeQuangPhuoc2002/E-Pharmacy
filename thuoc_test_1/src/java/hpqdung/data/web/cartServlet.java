/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.Cart;
import hpqdung.data.model.Category;
import hpqdung.data.model.Product;
import hpqdung.data.model.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class cartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        List<Category> listCategory = Database.getCategoryDao().findAll();
        request.setAttribute("listCategory", listCategory);

        // Kiểm tra xem người dùng     // Lấy giá trị user_id từ session
      
        if (user != null) {
            try {
                int userId = user.getUser_id(); // Giả sử có một phương thức getId() trong lớp User
                System.err.println(userId);

                // Lấy danh sách giỏ hàng của người dùng
                List<Cart> listCart = Database.getCartDao().findAll(userId);

                // Đặt danh sách giỏ hàng vào request để hiển thị trên trang JSP
                request.setAttribute("listCart", listCart);

                // Lưu listCart vào session
                HttpSession session = request.getSession();
                session.setAttribute("listCart", listCart);
                request.getRequestDispatcher("./cart.jsp").include(request, response);
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid user ID format: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            request.getRequestDispatcher("./cart.jsp").include(request, response);
        }
       
    }

}
