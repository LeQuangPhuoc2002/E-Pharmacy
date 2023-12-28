/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package hpqdung.data.web;

import hpqdung.data.dao.Database;
import hpqdung.data.model.User;
import hpqdung.utils.API;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class registerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       
        request.setAttribute("title", "Register Page");
        request.getRequestDispatcher("./register.jsp").include(request, response);     
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String err_email = "", err_phone="", err_repassword="",err_usename="";
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword"); 
        
        String Email_Regex = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
        String Phone_Regex="^\\d{10}$";
        String username_Regex = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
        
        boolean err = false;
        
//        if(!email.matches(Email_Regex)){
//            err = true;
//            err_email = "Invalid email!!!";
//            request.getSession().setAttribute("err_email", err_email);
//        }
//        else{
//            err_email = "";
//            request.getSession().removeAttribute("err_email");
//        }
//        
//        if(!username.matches(username_Regex)){
//            err = true;
//            err_usename = "Invalid username!!!";
//            request.getSession().setAttribute("err_usename", err_email);
//        }
//        else{
//            err_usename = "";
//            request.getSession().removeAttribute("err_usename");
//        }
//        
//        if(!phone.matches(Phone_Regex)){
//            err = true;
//            err_phone = "Phone has 10 digits!";
//            request.getSession().setAttribute("err_phone", err_phone);
//        }
//        else{
//            err_phone = "";
//            request.getSession().removeAttribute("err_phone");
//        }
//        
//        if(!repassword.matches(password)){
//            err = true;
//            err_repassword = "Not match password!!!";
//            request.getSession().setAttribute("err_repassword", err_repassword);
//        }
//        else{
//            err_repassword = "";
//            request.getSession().removeAttribute("err_repassword");
//        }
//         
        if(err){
            request.getSession().setAttribute("exist_user", "Đăng kí không thành công");
            response.sendRedirect("loginServlet");
        }
        else{
            if(Database.getUserDao().findUser(email)!= null || Database.getUserDao().findUser(phone)!= null){
                request.getSession().setAttribute("exist_user", "User has existed in Database!!");
                response.sendRedirect("registerServlet");
            }
            else{
                Database.getUserDao().insertUser(username,API.getMd5(password),phone,name, email);
                User user = Database.getUserDao().findUser(email);
                request.getSession().setAttribute("user",user);
                request.getSession().removeAttribute("exist_user");
                response.sendRedirect("indexServlet");
            }
        }
    }
       
}
