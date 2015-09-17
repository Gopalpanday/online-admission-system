<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>

<!DOCTYPE html>
<%!
    String admin_id;
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Admin</title>
        <script>
            function validate()
            {
                <%
                    if(session.getAttribute("admin_id") == null)
                    {
                        response.sendRedirect("invalid.jsp"); 
                    }
                %>
            }
        </script>
    </head>
    <body onload="validate()"> 
        <%@include file="html/head_foot/admin_header.html" %>
        <%
              admin_id=String.valueOf(session.getAttribute("admin_id"));     
        %>
            <div style="text-align: center; font-size:36px; color:#003399; font-style:italic; font-stretch:extra-condensed; text-align: center;">Welcome <%=admin_id%></div>
            <div style="padding-top: 10px; text-align: center;"><img src="image/17.jpg"/></div>
            <div style="text-align: center;">
                <p><strong>1. Hello Admin you are able to view, remove and approved the registered student.</strong></p>
                <p><strong>2. You are add update and delete the courses.</strong></p>
                <p><strong>3. You are also check the student registered date and time.</strong></p>
                <p><strong>4. You have to add or modify more admin member's.</strong></p>
                
            </div>
            
            <div style="padding: 50px;">
                <form action="logout.jsp" method="POST">
            <div style="text-align: center; padding-top: 5px;"><input type="image" name="logout" value="admin" src="image/14.gif" alt="Submit" width="130" height="55"></input></div>
                </form>

        <%@include file="html/head_foot/footer.html" %>
    </body>
</html>
