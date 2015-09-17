<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<!DOCTYPE html>
<%!
    String id, email, fname, dob, cont1,add, city,status;
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Student</title>
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
            <%
                email=String.valueOf(session.getAttribute("email"));
                Connection con=getConnection();
                try
                {
                    Statement st=con.createStatement();              
                    ResultSet rs=st.executeQuery("select * from user where u_email= '"+email+"';");
                    while(rs.next())
                    {
                        id=rs.getString("u_id");
                        email=rs.getString("u_email");
                        fname=rs.getString("u_fname");
                        dob=rs.getString("u_dob");
                        cont1=rs.getString("u_contact1");
                        add=rs.getString("u_address");
                        status=rs.getString("status");                    

                    }
                    closeConnection(con, st, rs);
                }catch(SQLException se){
                    se.printStackTrace();}
            %>
            <div style="text-align: center; font-size:36px; color:#003399; font-style:italic; font-stretch:extra-condensed; text-align: center;">Welcome <%=fname%></div>
            <div style="padding-top: 10px; text-align: center;"><img src="image/16.jpg"/></div>
            <div style="padding: 50px;">
            <table align="center" style="font-size:18px;">
                <tr>
                    <td>
        		 Enrollment no. : 
                    </td>
                    <td>         
                        <% if("Approved".equals(status))
                           {%><div style="color:#5a768f; font-weight:bold;">
                            <%out.print(id);}else{%>
                            </div> 
                            <div style="color: #cc0000;">
                         <%out.print("Not approved by Admin");}%>
                            </div>
                    </td>  
                </tr>
                <tr>
                    <td>
        		 Email or Login ID : 
                    </td>
                    <td>         
                            <div style="color:#5a768f; font-weight:bold;">
                            <%out.print(email);%>
                            </div> 
                    </td>  
                </tr>
                <tr>
                    <td>
        		 First Name : 
                    </td>
                    <td>         
                            <div style="color:#5a768f; font-weight:bold;">
                            <%out.print(fname);%>
                            </div> 
                    </td>  
                </tr>
                <tr>
                    <td>
        		 Date of Birth : 
                    </td>
                    <td>         
                            <div style="color:#5a768f; font-weight:bold;">
                            <%out.print(dob);%>
                            </div> 
                    </td>  
                </tr>
                <tr>
                    <td>
        		 Contact no. : 
                    </td>
                    <td>         
                            <div style="color:#5a768f; font-weight:bold;">
                            <%out.print(cont1);%>
                            </div> 
                    </td>  
                </tr>
                <tr>
                    <td>
                         Address : 
                    </td>
                    <td>         
                            <div style="color:#5a768f; font-weight:bold;">
                            <%out.print(add);%>
                            </div> 
                    </td>  
                </tr>
            </table>                           
            </div>
            <form action="logout.jsp" method="POST">
            <div style="text-align: center; padding-top: 5px;"><input type="image" name="logout" value="student" src="image/14.gif" alt="Submit" width="130" height="55"></input></div>
            </form>
            <div style="clear:both; height:10px;"></div></br>
        <%@include file="html/head_foot/footer.html" %>
    </body>
</html>
