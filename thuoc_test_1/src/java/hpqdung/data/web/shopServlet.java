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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import static jdk.internal.org.jline.utils.Colors.s;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author admin
 */
public class shopServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        User user = (User) request.getSession().getAttribute("user");
        // Lấy giá trị của tham số categoryId từ URL
        List<Category> listCategory = Database.getCategoryDao().findAll();
        request.setAttribute("listCategory", listCategory);

        // Lấy giá trị từ tham số search_query
        // Lấy giá trị từ tham số search_query
        String searchQuery = request.getParameter("search_query");
        request.setAttribute("search_query", searchQuery);
        if (searchQuery != null) {
            // Gọi hàm tìm kiếm với query
            List<Product> searchResults = Database.getProductDao().searchProductsByName(searchQuery);

            // Đưa kết quả vào attribute để hiển thị trong JSP
            request.setAttribute("listProduct", searchResults);
        } else {
            List<Product> listProduct = Database.getProductDao().findAll();
            request.setAttribute("listProduct", listProduct);

            try {
                String categoryId = request.getParameter("categoryId");
                int cate_id = Integer.parseInt(categoryId);
                List<Product> listProductwithcategory = Database.getProductDao().findAllWithCategories(cate_id);

                request.setAttribute("categoryId", categoryId);
                request.setAttribute("listProductwithcategory", listProductwithcategory);

            } catch (Exception e) {
                e.printStackTrace();
            }

            // Trong đây, bạn có thể sử dụng categoryId để truy vấn cơ sở dữ liệu và lấy danh sách sản phẩm của danh mục đó.
            // ...
            // Kiểm tra xem người dùng có tồn tại hay không
        }
        List<Product> productList = Database.getProductDao().findAll();

        String sortBy = request.getParameter("sortBy");

        // Kiểm tra sortBy có tồn tại và không rỗng
        if (sortBy != null && !sortBy.isEmpty()) {
            // Sắp xếp danh sách sản phẩm dựa trên giá
            sortProductList(productList, sortBy);

            // Đặt danh sách đã sắp xếp vào thuộc tính request
            request.setAttribute("listProduct", productList);
            request.setAttribute("sortBy", sortBy);
        }

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
                request.getRequestDispatcher("./shop.jsp").include(request, response);
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid user ID format: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            request.getRequestDispatcher("./shop.jsp").include(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
// Hàm lấy danh sách sản phẩm (giả sử)

    private void sortProductList(List<Product> productList, String sortBy) {
        if ("priceLowToHigh".equals(sortBy)) {
            // Sắp xếp từ thấp đến cao
            Collections.sort(productList, new Comparator<Product>() {
                @Override
                public int compare(Product p1, Product p2) {
                    return Double.compare(p1.getPrice(), p2.getPrice());
                }
            });
        } else if ("priceHighToLow".equals(sortBy)) {
            // Sắp xếp từ cao đến thấp
            Collections.sort(productList, new Comparator<Product>() {
                @Override
                public int compare(Product p1, Product p2) {
                    return Double.compare(p2.getPrice(), p1.getPrice());
                }
            });
        }
    }

    private void showUserCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        // Kiểm tra xem người dùng có tồn tại hay không
        if (user != null) {
            // ... Các dòng mã khác

            try {
                int userId = user.getUser_id();
                System.err.println(userId);

                // Lấy danh sách giỏ hàng của người dùng
                List<Cart> listCart = Database.getCartDao().findAll(userId);

                // Đặt danh sách giỏ hàng vào request để hiển thị trên trang JSP
                request.setAttribute("listCart", listCart);

                // Lưu listCart vào session
                HttpSession session = request.getSession();
                session.setAttribute("listCart", listCart);

                // Chuyển hướng đến trang shop.jsp
                request.getRequestDispatcher("./shop.jsp").include(request, response);
            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid user ID format: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            // Chuyển hướng đến trang shop.jsp
            request.getRequestDispatcher("./shop.jsp").include(request, response);
        }
    }
}
