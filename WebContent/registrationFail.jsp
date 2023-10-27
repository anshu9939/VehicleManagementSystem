<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Failed!!!</title>
    </head>
    <body>
    	<%
          String username=(String)session.getAttribute("username");
           if(username == null){
               response.sendRedirect("login.jsp");
           }else if(username!=null) {
               response.sendRedirect("user/index.jsp");
           }
        %>
        <center><h2>Dear user your registration is failed!</h2>
        <p>Possible Reasons:<br>
           1. Username already registered.<br>
           2. Password not equal to Confirm Password.<br>
           3. Null values in any of the field.<br>
        </p>
        <h3><a href="register.jsp">Click here to Register again.</a></h3></center>
    </body>
</html>
