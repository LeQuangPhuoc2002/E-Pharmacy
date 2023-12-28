/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.Category;
import hpqdung.data.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import static jdk.internal.org.jline.utils.Colors.s;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author admin
 */
public class adminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        List<Product> listProduct = Database.getProductDao().findAll();

        request.setAttribute("listProduct", listProduct);
        List<Category> listCategory = Database.getCategoryDao().findAll();
        request.setAttribute("listCategory", listCategory);
        String searchQuery = request.getParameter("search_query");

        if (searchQuery != null && !searchQuery.isEmpty()) {
            // Nếu có tham số tìm kiếm, thực hiện truy vấn tương đối
                List<Product> searchResults = Database.getProductDao().searchProductsByName(searchQuery);
            request.setAttribute("listProduct", searchResults);
        } else {
            // Nếu không có tham số tìm kiếm, hiển thị toàn bộ danh sách sản phẩm
            List<Product> allProducts = Database.getProductDao().findAll();
            request.setAttribute("listProduct", allProducts);
        }

        request.setAttribute("title", "home page");
        request.getRequestDispatcher("./admin.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
