<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String contact=request.getParameter("contact");
String message=request.getParameter("message");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/kvch","root","");
	PreparedStatement ps=conn.prepareStatement("insert into contact value(?,?,?,?,?,?,?)");
	ps.setInt(1, 0);
	ps.setString(2, name);
	ps.setString(3, email);
	ps.setString(4, contact);
	ps.setString(5, message);
	ps.setString(6, "pending");
	ps.setString(7, "9-Sep-20222");
	int x=ps.executeUpdate();
	out.write("your request is under process");
}
catch(Exception e)
{
	out.write("Sorry...");
}
%>
</body>
</html>