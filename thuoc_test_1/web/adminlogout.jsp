<%
    request.getSession().removeAttribute("admin");  
    request.getSession().removeAttribute("cart");  
    response.sendRedirect(request.getContextPath()+"/adminloginServlet");
%>