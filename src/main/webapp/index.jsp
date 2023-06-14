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


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section class="row">
		<div class="center-text-box">
			<h1>Charity Hub</h1>
			<p>The platform is built to help those looking for used items
				that can still be used. It is hoped that users who take goods on
				this platform can also contribute any items so that the benefits can
				be used by others.</p>
			<a href="<%=request.getContextPath()%>/sign_in"
				class="hero-btn red-btn">Donor</a> <a
				href="<%=request.getContextPath()%>/item?page=1"
				class="hero-btn red-btn">Receiver</a>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
</body>
</html>