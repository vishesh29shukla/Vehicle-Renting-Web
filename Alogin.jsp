<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
    
    <%
    String email=request.getParameter("loginemail2");
    String password=request.getParameter("loginpass2");
    //out.write(email+password);
    try
    {
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/kvch","root","");
    	PreparedStatement ps=conn.prepareStatement("select * from admin where email=? and password=?");
    	ps.setString(1, email);
    	ps.setString(2, password);
    	ResultSet rs=ps.executeQuery();
    	int c=0;
    	while(rs.next())
    	{
    		c++;
    	}
    	if(c==1)
    	{
    		//out.write("LOGIN");
    		session.setAttribute("uemail", email);
    		response.sendRedirect("Apanel.jsp");
    	}
    	else
    	{
    		out.write("Wrong Email or Password");
    		response.sendRedirect("Alogin.html");
    	}
    }
    catch(Exception e)
    {
    	out.write("Sorry... Error");
    }
    
    
    
    %>