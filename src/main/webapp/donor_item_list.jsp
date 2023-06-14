<%@page import="database.DatabaseHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<jsp:include page="donor_header.jsp"></jsp:include>

	<!-- LISTING ALL ITEM -->
	<section class="container">
		<h1>This is your inserted pre-loved item</h1>
		<div class="row-item">
			<%
			int page_number = Integer.parseInt(request.getParameter("page"));
			int total_data_set = 5;

			if (page_number == 1) {
				page_number = page_number - 1;
			}else{
				page_number = page_number - 1;
				page_number = page_number * total_data_set;
			}

			int donor_id = (Integer) session.getAttribute("id");
			DatabaseHandler dbHandler = new DatabaseHandler();
			ResultSet rs = dbHandler.getDonor_itemList(donor_id, page_number, total_data_set);
			while (rs.next()) {
			%>
			<div class="col-item">
				<form class="form-donor" method="post">
					<img src="database-image/<%=rs.getString("first_img")%>"
						onerror="this.onerror=null; this.src='images/pic-not-found.jpg'" />
					<!-- Change column photo only -->
					<h4><%=rs.getString("item_name")%></h4>
					<input type="hidden" name="item-id"
						value="<%=rs.getInt("item_id")%>">
					<nobr>
						<button type="submit"
							formaction="<%=request.getContextPath()%>/edit_item"
							class="hero-btn red-btn">Edit</button>
						<button type="submit"
							formaction="<%=request.getContextPath()%>/removed_item"
							class="hero-btn red-btn">Delete</button>
					</nobr>
				</form>
			</div>
			<%
			}
			%>
		</div>
	</section>
	<!-- END LISTING ALL ITEM -->
	<jsp:include page="donor_page_number.jsp"></jsp:include>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
</body>
</html>