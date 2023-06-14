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
				<div class="form-btn">
					<span onclick="login()">Login</span> <span onclick="register()">Register</span>
					<hr id="indicator" />
				</div>
				<form action="<%=request.getContextPath()%>/login_home"
					method="post" id="LoginForm">
					<input type="text" name="username_login" placeholder="Username" required/>
					<input type="password" name="password_login" placeholder="Password" required/>
					<button class="hero-btn red-btn" type="submit" name="login_button" >Login</button>
					<br> <br> <a href="<%=request.getContextPath()%>/forget_password">Forgot Password</a>
				</form>
				<form action="<%=request.getContextPath()%>/register_home"
					method="post" id="RegForm">
					<input type="text" name="username_register" placeholder="Username" required/>
					<input type="password" name="password_register"
						placeholder="Password" required/> <input type="email"
						name="email_register" placeholder="Email" required/> <input type="text"
						name="name_register" placeholder="Name" required/> <input type="text"
						name="phone_register" placeholder="Phone Number" required/> <select
						name="place_register"required>
						<option value="" selected disabled hidden="hidden">Choose location</option>
						<option value="Johor">Johor</option>
						<option value="Kuala Lumpur">Kuala Lumpur</option>
						<option value="Kedah">Kedah</option>
						<option value="Kelantan">Kelantan</option>
						<option value="Labuan">Labuan</option>
						<option value="Melaka">Melaka</option>
						<option value="Negeri Sembilan">Negeri Sembilan</option>
						<option value="Pahang">Pahang</option>
						<option value="Penang">Penang</option>
						<option value="Perak">Perak</option>
						<option value="Perlis">Perlis</option>
						<option value="Putrajaya">Putrajaya</option>
						<option value="Sabah">Sabah</option>
						<option value="Sarawak">Sarawak</option>
						<option value="Selangor">Selangor</option>
						<option value="Terengganu">Terengganu</option>
					</select>
					<button type="submit" class="hero-btn red-btn">Register</button>
				</form>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
	<script src="js/login_register_anim.js"></script>
</body>
</html>