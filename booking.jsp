<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="java.io.FileInputStream"%> 
<%@page import="java.io.File"%> 
<%@page import="java.io.InputStream"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String Area=request.getParameter("NCR");
String Address=request.getParameter("address");
String vehicle=request.getParameter("vehicle");
String Date1=request.getParameter("date1");
String Date2=request.getParameter("date2");
String name=request.getParameter("Name");
String phone=request.getParameter("Phone");
String link=request.getParameter("doc");
//out.write(Area+Address+Date1+Date2+link);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/kvch","root","");
	PreparedStatement ps=conn.prepareStatement("insert into booking value(?,?,?,?,?,?,?,?)");
	ps.setString(1, Area);
	ps.setString(2, Address);
	ps.setString(3, vehicle);
	ps.setString(4, Date1);
	ps.setString(5, Date2);
	ps.setString(6, name);
	ps.setString(7, phone);
	ps.setString(8, link);
	int x=ps.executeUpdate();
	response.sendRedirect("Query.html");
}
catch(Exception e)
{
	out.write("Sorry...");
}
%>
</body>
</html>