<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>

<!DOCTYPE html>
<%!
    String id, email, fname, lname, dob, sex,cont1, cont2, add, city, state, pin, status, course, cdate, ctime;
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/add_course.js"></script>
        <style>input:focus, textarea:focus{background-color:#CCFFFF;}</style>
        <title>Admin Students</title>
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
        <div style="padding-top: 10px;"><img src="image/18.jpg"/></div>
            <div style="font-size: 20px; text-align:center;"><a href="admin_approv_student.jsp">View Approved Student</a></div></br>
            <div style="font-size: 20px; text-align:center;"><a href="admin_not_approved_student.jsp">View Not Approved Student</a></div></br>
            <div style="font-size: 20px; text-align:center;"><a href="admin_all_student.jsp">View All Student</a></div></br>
        </div>
        <div align="center">-------------------------------------------------------------------------------------------------------------------------------------</div>
        <form action="studentApproved_RejectDao.jsp" method="POST" onsubmit="return isBlank4();"> 
            <div style="text-align:center; font-size:16px;">
                <div style="color:#0000cc; font-size: 20px; font-weight: bold;">STUDENT APPROVED OR REJECTED (DELETE)</div>
            <table align="center"style="font-size: 18px; text-align: center;">
                    <tr>
                        <td>
                            Enrollment no. <span style="color: red;">*</span>
                        </td>
                        <td>
                        <td><input type="text" name="enroll" id="enroll"></input></td>
                        </td>
                        <td>
                            <input type="image" name="cccc" value="approve" src="image/27.gif" alt="Submit" width="110" height="55"></input>
                        </td>
                        <td>
                            <input type="image" name="cccc" value="reject" src="image/28.gif" alt="Submit" width="110" height="55"></input>
                        </td>
                    </tr>              
                </table>
                <div><span style="color: red;">Enrollment no. contain only number</span></div>
            </div>
        </form>
        
            <div style="clear:both; height:10px;"></div></br>
        <%@include file="html/head_foot/footer.html" %>
    </body>
</html>
