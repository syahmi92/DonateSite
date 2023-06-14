<!-- Search box -->
<section class="search-box">
	<form action="<%=request.getContextPath()%>/search_result" method="post" class="search-form">
		<select name="location"class="category-select">
			<option selected disabled hidden="hidden">Choose location</option>
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
		</select> <select name="category" class="category-select">
			<option selected disabled hidden="hidden">Choose category</option>
				<option value="Electronic And Gadjets">Electronic And Gadjets</option>
				<option value="Furniture">Furniture</option>
				<option value="Vehicle">Vehicle</option>
				<option value="Clothing">Clothing</option>
				<option value="Hardware Tool">Hardware Tool</option>
				<option value="Kitchen Tool">Kitchen Tool</option>
				<option value="Others">Others</option>
		</select> <input name="search" type="text" class="search-input"
			placeholder="Search for the pre-loved item">
		<button type="submit" class="hero-btn red-btn">Search</button>
	</form>
</section>
<!-- End of search box -->