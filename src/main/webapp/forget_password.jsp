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
	<jsp:include page="header.jsp"></jsp:include>

	<section class="row-login">
		<div class="col-2">
			<div class="form-container">
				<br>
				<h4 class="span-reset-pass">Reset Password</h4>
				<form action="<%=request.getContextPath()%>/reset" method="post">
					<input type="text" name="username_reset" placeholder="Username" required /> 
						<input type="password" name="new_password" placeholder="Password" required /> 
						<input type="password" name="confirm_password" placeholder="Re-type Password"
						required />
					<button type="submit" class="hero-btn red-btn forget">Reset Password</button>
				</form>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
	<script src="js/login_register_anim.js"></script>
</body>
</html>