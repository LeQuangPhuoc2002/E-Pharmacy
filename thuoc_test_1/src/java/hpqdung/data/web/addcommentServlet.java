package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.Category;
import hpqdung.data.model.Product;
import hpqdung.data.model.Producta;
import hpqdung.data.model.User;
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

public class addcommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product_id = request.getParameter("productID");
        String commentText = request.getParameter("commentText");
   

        User user = (User) request.getSession().getAttribute("user");
        System.out.println("đây là commet");
        System.out.println(product_id + " " + commentText);
        int a = Integer.parseInt(product_id);
       
        Database.getCommentDao().addComment(user.getUser_id(), a, commentText);

        request.getRequestDispatcher("detailServlet?product_id="+product_id).include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
