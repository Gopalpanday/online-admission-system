<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%!
    String email, fname,lname,cont1,add, pin,pass;
%> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Update</title>
        <style>input:focus, textarea:focus{background-color:#CCFFFF;}</style>
        <script type="text/javascript" src="js/user_reg.js"></script> 
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
                        email=rs.getString("u_email");
                        fname=rs.getString("u_fname");
                        lname=rs.getString("u_lname");
                        cont1=rs.getString("u_contact1");
                        add=rs.getString("u_address");
                        pin=rs.getString("u_pincode"); 
                        pass=rs.getString("u_pass");                                          

                    }
                    closeConnection(con, st, rs);
                }catch(SQLException se){
                    se.printStackTrace();}
            %>
        <form action="updateStudentDao.jsp" method="POST" onsubmit="return isBlank1();">
        <div align="center">
	<table style="font-size:18px;">
        <tr>
        	<td>
        		First Name :<span style="color: red;">*</span></br></br>
            </td>
            <td>
        		<input type="text" size="30" name="fname"id="fname" value="<%=fname%>"></br></br>
            </td>
        </tr>
        <tr>
        	<td>
        		Last Name :</br></br>
                </td>
            <td>
        		<input type="text" size="30" name="lname" value="<%=lname%>"></br></br>
            </td>
        </tr>  
        <tr>
        	<td>
        		Contact :<span style="color: red;">*</span>
            </td>
            <td>
        		<input type="text" size="30" name="contact-1"id="contact" value="<%=cont1%>"></br>
            </td>
        </tr>
        <tr>
        	<td></td>
        	<td style="font-size:14px;"><span style="color: #335672;">Contact no. contain only number's</span><td></br>
        </tr>
        <tr>
        	<td>
        		Address :<span style="color: red;">*</span></br></br>
            </td>
            <td>
        		<textarea rows="5" cols="24" name="address"id="address"><%=add%></textarea></br></br>
            </td>
        </tr>
        <tr>
        	<td>
        		Pincode :<span style="color: red;">*</span>
            </td>
            <td>
        		<input type="text" size="30" name="pincode"id="pin" value="<%=pin%>"></br>
            </td>
        </tr>
        <tr>
        	<td></td>
        	<td style="font-size:14px;"><span style="color: #335672;">Pincode contain only number's</span><td></br>
        </tr>
        <tr>
        	<td>
        		Password :<span style="color: red;">*</span>
            </td>
            <td>
        		<input type="password" size="30" name="pass"id="pass" value="<%=pass%>"></br>
            </td>
        </tr>
        <tr>
        	<td></td>
        	<td style="font-size:14px;"><span style="color: #335672;">Please Re-enter the password</span><td></br>
        </tr>
        <tr>
        	<td>
        		Re-Enter :<span style="color: red;">*</span></br></br>
            </td>
            <td>
        		<input type="password" size="30" name="pass1"id="pass1" value="<%=pass%>"></br></br>
            </td>
        </tr>
    </table>
    <input type="image" name="student" value="update" src="image/26.png" alt="Submit" width="150" height="50">                 
            
</div> 
 <div style="clear:both; height:10px;"></div>   
 </form> 
        <%@include file="html/head_foot/footer.html" %>

    </body>
</html>
