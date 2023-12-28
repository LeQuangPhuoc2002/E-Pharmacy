<%
    request.getSession().removeAttribute("user");  
    request.getSession().removeAttribute("cart");  
    response.sendRedirect(request.getContextPath()+"/indexServlet");
%>