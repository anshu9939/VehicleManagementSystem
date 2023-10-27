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
    <center><h1 class="carInfo-block">Update Profile Details</h1></center>
        <form action="${pageContext.request.contextPath}/user/updateProfile" method="post">
            <table>
                <tr>
                    <td><B>Username:</B></td>
                    <td><input type="text" name="username" value="<%=(String)session.getAttribute("username")%>" readonly=""></td>
                </tr>
                <tr>
                    <td><B>Old Password:</B></td>
                    <td><input type="password" name="oldPassword" placeholder="Enter Old Password Here"></td>
                </tr>
                <tr>
                    <td><B>New Password:</B></td>
                    <td><input type="password" name="password" placeholder="Enter New Password Here"></td>
                </tr>
                <tr>
                    <td><B>Confirm Password:</B></td>
                    <td><input type="password" name="conPassword" placeholder="Re-enter Password Here"></td>
                </tr>
                <tr>
                    <td><B>First Name:</B></td>
                    <td><input type="text" name="fname" value="<%=(String)session.getAttribute("fname")%>"></td>
                </tr>
                
                <tr>
                    <td><B>Phone Number:</B></td>
                    <td><input type="text" name="phone" value="<%=(String)session.getAttribute("phone")%>"></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="Update"></td>
                </tr>
            </table>
        </form><br><br>
        <center>
        <p><B>Note:</B> 1.Make sure your 'Password' and 'Confirm Password' fields contain same value.<br>
            2.Your username should be unique.<br>
            <B>Failure of above statements will lead to updation failure.</B></p>
        <br><br><h3>Changed your mind?... To go back to home page <a href="index.jsp">Click here</a></h3>
        </center>
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