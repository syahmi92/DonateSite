<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="database.DatabaseHandler"%>
<%@ page import="java.sql.*"%>
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
	<jsp:include page="search_box.jsp"></jsp:include>

	<!-- Single Products Detail -->
	<section class="container-for-item-detail">
		<div class="row-item-detail">

			<%
			int item_id = Integer.parseInt(request.getParameter("item_id"));
			DatabaseHandler dbHandler = new DatabaseHandler();
			ResultSet rs = dbHandler.getItem_detail(item_id);
			while (rs.next()) {
			%>

			<div class="col-item-detail">
				<img src="database-image/<%=rs.getString("first_img")%>"
					class="big-img" id="ProductImg" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"/>
				<div class="small-img-row">
					<span class="small-img-col"> <img
						src="database-image/<%=rs.getString("first_img")%>"
						class="small-img" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"/>
					</span> <span class="small-img-col"> <img
						src="database-image/<%=rs.getString("second_img")%>"
						class="small-img" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"/>
					</span> <span class="small-img-col"> <img
						src="database-image/<%=rs.getString("third_img")%>"
						class="small-img" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"/>
					</span> <span class="small-img-col"> <img
						src="database-image/<%=rs.getString("fourth_img")%>"
						class="small-img" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"/>
					</span>
				</div>
			</div>
			<div class="col-item-detail">
				<h3>Category</h3>
				<p><%=rs.getString("item_category")%></p>
				<br>
				<h3>Name</h3>
				<p><%=rs.getString("item_name")%></p>
				<br>
				<h3>Contact Number</h3>
				<p><%=rs.getString("item_contact")%></p>
				<br>
				<h3>Details</h3>
				<p><%=rs.getString("item_desc")%></p>
			</div>
			<%
			}
			%>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
	<script src="js/item_detail_small_img.js"></script>
</body>
</html>