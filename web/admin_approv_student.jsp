<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<%!
    String id, email, fname,dob, sex, cont1,add,pin,cdate, ctime, course, status;
%>
<html>
    <head>
        <title>Approved Students</title>
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
            <div><img src="image/1.jpg"/></div>
            <div style="padding-top: 10px; text-align: center; color: #0186e2;font-weight: bold; font-size: 20px;padding-bottom: 10px;">APPROVED STUDENTS</div>
            <table border="2" align="center">
            	<tr style="color:#0000FF;">
                    <th>S.NO.</th>
                    <th>FIRST NAME</th>
                    <th>ID</th>
                    <th>EMAIL</th>
                    <th>D.O.B.</th>
                    <th>SEX</th>
                    <th>CONTACT</th>
                    <th>ADDRESS</th>
                    <th>PINCODE</th>
                    <th>C DATE</th>
                    <th>C TIME</th>
                    <th>COURSE</th>
                    
                </tr>
            <%
                int sno=0;
                Connection con=getConnection();
                try
                {
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from user where status='approved' ORDER BY u_fname");
                    while(rs.next())
                    {
                        id=rs.getString("u_id");
                        email=rs.getString("u_email");
                        fname=rs.getString("u_fname");
                        dob=rs.getString("u_dob");
                        sex=rs.getString("u_sex");
                        cont1=rs.getString("u_contact1");
                        add=rs.getString("u_address");
                        pin=rs.getString("u_pincode");
                        cdate=rs.getString("c_date");
                        ctime=rs.getString("c_time");
                        course=rs.getString("course_code");
                        status=rs.getString("status");
                        
                        sno++;
            %>
                <tr>
                    <td>
                        <%=sno%>
                    </td>
                    <td>
                        <%=fname%>
                    </td>
                    <td>
                        <%=id%>
                    </td>
                    <td>
                        <%=email%>
                    </td>
                    <td>
                        <%=dob%>
                    </td>
                    <td>
                        <%=sex%>
                    </td>
                    <td>
                        <%=cont1%>
                    </td>
                    <td>
                        <%=add%>
                    </td>
                    <td>
                        <%=pin%>
                    </td>
                    <td>
                        <%=cdate%>
                    </td>
                    <td>
                        <%=ctime%>
                    </td>
                    <td>
                        <%if(course=="")
                            out.print(course);
                          else
                            out.print("Not Enroll");
                        %>
                    </td>
                </tr>
            <%
                    }
                    closeConnection(con, st, rs);
                }catch(SQLException se){
                    se.printStackTrace();}
            %>
            </table>
</div></br>
<%@include file="html/head_foot/footer.html" %>
</body>
</html>