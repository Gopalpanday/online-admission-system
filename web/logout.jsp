<%
String val=request.getParameter("logout");
if(val.equals("admin"))
{
    session.removeAttribute("admin_id");
    response.sendRedirect("admin_login.jsp");
}

if(val.equals("student"))
{
    session.removeAttribute("email");
    response.sendRedirect("user_login.jsp");
}

%>
