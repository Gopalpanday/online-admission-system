<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>

<%
    if(session.getAttribute("admin_id") == null)
    {
         response.sendRedirect("invalid.jsp"); 
    }
    else{
    cccc=request.getParameter("cccc");
    if(cccc.equals("search"))
    {
        code=request.getParameter("code1");
        boolean val=searchCourse();
        if(val)
        {
%>
            <jsp:forward page="admin_course.jsp">
                <jsp:param name="code" value = "<%=code%>"/>
                <jsp:param name="name" value = "<%=name%>"/>
                <jsp:param name="duration" value = "<%=duration%>"/>
                <jsp:param name="type" value = "<%=type%>"/>
                <jsp:param name="fees" value = "<%=fees%>"/>
            </jsp:forward> 
<% 
        }
        else
        {
%>
            <script>
                alert("Course Code does not exist !");
            </script>
<%
        }
    }else if(cccc.equals("update"))
    {
        code=request.getParameter("course1");
        name=request.getParameter("name1");
        duration=request.getParameter("duration1");
        type=request.getParameter("type1");
        fees=request.getParameter("fees1");       
        int val=updateCourse();
        if(val==1)
        {
%>
            <jsp:forward page="success.jsp"></jsp:forward>
<%      }else
        {
%>
        <script>
            alert("Course Code does not exist !");
        </script>
<%      } 
        
    }else if(cccc.equals("delete"))
    {
        code=request.getParameter("code1");

        int val=courseDelete();
        if(val==1)
        {
%>
            <jsp:forward page="success.jsp"></jsp:forward>
<%      }else
        {
%>
        <script>
            alert("Course Code does not exist !");
        </script>
<%      } 
        
    }else if(cccc.equals("add"))
    {
        code=request.getParameter("code");
        name=request.getParameter("name");
        duration=request.getParameter("duration");
        type=request.getParameter("type");
        fees=request.getParameter("fees");
        code=code.toUpperCase();

        boolean val=courseAdd();
        if(val)
        {
%>
            <jsp:forward page="success.jsp"></jsp:forward>
<%      }else
        {
%>
        <script>
            alert("Course Code already is in record !");
        </script>
<%      } 
        
    }}
%>

     
<%!
    String code, name, duration, type, fees, cccc;
    public boolean searchCourse()
    {    
       Connection con=getConnection();
       boolean success=false; 
       try
       {
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select * from course where c_code= '"+code+"';");
           while(rs.next())
           {
                code=rs.getString("c_code");
                name=rs.getString("c_name");
                duration=rs.getString("c_duration");
                type=rs.getString("c_type");
                fees=rs.getString("c_fees");
                success=true;                                           
            }
           closeConnection(con, st, null);   
       }catch(SQLException se){
           se.printStackTrace();
       } 
       return success;
    }   
    
    public int updateCourse()
    {    
        int x=0;
       Connection con=getConnection(); 
       try
       {
           Statement st=con.createStatement();
           x=st.executeUpdate(" UPDATE course SET c_name='"
                    +name+"',c_duration='"+duration+
                    "',c_type='"+type+"',c_fees='"
                    +fees+"' WHERE c_code='"+code+"'");
           closeConnection(con, st, null);   
       }catch(SQLException se){
           se.printStackTrace();
       } 
       return x;
    }
      
    public int courseDelete()
    {
        int x=0;
        Connection con=getConnection();
        try
        {
            Statement st=con.createStatement();
            x=st.executeUpdate("delete from course where c_code='"+code+"'");
            closeConnection(con, st, null);
        }catch(SQLException se){
            se.printStackTrace();
        }
        return x;
    }
    
    public boolean courseAdd()
    {    
       Connection con=getConnection();
       boolean success=false; 
       try
       {
           Statement st=con.createStatement();
           PreparedStatement ps=con.prepareStatement("insert into course "
                   + " (c_code,c_name,c_duration,c_type,c_fees)"
                   + " values"
                   + " (?,?,?,?,?)");
           ps.setString(1,code);
           ps.setString(2,name);
           ps.setString(3,duration);
           ps.setString(4,type);
           ps.setString(5,fees);
           ps.executeUpdate();
           closeConnection(con, st, null);  
           success=true;
       }catch(SQLException se){
           se.printStackTrace();
       } 
       return success;
    }
%>