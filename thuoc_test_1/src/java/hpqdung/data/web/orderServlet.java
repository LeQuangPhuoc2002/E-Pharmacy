package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.Cart;
import hpqdung.data.model.User;

import java.io.IOException;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class orderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String totalPrice = request.getParameter("totalPrice");
        String finaltotal = request.getParameter("finaltotal");
        String address = request.getParameter("address");
        
        List<Cart> listCart = Database.getCartDao().findAll(user.getUser_id());

        String email = user.getEmail();
        String name = user.getName();
        String phonenumber = user.getPhonenumber();
        // Đường dẫn đến tệp văn bản
        String filePath = "C:\\Users\\admin\\OneDrive\\Desktop\\order.txt";

        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

            // Ghi thông tin thời gian vào tệp
            writer.println("Thời Gian Đặt Hàng: " + currentTime.format(formatter));
            // Ghi thông tin cá nhân vào tệp
            writer.println("Họ và Tên: " + name);
            writer.println("Email: " + email);
            writer.println("Số Điện Thoại: " + phonenumber);
            writer.println("Địa Chỉ: " + address);
            writer.println("--------------------------------------"); // Dòng trống giữa các mục

            // Lặp qua danh sách sản phẩm trong giỏ hàng và ghi thông tin vào tệp
            for (int i = 0; i < listCart.size(); i++) {

                Cart cartItem = listCart.get(i);
                String productName = cartItem.getProduct_name(); // Thay bằng phương thức lấy tên sản phẩm từ Cart
                int quantity = cartItem.getQuantity();
                double price = cartItem.getPrice();
                double total = price * quantity;

                // Ghi thông tin sản phẩm vào tệp
                writer.println("Tên Sản Phẩm: " + productName);
                writer.println("Giá mỗi sản phẩm: $" + price);
                writer.println("Số Lượng: " + quantity);
                writer.println("Tổng Giá cho Mỗi Mục: $" + total);
                System.out.println("hello");
                writer.println(); // Dòng trống giữa các mục
            }
            // Ghi thông tin tổng cộng và phí ship vào tệp
            writer.println("----------------------------------------");
            writer.println("Tổng Tất Cả: $" + totalPrice);
            writer.println("Phí Vận Chuyển: $10");
            writer.println("Tổng Đơn Hàng: $" + finaltotal);

            System.out.println("Thông tin đã được ghi vào tệp: " + filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Database.getCartDao().removeAllProductsFromCart(user.getUser_id());
        request.getRequestDispatcher("indexServlet").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Phương thức doPost trống, bạn có thể thêm logic xử lý nếu cần
    }
}
