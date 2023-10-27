<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.jsp.PageContext" %>
<%@ page isELIgnored="false" %>  	
<% 
	Object checksession = session.getAttribute("username");
	System.out.println("check session = "+checksession);
	if(checksession!=null)  {
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <title>Upload Vehicle</title>
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
        <center><h1  class="carInfo-block">Upload Vehicle</h1></center>
        <form action="${pageContext.request.contextPath}/admin/uploadVehicle" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td><B>Vehicle Number:</B></td>
                    <td><input type="text" name="vehicleNumber" value="" placeholder="Enter Vehicle Number"  required></td>
                </tr>
                <tr>
                    <td><B>Choose Vehicle Type:</B></td>
                    <td>
			                    <select id="cars" name="vehicleType" required>
									  <option value="Bus">Bus</option>
									  <option value="Car">Car</option>
									  <option value="Bike">Bike</option>
									  <option value="Truck">Truck</option>
									</select>
                    </td>
                </tr>
                <tr>
                    <td><B>Number of Seats:</B></td>
                    <td><input type="number" name="noOfSeats" placeholder="Enter Number of seats" required></td>
                </tr>
                 <tr>
                    <td><B>Vehicle rent</B></td>
                    <td><input type="number" name="vehicleRent" placeholder="Enter Vehicle Rent(per day)" required></td>
                </tr>
                <tr>
                    <td><B>Upload Vehicle Image</B></td>
                    <td><input type="file" name="vehicleImage" accept="image/x-png,image/gif,image/jpeg" required></td>
                </tr>
              
                <tr>
                    <td></td>
                    <td><input type="submit" value="Add Vehicle"></td>
                </tr>
            </table>
        </form><br><br>
        </center>
    </div>
    <script src="../resources/static/js/custom.js"></script>
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