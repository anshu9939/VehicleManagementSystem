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
<html lang="zh-CN">

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
 
    <style>
        #author, #log {
            width: 45%;
            margin-right: 15px;
        }

        #author li, #log li{
            padding: 10px;
            margin: 10px 0px;
            background: #f8f8f8;
            border-radius: 8px;
        }

        #author li img {
            width: 40px;
            height: 40px;
        }

        .description {
            margin-left: 10px;
            position: absolute;
            display: inline-grid;
            line-height: 20px;
        }
    </style>
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
    <div class="filed-box">
        <h2 class="filed-title">Statistics</h2>
    <%
		Statement st = DBConnector.getStatement();
		String query = "SELECT count(1) from vehicletouser";
		ResultSet rs = st.executeQuery(query);
		rs.next();
	    int rentedVehicleCount = rs.getInt(1);
   	 %>
        
        <div><span class="filed-box-title">Rented Vehicles</span> <span class="red" id="rented_vehicles"><%= rentedVehicleCount %></span></div>
     <%
		String query2 = "SELECT count(1) from vehicle";
		ResultSet rs2 = st.executeQuery(query2);
		rs2.next();
	    int totalvehicle = rs2.getInt(1);
   	 %>
        <div><span class="filed-box-title">Total Number of Vehicle</span> <span class="red" id="total_vehicle"><%= totalvehicle %></span></div>
       <%
		String query3 = "SELECT count(1) from user";
		ResultSet rs3 = st.executeQuery(query3);
		rs3.next();
	    int userCount = rs3.getInt(1);
   	 %>
        <div><span class="filed-box-title">Number of User</span> <span class="red" id="user_num"><%= userCount %></span></div>
    </div>
</div>

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