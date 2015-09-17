<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String c_code, c_name, c_dur, c_type, c_fees;
%>
        <div style="text-align:center; font-size:16px;">
            <div><img src="image/6.png"/></div>
            <table border="2" align="center">
            	<tr style="color:#0000FF;">
                    <th>S.NO.</th>
                    <th>COURSE CODE</th>
                    <th>COURSE NAME</th>
                    <th>COURSE DURATION</th>
                    <th>COURSE TYPE</th>
                    <th>COURSE FEES</th>
                </tr>
            <%
                int sno=0;
                Connection con=getConnection();
                try
                {
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from course");
                    while(rs.next())
                    {
                        c_code=rs.getString("c_code");
                        c_name=rs.getString("c_name");
                        c_dur=rs.getString("c_duration");
                        c_type=rs.getString("c_type");
                        c_fees=rs.getString("c_fees");
                        sno++;
            %>
                <tr>
                    <td>
                        <%=sno%>
                    </td>
                    <td>
                        <%=c_code%>
                    </td>
                    <td>
                        <%=c_name%>
                    </td>
                    <td>
                        <%=c_dur%>
                    </td>
                    <td>
                        <%=c_type%>
                    </td>
                    <td>
                        <%=c_fees%>
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