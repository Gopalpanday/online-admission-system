<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>

<!DOCTYPE html>
<%!
    String c1, c2;
%> 
<% 
    c1=request.getParameter("code");
    c2=request.getParameter("name");
    if(c1==null)
         c1="";
    if(c2==null)
         c2="";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Member</title>
        <style>input:focus, textarea:focus{background-color:#CCFFFF;}</style>
        <script type="text/javascript" src="js/admin_login.js"></script>
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
        <div style="text-align:center; font-size:16px;">
        <div style="padding-top: 10px;"><img src="image/24.jpg"/></div>
        <form action="adminAdminDao.jsp" method="POST" onsubmit="return isBlank1();">
        <div align="center" style="padding: 10px;">
            <div style="color:#0000cc; font-size: 20px; font-weight: bold;">ADD ADMIN</div> 
            <table style="font-size: 18px; text-align: center;">
                    <tr>
                        <td>
                            Admin ID
                        </td>
                        <td>
                            Password
                        </td>
                    </tr> 
                    <tr>
                        <td><input type="text" name="admin" id="admin"></input></td>
                        <td><input type="password" name="pass" id="pass"></input></td>
                    </tr>
                </table> 
                <div style="color: #335672;">Admin ID must be unique and All fields are mandatory !</div>
                <div style="text-align: center; padding-top: 5px;"><input type="image" name="cccc" value="add" src="image/20.jpg" alt="Submit" width="100" height="35"></input></div>
        </div>
        </form>
            <div align="center">-------------------------------------------------------------------------------------------------------------------------------------</div>
            <div align="center" style="padding: 10px;">
        <form action="adminAdminDao.jsp" method="POST" onsubmit="return isBlank2();">    
                <div style="color:#0000cc; font-size: 20px; font-weight: bold;">SEARCH ADMIN</div>
            <table style="font-size: 18px; text-align: center;">
                    <tr>
                        <td>
                            Admin ID <span style="color: red;">*</span>
                        </td>
                        <td>
                        <td><input type="text" name="admin_id" id="admin_id"></input></td>
                        </td>
                        <td>
                            <input type="image" name="cccc" value="search" src="image/22.jpg" alt="Submit" width="100" height="35"></input>
                        </td>
                        <td>
                            <input type="image" name="cccc" value="delete" src="image/23.jpg" alt="Submit" width="100" height="35"></input>
                        </td>
                    </tr> 
                    
                </table>
                <div style="text-align: center;"><img src="image/25.png"/></div>
        </form>
                <table style="font-size: 18px; text-align: center;">
                    <tr>
                        <td>
                            Admin ID
                        </td>
                        <td>
                            Password
                        </td>
                    </tr>
                    <tr>  
                        <td><input type="text" value="<%=c1%>"></input></td>
                        <td><input type="text" value="<%=c1%>"></input></td>
                    </tr>   
                </table>
                </div>
        </form>
        </div>                        
          
            <div style="clear:both; height:10px;"></div></br>
        <%@include file="html/head_foot/footer.html" %>
    </body>
</html>
