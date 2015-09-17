<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>

<!DOCTYPE html>
<%!
    String email, status, course, cname;
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/add_course.js"></script>
        <title>Student Course</title>
    <script>
            function validate()
            {
                <%
                    if(session.getAttribute("email") == null)
                    {
                        response.sendRedirect("invalid.jsp"); 
                    }
                %>
            }
        </script>
    </head>
    <body onload="validate()">
        <%@include file="html/head_foot/student_header.html" %>
        <div style="text-align:center; font-size:16px;">
        <div style="padding-top: 10px;"><img src="image/19.jpg"/></div>
        
        <%
            email=String.valueOf(session.getAttribute("email"));
            Connection con=getConnection();
                try
                {
                    Statement st=con.createStatement();              
                    ResultSet rs=st.executeQuery("select * from user where u_email= '"+email+"';");
                    while(rs.next())
                    {
                        email=rs.getString("u_email");
                        course=rs.getString("course_code");
                        status=rs.getString("status");                    

                    }
                    rs=st.executeQuery("select * from course where c_code= '"+course+"';");
                    while(rs.next())
                    {
                        cname=rs.getString("c_name");                  
                    }
                    closeConnection(con, st, rs);
                }catch(SQLException se){
                    se.printStackTrace();}
        %>
        <div style="text-align: center; font-size:36px; color:#003399; font-style:italic; font-stretch:extra-condensed; text-align: center;">
                <% if("".equals(course))
                        out.print("YOU ARE NOT ENROLL ANY COURSE");                       
                    else
                       out.print("("+course+")"+" : "+cname);  
                %>
        </div>
        <form action="courseSelectDao.jsp" method="POST" onsubmit="return isBlank3();">
        <div align="center" style="padding-top: 50px;">
            <div style="color:#0000cc; font-size: 20px; font-weight: bold;">ENROLL THE COURSE</div> </br>
            <%
                 if("Approved".equals(status))
                 {
                     if(!"".equals(course))
                     {%>
                            <%out.print("YOUR ARE ALREADY ENROLLED THE COURSE");}else{
                            %>
                    <select name="course_c" id="course_c">
                    <option value="select">Select</option>
                    <%
                        email=String.valueOf(session.getAttribute("email"));
                        con=getConnection();
                        try
                        {
                            Statement st=con.createStatement();              
                            ResultSet rs=st.executeQuery("select c_code from course");
                            while(rs.next())
                            {
                                course=rs.getString("c_code");
                                %>
                                <option value=<%=course%>><%=course%></option>
                                <%

                            }
                            closeConnection(con, st, rs);
                        }catch(SQLException se){se.printStackTrace();}
            %>                
                 
                 
                    
                    </select></br>
                    <div style="text-align: center; padding-top: 5px;"><input type="image" name="cccc" value="add" src="image/20.jpg" alt="Submit" width="100" height="35"></input></div>
                            </div> </form>
                                         <% }}else{%>

                            <div style="color: #cc0000;">
                         <%out.print("YOUR ARE NOT SELECTED ANY COURSE\n BECAUSE YOU ARE NOT APPROVED BY ADMIN");}
            
            %>
                            </div>
        
        
        </div>
            
            <div style="clear:both; height:10px;"></div></br>
             
        <%@include file="html/head_foot/footer.html" %>
    </body>
</html>

