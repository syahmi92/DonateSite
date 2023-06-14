
<!-- HEADER START -->
<section class="header">
	<nav>
		<a href="<%=request.getContextPath()%>/home"><img src="images/logo.png"></a>
		<div class="nav-links" id="navLinks">
			<i class="fa fa-times" onclick="hideMenu()"></i>
			<ul>
				<li><a href="<%=request.getContextPath()%>/home">HOME</a></li>
				<li><a href="<%=request.getContextPath()%>/item?page=1">PRE-LOVED ITEM</a></li>
				<li><a href="<%=request.getContextPath()%>/about">ABOUT</a></li>
				<li><a href="<%=request.getContextPath()%>/policy">PRIVACY POLICY</a></li>
				<li><a href="<%=request.getContextPath()%>/contact_us">CONTACT US</a></li>
				<li><a href="<%=request.getContextPath()%>/sign_in">LOGIN / REGISTER</a></li>
			</ul>
		</div>
		<i class="fa fa-bars" onclick="showMenu()"></i>
	</nav>
</section>

<!-- HEADER END-->