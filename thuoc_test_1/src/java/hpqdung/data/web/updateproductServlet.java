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
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@MultipartConfig
public class updateproductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve product information from the database based on product_id
        String productIdString = request.getParameter("productId");
        List<Category> listCategory = Database.getCategoryDao().findAll();
        request.setAttribute("listCategory", listCategory);

        try {
            if (productIdString != null && !productIdString.isEmpty()) {
                int productId = Integer.parseInt(productIdString);
                Product product = Database.getProductDao().findProduct(productId);

                // Forward to the edit product page and pass the product information
                request.setAttribute("product", product);
                request.getRequestDispatcher("/editproduct.jsp").forward(request, response);
            } else {
                // Handle the case when productId is not provided
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle the case when productId is not a valid integer
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Retrieve information from the form to update the product
            int productId = Integer.parseInt(request.getParameter("productId"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String productName = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String description = request.getParameter("description");

            // Process the file upload
            String imagePath = handleFileUpload(request, productId);

            // Create a new Product object with the updated information
            Product updatedProduct = new Product(productId, categoryId, productName, imagePath, price, quantity, description);

            // Call the update method in the DAO to update the product in the database
            boolean success = Database.getProductDao().updateProduct(updatedProduct);

            if (success) {
                // If the update is successful, redirect to the product list or product details page
                response.sendRedirect(request.getContextPath() + "/adminServlet");
            } else {
                // If the update is not successful, redirect to the error page
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle the case when a numeric value cannot be parsed
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private String handleFileUpload(HttpServletRequest request, int productId) throws IOException, ServletException {
        Part filePart = request.getPart("file_img");

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = "C:\\Users\\admin\\OneDrive\\Documents\\NetBeansProjects\\thuoc_test_1\\web\\assets\\Image";

            try (InputStream input = filePart.getInputStream()) {
                Path filePath = Paths.get(uploadPath, fileName);
                Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
                return fileName;
            }
        } else {
            // If no new file is uploaded, retrieve the existing image path from the database
            Product existingProduct = Database.getProductDao().findProduct(productId);
            return existingProduct.getImage();
        }
    }

}
