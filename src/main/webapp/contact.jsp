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
	};
	%>

	<!-- Contact us content-->
	<section class="map">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1991.880709041158!2d101.71099650802941!3d3.157485099425236!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc37d12d669c1f%3A0xc955b08cfc1aae29!2sSuria%20KLCC!5e0!3m2!1sen!2smy!4v1640616924434!5m2!1sen!2smy"
			width="600" height="450" style="border: 0;" allowfullscreen=""
			loading="lazy"></iframe>
	</section>

	<section class="contact-us">
		<div class="contact-row">

			<div class="contact-col">

				<div>
					<i class="fa fa-home"></i> <span>
						<h5>KLCC Kuala Lumpur</h5>
						<p>Malaysia</p>
					</span>
				</div>
				<div>
					<i class="fa fa-phone"></i> <span>
						<h5>+603661234</h5>
						<p>Monday to Saturday, 10AM to 6PM</p>
					</span>
				</div>
				<div>
					<i class="fa fa-envelope"></i> <span>
						<h5>charityhub@edonate.com</h5>
						<p>Don't hesitate to email us for any further information</p>
					</span>
				</div>
			</div>
			<div class="contact-col">
				<form class="form-contact" action="">
					<input type="text" placeholder="Enter Your Name" required>
					<input type="email" placeholder="Enter Your Email Addresse"
						required> <input type="text"
						placeholder="Enter Your Subject" required>
					<textarea rows="8" placeholder="Message"></textarea>
					<button type="submit" class="hero-btn red-btn">Send
						Message</button>
				</form>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
</body>
</html>