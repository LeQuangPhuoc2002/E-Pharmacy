package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class addtocartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // Người dùng chưa đăng nhập, chuyển hướng về trang đăng nhập
            String loginUrl = request.getContextPath() + "/loginServlet";
            response.sendRedirect(loginUrl);
            return;
        }

        int productId = Integer.parseInt(request.getParameter("product_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            Database.getCartDao().insertToCart(user.getUser_id(), productId, quantity);
        } catch (Exception e) {
            // Xử lý ngoại lệ một cách phù hợp, có thể in ra log hoặc hiển thị thông báo lỗi
            e.printStackTrace();
        }

        // Chuyển hướng (redirect) người dùng về trang hiện tại
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Có thể thêm xử lý cho phương thức POST nếu cần
    }
}
