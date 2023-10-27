<script>
	$(document).ready(
			function() {
				$(".user").click(
						function() {
							$(this).children("i").toggle2classes(
									"icofont-caret-down", "icofont-caret-up");
							$(this).next().toggle();
						});
				$(".update").click(function() {
					window.location.href = "updateProfile";
				});
				$(".logout").click(function() {
					clearCookie("username")
					clearCookie("role")
					window.location.href = "logout.jsp";
				});
				$("#name").text(getCookie("username"))
			})
</script>
<a>Vehicle Management</a>
<span class="user"><span id="name"></span> <i
	class="icofont-caret-down"></i></span>
<div class="user-child">
	<% 
		Boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
		if(!isAdmin)  {
	%>

	<span class="update">Update Profile</span>
	<% } %>
	<span class="logout">Logout</span>
</div>