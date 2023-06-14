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
	<jsp:include page="donor_header.jsp"></jsp:include>

	<section class="row">
		<div class="center-text-box">
			<h1>
				Welcome
				<%=session.getAttribute("name")%></h1>
			<p>Donor are welcomed in our website to show their donation items
				so that people who needed it can get what they want easily using our
				platform</p>
			<a href="<%=request.getContextPath()%>/addItem"
				class="hero-btn red-btn">Insert New Item</a> <a
				href="<%=request.getContextPath()%>/show_my_item?page=1"
				class="hero-btn red-btn">Show my inserted item</a> <a
				href="<%=request.getContextPath()%>/item?page=1"
				class="hero-btn red-btn">Find pre-loved item</a>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
</body>
</html>