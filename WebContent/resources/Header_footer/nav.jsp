<script>
	$(document).ready(
			function() {
			$("#nav a").click(
					function() {
						if ($(this).next("ul").length != 0) {
							$(this).children("i").toggle2classes(
									"icofont-simple-right nav_right",
									"icofont-simple-down nav_right");
							$(this).parent("li").children("ul").toggle();
						}
					})
			});
</script>
<div class="sider-nav">
	<ul id="nav">
		
		<li class="nav-ch-1"><a href="index.jsp"><span class="icofont-home"></span>
				Home </i></a>
		</li>
		
		<% 
			Boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
			if(!isAdmin)  {
		%>

		<li class="nav-ch-1"><a><span class="icofont-car-alt-4"></span>
				Vehicle Management <i class="icofont-simple-right nav_right"></i></a>
			<ul class="sub-menu">
				<!-- GIVES UER OPTION TO RENT VEHICLE ON THIS PAGE -->
				<li id="_info_app"><a href="applyToRent.jsp"><i
						class="icofont-simple-right"></i> Rent New Vehicle</a></li>
				<!-- GIVES UER OPTION TO RETURN VEHICLE ON THIS PAGE -->
				<li id="_info_man"><a href="rentedVehicle.jsp"><i
						class="icofont-simple-right"></i> Your Rented Vehicle List</a></li>
			</ul></li>
			
		<% }else { %>	
		
		<li class="nav-ch-1" id="test"><a><span
				class="icofont-user-alt-2"></span> Administrator Management <i
				class="icofont-simple-right nav_right"></i></a>
			<ul class="sub-menu">
				<li><a href="uploadVehicle.jsp"><i
						class="icofont-simple-right"></i>Upload New Vehicle</a></li>
				<li><a href="user_manage.jsp"><i
				class="icofont-simple-right"></i>Registertered Users</a></li>
			</ul></li>
		<%  } %>	
			
		<!-- <li class="nav-ch-1">
            <a><span class="icofont-pie-chart"></span> 系统管理 <i class="icofont-simple-right nav_right"></i></a>
            <ul class="sub-menu">
            </ul>
        </li> -->
	</ul>
</div>