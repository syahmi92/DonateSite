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

	<!-- Insert new item section -->
	<section class="container-insert-item">
		<br>
		<h1>Please insert the detail of the item</h1>
		<form class="form-donor-insert" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/insert_new" method="post">
			<br> <label for="itemPhoto">Insert photos to be
				inserted: <br>(Can add maximum up to 4 photos)
			</label><br> <br>
			<div class="form-donor-input">
				<img id="item-photo-1-preview" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"> <label for="item-photo-1">Upload
					Image</label> <input type="file" id="item-photo-1" name="item-photo-1" 
					accept="image/*" onchange="showPreview1(event);">
			</div>

			<div class="form-donor-input">
				<img id="item-photo-2-preview" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"> <label for="item-photo-2">Upload
					Image</label> <input type="file" id="item-photo-2" name="item-photo-2" 
					accept="image/*" onchange="showPreview2(event);">
			</div>

			<div class="form-donor-input">
				<img id="item-photo-3-preview" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"> <label for="item-photo-3">Upload
					Image</label> <input type="file" id="item-photo-3" name="item-photo-3" 
					accept="image/*" onchange="showPreview3(event);">
			</div>

			<div class="form-donor-input">
				<img id="item-photo-4-preview" onerror="this.onerror=null; this.src='images/pic-not-found.jpg'"> <label for="item-photo-4">Upload
					Image</label> <input type="file" id="item-photo-4" name="item-photo-4" 
					accept="image/*" onchange="showPreview4(event);">
			</div>
			<br> <br> <label for="itemName">Name <span style="color: red">*</span></label> <input
				class="donor-insert-input" id="itemName" type="text" name="itemName"
				placeholder="Enter item's name" required> <label
				for="itemPlace">Location <span style="color: red">*</span></label> <select
				name="itemPlace">
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
			</select> <label for="itemCategory">Category <span style="color: red">*</span></label> <select
				name="itemCategory">
				<option value="" selected disabled hidden="hidden">Choose category</option>
				<option value="Electronic And Gadjets">Electronic And Gadjets</option>
				<option value="Furniture">Furniture</option>
				<option value="Vehicle">Vehicle</option>
				<option value="Clothing">Clothing</option>
				<option value="Hardware Tool">Hardware Tool</option>
				<option value="Kitchen Tool">Kitchen Tool</option>
				<option value="Others">Others</option>
			</select> <label for="itemContact">Contact No <span style="color: red">*</span></label> <input
				class="donor-insert-input" id="itemContact" type="text" value="<%=session.getAttribute("phone") %>"
				name="itemContact" placeholder="Enter contact number" required>

			<label for="itemDesc">Description <span style="color: red">*</span></label>
			<textarea class="donor-insert-textarea" id="itemDesc" rows="8"
				name="itemDesc" required
				placeholder="The description can be reason you want to donate or extra details of the item"></textarea>
				<input type="hidden" name="getAccountID"value=<%=session.getAttribute("id") %>>
				<br>
				<h4>The <span style="color: red">*</span> indicate required</h4>
				<br>
			<button type="submit" name="itemDesc" class="hero-btn red-btn">Insert</button>
		</form>
	</section>


	<jsp:include page="footer.jsp"></jsp:include>
	<script src="js/toggle_menu.js"></script>
	<script src="js/showPreview.js"></script>
</body>
</html>