<!DOCTYPE html>
<html lang="zh-CN">

<head>
<title>Register</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="resources/static/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/static/css/util.css">
<link rel="stylesheet" type="text/css"
	href="resources/static/css/main.css">
<body>
		<%
          String username=(String)session.getAttribute("username");
           if(username!=null)
           {
               response.sendRedirect("user/index.jsp");
           }
        %>
	<div class="login">
		<div class="header">
			<div class="left-logo">Vehicle Management System</div>
			<div class="right-info">
				<span>About Us</span> / <span>Contact</span>
			</div>
		</div>
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="resources/static/img/left_logo.jpg" alt="IMG">
				</div>
				<form method="post" action="register">
					<div class="right-form">
						<div class="wrap-input100 validate-input">
							<input class="input100" type="text" name="username"
								placeholder="Enter username" id="userName" required> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</span> <span class="err-tips"></span>
						</div>
						<div class="wrap-input100 validate-input">
							<input class="input100" type="text" name="name"
								placeholder="Enter Name" id="realName" required> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</span> <span class="err-tips"></span>
						</div>
						<div class="wrap-input100 validate-input">
							<input class="input100" type="text" name="phone"
								placeholder="Enter Phone No" id="userPhone" required> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</span> <span class="err-tips"></span>
						</div>

						<div class="wrap-input100 validate-input">
							<input class="input100" type="password" name="password"
								placeholder="Enter password" id="password" required> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-lock" aria-hidden="true"></i>
							</span> <span class="err-tips"></span>
						</div>

						<div class="container-login100-form-btn">
							<button class="login100-form-btn" id="userSubmit111">
								REGISTER</button>
						</div>
						<div class="to-login">
							<a class="txt2" href="login.jsp"> Click to Login <i
								class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="resources/static/js/jquery.min.js"></script>
</body>

</html>