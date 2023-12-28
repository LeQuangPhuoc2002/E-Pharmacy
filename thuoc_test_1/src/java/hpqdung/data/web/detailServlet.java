/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.Cart;
import hpqdung.data.model.Category;
import hpqdung.data.model.Comment;
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
public class detailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product_id = request.getParameter("product_id");
        System.out.println("Product ID: " + product_id);

        List<Category> listCategory = Database.getCategoryDao().findAll();
        request.setAttribute("listCategory", listCategory);

        List<Product> listProduct = Database.getProductDao().findAll();
        request.setAttribute("listProduct", listProduct);

        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            handleAuthenticatedUser(request, user, product_id);
        } else {
            handleGuestUser(request, product_id);
        }

        if (product_id != null && !product_id.isEmpty()) {
            int id = Integer.parseInt(product_id);
            Product product = Database.getProductDao().findProduct(id);
            List<Comment> listComment = Database.getCommentDao().getAllCommentsByProduct(id);
            request.setAttribute("listComment", listComment);
            System.out.println(listComment);
            request.setAttribute("product", product);
        }

        request.getRequestDispatcher("./detail.jsp").include(request, response);
    }

    private void handleAuthenticatedUser(HttpServletRequest request, User user, String product_id) {
        try {
            int userId = user.getUser_id();
            System.err.println(userId);

            List<Cart> listCart = Database.getCartDao().findAll(userId);
            request.setAttribute("listCart", listCart);

            HttpSession session = request.getSession();
            session.setAttribute("listCart", listCart);

            if (product_id != null && !product_id.isEmpty()) {
                int id = Integer.parseInt(product_id);
                Product product = Database.getProductDao().findProduct(id);
                List<Comment> listComment = Database.getCommentDao().getAllCommentsByProduct(id);
                request.setAttribute("listComment", listComment);
                System.out.println(listComment);
                request.setAttribute("product", product);
            }
        } catch (NumberFormatException e) {
            handleInvalidFormat(request, "user", e);
        }
    }

    private void handleGuestUser(HttpServletRequest request, String product_id) {
        if (product_id != null && !product_id.isEmpty()) {
            try {
                int id = Integer.parseInt(product_id);
                Product product = Database.getProductDao().findProduct(id);
                request.setAttribute("product", product);
            } catch (NumberFormatException e) {
                handleInvalidFormat(request, "product", e);
            }
        }
    }

    private void handleInvalidFormat(HttpServletRequest request, String type, NumberFormatException e) {
        request.setAttribute("error_message", "Invalid " + type + " ID format: " + e.getMessage());
        e.printStackTrace();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
