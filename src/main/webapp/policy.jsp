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
				<h1>Privacy Policy</h1>
				<br>
				<h2>1. General provisions</h2>
				<p>
					1.1. This privacy policy regulates the principles of collection,
					processing, and storage of personal data. Personal data is
					processed and stored by CHARITY HUB, who is the controller of the
					personal data.<br>
					<br> 1.2. For the purposes of this privacy policy, a data
					subject means the customer or another natural person whose personal
					data is processed by the controller.<br>
					<br> 1.3. For the purposes of this privacy policy, a customer
					means anyone who purchases goods or services on the controller
					website.<br>
					<br> 1.4. The controller observes the principles relating to
					personal data processing provided by legislation and, among other
					things, processes personal data in a lawful, fair, and secure
					manner. The controller is able to declare that personal data has
					been processed in accordance with the provisions of the
					legislation.
				</p>
				<h2>2. Collection, processing, and storage of personal data</h2>
				<p>2.1. The personal data collected, processed, and stored by
					the controller has been collected electronically, mainly via the
					website and e-mail.<br>
					<br> 2.2. By sharing their personal data, the data subject
					grants the controller the right to collect, arrange, use and
					administer, for the purpose defined in the privacy policy, the
					personal data that the data subject shares with the controller
					either directly or indirectly when purchasing goods or services on
					the website.<br>
					<br> 2.3. The data subject is liable for the accuracy,
					correctness, and integrity of the data submitted by them. The
					submission of knowingly false data is regarded as a breach of the
					privacy policy. The data subject is required to immediately notify
					the controller of any changes in the data submitted.<br>
					<br> 2.4. The controller is not liable for any damage or loss caused to the data
					subject or a third party as a result of the submission of false
					data by the data subject.</p>
				<a class="hero-btn red-btn"
					href="<%=request.getContextPath()%>/contact_us">ASK US</a>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
</body>
</html>