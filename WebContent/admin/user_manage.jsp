<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.jsp.PageContext" %>
<%@ page isELIgnored="false" %> 
<%@page import="java.sql.*" %>
<%@page import="java.io.IOException" %>
<%@page import="java.util.*" %>
<%@page import="com.db.DBConnector" %> 	
<% 
	Object checksession = session.getAttribute("username");
	System.out.println("check session = "+checksession);
	if(checksession!=null)  {
%>
<!DOCTYPE html>
<html lang="en-Us">

<head>
    <title>index</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../resources/static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../resources/static/css/util.css">
    <link rel="stylesheet" type="text/css" href="../resources/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../resources/static/css/j_custom.css">
    <link href="../resources/static/css/icofont.min.css" rel="stylesheet">
    <script src="../resources/static/js/jquery.min.js"></script>
    <script src="../resources/static/js/custom.js"></script>
</head>

<body>

<div class="container" id="header">
	<jsp:include page="../resources/Header_footer/Header_LoggedIn.jsp"></jsp:include>
</div>

<div class="left-nav" id="nav">
	<jsp:include page="../resources/Header_footer/nav.jsp"></jsp:include>
</div>

<div class="page-content">
    <blockquote class="layui-elem-quote">Welcome </span>| <span id="time"></span></blockquote>
    <center><h1 class="carInfo-block">User Management</h1></center>
    <div class="user_table">
        <table>
            <tr>
            	<td>Sno</td>
                <td>Username</td>
                <td>Name</td>
                <td>Phone Number</td>
            </tr>
            <%
		Statement st = DBConnector.getStatement();
  		String query = "SELECT username, fname, phone from user";
  		System.out.println(query);
  		ResultSet rs = st.executeQuery(query);
  		int count = 0;
  		while(rs.next()){
%>
            <tr>
            	<td><%= count++ %></td>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
            </tr>
<% 
	} 
%>
        </table>
    </div>
    
</div>

<script src="js/custom.js"></script>
</body>

</html>
<%
	}else{  
			session.setAttribute("invalid_login","1");
			response.sendRedirect("../login.jsp");
%>
	<%-- <jsp:forward page="${pageContext.request.contextPath}/login.jsp" />	 --%>
<% 
	} 
%>