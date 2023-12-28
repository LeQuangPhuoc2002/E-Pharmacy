package hpqdung.data.web;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import hpqdung.data.dao.Database;
import hpqdung.data.model.User;
import hpqdung.data.model.UserGoogleDto;
import hpqdung.data.web.Constants;
import hpqdung.utils.API;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 * @author heaty566
 */
public class LoginGoogleHandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto user = getUserInfo(accessToken);
        System.out.println("hpqdung.data.web.LoginGoogleHandler.processRequest()");
        System.out.println(user);
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        return googlePojo;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the +
    // sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto user = getUserInfo(accessToken);

        String name = user.getName();
        String email = user.getEmail();
        String password = user.getGiven_name();
        String phonenumber = user.getId();
        String username = user.getGiven_name();
        System.out.println(name + email + password + phonenumber + username);
        boolean err = false;

        if (err) {
            request.getSession().setAttribute("exist_user", "Đăng kí không thành công");
            response.sendRedirect("loginServlet");
        } else {
            if (Database.getUserDao().findUser(email) != null || Database.getUserDao().findUser(phonenumber) != null) {
                User userss = Database.getUserDao().findUser(email, password);
                if (user == null) {
                    request.getSession().setAttribute("error_login", "Nhập sai tài khoản hoặc mật khẩu");
                    request.getRequestDispatcher("./login.jsp").include(request, response);
                } else {
                    request.getSession().setAttribute("user", userss);
                    request.getSession().removeAttribute("error_login");
                    response.sendRedirect("indexServlet");
                }
            } else {
                Database.getUserDao().insertUser(username, API.getMd5(password), phonenumber, name, email);
                User users = Database.getUserDao().findUser(email);
                request.getSession().setAttribute("user", users);
                request.getSession().removeAttribute("exist_user");
                response.sendRedirect("indexServlet");
            }
        }
//        System.out.println(user);
//        request.getRequestDispatcher("indexServlet").include(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("indexServlet").include(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
