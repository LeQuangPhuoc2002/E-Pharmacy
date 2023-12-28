/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.Admins;
import hpqdung.data.model.Category;
import hpqdung.data.model.Product;
import hpqdung.data.model.User;
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
public class adminloginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
          
        List<Product> listProduct = Database.getProductDao().findAll();
         
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("title", "home page");
        request.getRequestDispatcher("./admin_login.jsp").include(request, response);
    }

    
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Admins admin = Database.getAdminDao().findAdmin(email, password);
         
        if(admin == null){
            request.getSession().setAttribute("error_login", "Nhập sai tài khoản hoặc mật khẩu");
            request.getRequestDispatcher("./admin_login.jsp").include(request, response);        
        }
        else{
            request.getSession().setAttribute("admin", admin);
            request.getSession().removeAttribute("error_login");
            response.sendRedirect("adminServlet"); 
        }
    }


}
