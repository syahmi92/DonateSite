<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="database.DatabaseHandler"%>
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

	<!-- Insert new item section -->

	<%
	int item_id = Integer.parseInt(request.getParameter("item-id"));
	DatabaseHandler dbHandler = new DatabaseHandler();
	ResultSet rs = dbHandler.getDonor_item_detail(item_id);
	while (rs.next()) {
	%>

	<section class="container-insert-item">
		<br>
		<h1>Please edit the detail of the item</h1>
		<form class="form-donor-insert" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/save_edit" method="post">
			<br> <label for="itemPhoto">Insert photos to be replace
				(If Any):</label> <br> <br>
			<div class="form-donor-input">
				<img id="item-photo-1-preview"
					src="database-image/<%=rs.getString("first_img")%>" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"> <label
					for="item-photo-replace-1">Replace Image</label> <input type="file"
					id="item-photo-replace-1" name="item-photo-replace-1"
					accept="image/*" onchange="showPreview1(event);">
			</div>

			<div class="form-donor-input">
				<img id="item-photo-2-preview"
					src="database-image/<%=rs.getString("second_img")%>" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"> <label
					for="item-photo-replace-2">Replace Image</label> <input type="file"
					id="item-photo-replace-2" name="item-photo-replace-2"
					accept="image/*" onchange="showPreview2(event);">
			</div>

			<div class="form-donor-input">
				<img id="item-photo-3-preview"
					src="database-image/<%=rs.getString("third_img")%>" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"> <label
					for="item-photo-replace-3">Replace Image</label> <input type="file"
					id="item-photo-replace-3" name="item-photo-replace-3"
					accept="image/*" onchange="showPreview3(event);">
			</div>

			<div class="form-donor-input">
				<img id="item-photo-4-preview"
					src="database-image/<%=rs.getString("fourth_img")%>" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"> <label
					for="item-photo-replace-4">Replace Image</label> <input type="file"
					id="item-photo-replace-4" name="item-photo-replace-4"
					accept="image/*" onchange="showPreview4(event);">
			</div>
			<br> <br> <label for="itemName">Name <span style="color: red">*</span></label> <input
				class="donor-insert-input" id="itemName" type="text" name="itemName"
				value="<%=rs.getString("item_name")%>"
				placeholder="Enter item's name" required> <label
				for="itemPlace">Location <span style="color: red">*</span></label> <select
				name="itemPlace">
				<option value="<%=rs.getString("item_place")%>" selected
					hidden="hidden"><%=rs.getString("item_place")%></option>
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
			</select><label for="itemCategory">Category <span style="color: red">*</span></label> <select
				name="itemCategory">
				<option value="<%=rs.getString("item_category")%>" selected
					hidden="hidden"><%=rs.getString("item_category")%></option>
				<option value="Electronic And Gadjets">Electronic And
					Gadjets</option>
				<option value="Furniture">Furniture</option>
				<option value="Vehicle">Vehicle</option>
				<option value="Clothing">Clothing</option>
				<option value="Hardware Tool">Hardware Tool</option>
				<option value="Kitchen Tool">Kitchen Tool</option>
				<option value="Others">Others</option>
			</select> <label for="itemContact">Contact Number<span style="color: red">*</span></label> <input
				class="donor-insert-input" id="itemContact" type="text"
				value="<%=rs.getString("item_contact")%>" name="itemContact"
				placeholder="Enter contact number" required> <label
				for="itemDesc">Description <span style="color: red">*</span></label>
			<textarea class="donor-insert-textarea" id="itemDesc" rows="8"
				name="itemDesc" required
				placeholder="The description can be reason you want to donate or extra details of the item"><%=rs.getString("item_desc")%></textarea>
				
			<input type="hidden" id="itemID_hidden" name="itemID_hidden" value="<%=rs.getInt("item_id")%>">
			<input type="hidden" id="first_img_hidden" name="first_img_hidden" value="<%=rs.getString("first_img")%>">
			<input type="hidden" id="second_img_hidden" name="second_img_hidden" value="<%=rs.getString("second_img")%>">
			<input type="hidden" id="third_img_hidden" name="third_img_hidden" value="<%=rs.getString("third_img")%>">
			<input type="hidden" id="fourth_img_hidden" name="fourth_img_hidden" value="<%=rs.getString("fourth_img")%>">
			<br>
			<h4>The <span style="color: red">*</span> indicate required</h4>
			<br>
			<button type="submit" name="itemDesc" class="hero-btn red-btn">Save</button>
		</form>
	</section>
	<%
	}
	%>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
	<script src="js/showPreview.js"></script>
</body>
</html>