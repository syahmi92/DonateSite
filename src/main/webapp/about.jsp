<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- REQUIRED META TAG BELOW!! FOR RESPONSIVE/DYNAMIC SCREEN SIZE -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Donate Site</title>

<link rel="stylesheet" href="style/style.css">
<link rel="javascript" href="js/toggle_menu.js">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/x-icon" href="/images/cart.png">

</head>
<body>
	<%
	if (session.getAttribute("name") != null) {
	%>
	<jsp:include page="donor_header.jsp"></jsp:include>
	<%
	} else {
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	}
	;
	%>
	<!-- About us content-->
	<section class="about-us">
		<div class="about-row">
			<div class="about-col">
				<img src="images/about.jpg">
			</div>
			<div class="about-col">
				<h1>We are the world's largest charity hub</h1>
				<p>We built this website to be a platform to help people who
					need used items and also to those who want to donate used items. In
					short, this is a non-profit organization fueled by the desire to
					not let used items stranded without a new home, and to give the
					unfortunates an opportunity to fulfill their wants and needs.</p>
				<a class="hero-btn red-btn" href="<%=request.getContextPath()%>/item?page=1">EXPLORE NOW</a>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
</body>
</html>