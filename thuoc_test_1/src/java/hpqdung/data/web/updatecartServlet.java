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
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import static jdk.internal.org.jline.utils.Colors.s;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author admin
 */
public class updatecartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String quantity = request.getParameter("quantity");
        String productId = request.getParameter("productID");
        
        int quantityy = Integer.valueOf(quantity);
        int productIdd = Integer.valueOf(productId);
        Database.getCartDao().updateProductCart(user.getUser_id(), productIdd, quantityy);
        request.getRequestDispatcher("cartServlet").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
