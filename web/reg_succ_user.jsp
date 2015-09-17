<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@include file="connect.jsp" %>

<!DOCTYPE html>
<%!
    String c_code, c_name, c_dur, c_type, c_fees;
%>
<html>
    <head>
        <title>User Registered</title>
    </head>
    <body>
        <%@include file="html/head_foot/header.html" %>
        <div style="text-align:center; font-size:16px;">
            <div><img src="image/12.gif"/></div></br>
            <table align="center">
                <td><a href="user_login.jsp"><img border="0"src="image/13.gif" width="150" height="70"><a/></td>
            </table>
        </div></br>
        <%@include file="html/head_foot/footer.html" %>
        
    </body>
</html>
