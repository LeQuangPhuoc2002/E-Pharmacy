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
public class deleteproductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy product_id từ yêu cầu
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Gọi phương thức deleteProduct của DAO để xóa sản phẩm
        boolean success = Database.getProductDao().deleteProduct(productId);

        if (success) {
            // Nếu xóa thành công, chuyển hướng đến trang hiển thị danh sách sản phẩm
            response.sendRedirect(request.getContextPath() + "/adminServlet");
        } else {
            // Nếu xóa không thành công, chuyển hướng đến trang lỗi
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
