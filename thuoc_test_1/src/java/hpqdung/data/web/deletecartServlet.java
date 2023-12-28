/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.Product;
import hpqdung.data.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class deletecartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xóa giỏ hàng
        User user = (User) request.getSession().getAttribute("user");
        int productId = Integer.parseInt(request.getParameter("productID"));

        Database.getCartDao().removeProductFromCart(user.getUser_id(), productId);
        
        request.getRequestDispatcher("cartServlet").include(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
