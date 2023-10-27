<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.jsp.PageContext" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.IOException" %>
<%@page import="java.util.*" %>
<%@page import="com.db.DBConnector" %>
<%@ page isELIgnored="false" %>  	
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
    <blockquote class="layui-elem-quote">Welcome | <span id="time"></span></blockquote>š
    <center><h1 class="carInfo-block">Apply for a vehicle </h1></center>
    <div class="car-apply-list">
        <table id="tab">
         <tr>
         	<td>Sno</td>
            <td>Vehicle Number</td>
            <td>Vehicle Type</td>
             <td>vehicleImage</td>
            <td>Number of Seats</td>
            <td>Vehicle Rent</td>
            <td>Take on Rent</td>
         </tr>
<%
		Statement st = DBConnector.getStatement();
  		String query = "select vehicleNumber ,vehicleType, vehicleImage ,seats ,vehicleRent, isRented, vehicleId from vehicle";
  		ResultSet rs = st.executeQuery(query);
  		int count = 0;
  		while(rs.next()){
  			if(!rs.getBoolean(6)){
%>
            <tr>
           		<td><%= count++ %></td>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><img width="100px" height="100px" src="<%= rs.getString(3) %>" /></td> 
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td> 
                <form method="post" action="${pageContext.request.contextPath}/user/rentVehicle">
                	<td>
	                	<input type="text" value="<%= rs.getString(7)%>" name="vehilceId" hidden="true" />
	                	<input type="submit" value="Rent"/>
                	</td> 
                </form>
                
            </tr>
<%
  			}
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