package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.Category;
import hpqdung.data.model.Product;
import hpqdung.data.model.Producta;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@MultipartConfig
public class addproductServlet extends HttpServlet {

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

        request.setAttribute("title", "Thêm sản phẩm");
        request.getRequestDispatcher("/addproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String uploadPath = "C:\\Users\\admin\\OneDrive\\Documents\\NetBeansProjects\\thuoc_test_1\\web\\assets\\Image";

        // Xử lý phần lưu trữ ảnh
        Part filePart = request.getPart("file_img");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, Paths.get(uploadPath, fileName), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException ex) {
                // Xử lý ngoại lệ khi lưu trữ ảnh thất bại
                ex.printStackTrace();
                response.sendRedirect(request.getContextPath() + "./error.jsp");
                return;
            }

            // Tiếp tục xử lý thêm sản phẩm vào cơ sở dữ liệu
            String productName = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String description = request.getParameter("description");

            // Thêm xử lý cho ảnh nếu cần
            String imagePath = fileName; // Đường dẫn ảnh trong thư mục web

            Producta newProduct = new Producta(categoryId, productName, imagePath, price, quantity, description);

            // Gọi phương thức insert của DAO để thêm sản phẩm vào cơ sở dữ liệu
            boolean success = Database.getProductDao().insertProduct(newProduct);

            if (success) {
                // Nếu thêm thành công, chuyển hướng đến trang hiển thị danh sách sản phẩm
                System.out.println("thành công rồi");
                response.sendRedirect(request.getContextPath() + "/adminServlet");
            } else {
                // Nếu thêm không thành công, chuyển hướng đến trang lỗi
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } else {
            // Xử lý khi không có ảnh được chọn
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
