<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.jsp.PageContext" %>
<%@ page isELIgnored="false" %>  	
<% 
	Object checksession = session.getAttribute("username");
	System.out.println("check session = "+checksession);
	if(checksession!=null)  {
%>
<!DOCTYPE html>
<html lang="en-Us">

<head>
    <title>Update Profile</title>
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
	<blockquote class="layui-elem-quote">Welcome | <span id="time"></span></blockquote>
    <center><h1 class="carInfo-block">Updation Failed</h1></center>
        <center><h2>Dear user your data updation has failed!</h2>
        <p>Possible Reasons:<br>
           1. Username already registered.<br>
           2. Password not equal to Confirm Password.<br>
           3. Null values in any of the field.<br>
        </p>
        <h3><a href="updateData.jsp">Click here to update again.</a></h3>
        <h3><a href="home.jsp">Click here to go to home page.</a></h3></center>
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