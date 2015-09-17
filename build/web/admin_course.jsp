<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>

<!DOCTYPE html>
<%!
    String c1, c2, c3, c4, c5;
%> 
<% 
    c1=request.getParameter("code");
    c2=request.getParameter("name");
    c3=request.getParameter("duration");
    c4=request.getParameter("type");
    c5=request.getParameter("fees");
    if(c1==null)
         c1="";
    if(c2==null)
         c2="";
    if(c3==null)
         c3="";
    if(c4==null)
         c4="";
    if(c5==null)
         c5="";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/add_course.js"></script>
        <style>input:focus, textarea:focus{background-color:#CCFFFF;}</style>
        <title>Admin Course</title>
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
        <div style="padding-top: 10px;"><img src="image/19.jpg"/></div>
        <form action="adminCourseDao.jsp" method="POST" onsubmit="return isBlank();">
        <div align="center" style="padding: 10px;">
            <div style="color:#0000cc; font-size: 20px; font-weight: bold;">ADD COURSES</div> 
            <table style="font-size: 18px; text-align: center;">
                    <tr>
                        <td>
                            Course Code
                        </td>
                        <td>
                            Course Name
                        </td>
                        <td>
                            Course Duration
                        </td>
                        <td>
                            Course Type
                        </td>
                        <td>
                            Course Fees
                        </td>
                    </tr> 
                    <tr>
                        <td><input type="text" name="code" id="code"></input></td>
                        <td><input type="text" name="name" id="name"></input></td>
                        <td><select name="duration" id="duration">
                                <option value="select">Select</option>
                            <option value="6 Months">6 Month</option>
                            <option value="1 Year">1 Year</option>
                            <option value="2 Year">2 Year</option>
                            <option value="3 Year">3 Year</option>
                            <option value="4 Year">4 Year</option>
                            <option value="5 Year">5 Year</option>
                            <option value="6 Year">6 Year</option>
                            </select></td>
                            <td><select name="type" id="type">
                                    <option value="select">Select</option>
                            <option value="Qurarterly">Quarterly</option>
                            <option value="Semester">Semester</option>
                            <option value="Yearly">Yearly</option>
                            </select></input></td>
                        <td><input type="text" name="fees" id="fees"></input></td>
                    </tr>
                </table> 
                <div style="color: #335672;">Course Code must me unique, Fees contain only numbers and All fields are mandatory !</div>
                <div style="text-align: center; padding-top: 5px;"><input type="image" name="cccc" value="add" src="image/20.jpg" alt="Submit" width="100" height="35"></input></div>
        </div>
        </form>
            <div align="center">-------------------------------------------------------------------------------------------------------------------------------------</div>
            <div align="center" style="padding: 10px;">
        <form action="adminCourseDao.jsp" method="POST" onsubmit="return isBlank1();">    
                <div style="color:#0000cc; font-size: 20px; font-weight: bold;">MODIFY COURSES</div>
            <table style="font-size: 18px; text-align: center;">
                    <tr>
                        <td>
                            Course Code <span style="color: red;">*</span>
                        </td>
                        <td>
                        <td><input type="text" name="code1" id="code1" value="<%=c1%>"></input></td>
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
        <form action="adminCourseDao.jsp" method="POST" onsubmit="return isBlank2();">
                <table style="font-size: 18px; text-align: center;">
                    <tr>
                        <td>
                            Course Code
                        </td>
                        <td>
                            Course Name
                        </td>
                        <td>
                            Course Duration
                        </td>
                        <td>
                            Course Type
                        </td>
                        <td>
                            Course Fees
                        </td>
                    </tr>
                    <tr>  
                        <td><input type="text" name="course1" id="course1" value="<%=c1%>"></input></td>
                        <td><input type="text" name="name1" id="name1" value="<%=c2%>"></input></td>
                        <td><input type="text" name="duration1" id="duration1" value="<%=c3%>"></input></td>
                        <td><input type="text" name="type1" id="type1" value="<%=c4%>"></input></td>
                        <td><input type="text" name="fees1" id="fees1" value="<%=c5%>"></input></td>
                    </tr>   
                </table>
                <div style="color: #335672;">Fees contain only numbers and All fields are mandatory !</div>
                <div style="text-align: center; padding-top: 5px;">       
                    <input type="image" name="cccc" value="update" src="image/21.jpg" alt="Submit" width="100" height="35"></input>
                </div>
        </form>
        </div> 
            <div align="center">-------------------------------------------------------------------------------------------------------------------------------------</div>
            <div align="center" style="padding: 10px;">
                <div style="color:#0000cc; font-size: 20px; font-weight: bold;">VIEW ALL COURSES</div>
                <%@include file="course_view.jsp" %>
                <div style="clear:both; height:10px;"></div></br> 
        <%@include file="html/head_foot/footer.html" %>
    </body>
</html>