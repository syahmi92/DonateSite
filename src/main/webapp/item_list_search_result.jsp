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
	<jsp:include page="search_box.jsp"></jsp:include>

	<!-- LISTING ALL ITEM -->
	<section class="container">
		<%
		String item_place = (String)session.getAttribute("item_place");
		String item_category = (String)session.getAttribute("item_category");
		String item_name = (String)session.getAttribute("item_name");
		
		int page_number = Integer.parseInt(request.getParameter("page"));
		int total_data_set = 5;
		
		if (page_number == 1) {
			page_number = page_number - 1;
		}else{
			page_number = page_number - 1;
			page_number = page_number * total_data_set;
		}
		
		DatabaseHandler dbHandler = new DatabaseHandler();
		ResultSet rs = dbHandler.search_result(item_place, item_category, item_name, page_number, total_data_set);
		while (rs.next()) {
		%>
		<div class="row-item">
			<div class="col-item">
				<a href="item_detail.jsp?item_id=<%=rs.getInt("item_id")%>"><img
					src="database-image/<%=rs.getString("first_img")%>" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"/>
					</a>
				<h4><%=rs.getString("item_name") %></h4>
				<p><%=rs.getString("item_place") %></p>
			</div>
			<%
			}
			%>
		</div>
	</section>
	<!-- END LISTING ALL ITEM -->
	<jsp:include page="page_number.jsp"></jsp:include>
	
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
</body>
</html>