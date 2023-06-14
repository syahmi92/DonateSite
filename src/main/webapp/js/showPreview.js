function showPreview1(event) {
	if (event.target.files.length > 0) {
		var src = URL.createObjectURL(event.target.files[0]);
		var preview = document.getElementById("item-photo-1-preview");
		preview.src = src;
	}
}

function showPreview2(event) {
	if (event.target.files.length > 0) {
		var src = URL.createObjectURL(event.target.files[0]);
		var preview = document.getElementById("item-photo-2-preview");
		preview.src = src;
	}
}

function showPreview3(event) {
	if (event.target.files.length > 0) {
		var src = URL.createObjectURL(event.target.files[0]);
		var preview = document.getElementById("item-photo-3-preview");
		preview.src = src;
	}
}

function showPreview4(event) {
	if (event.target.files.length > 0) {
		var src = URL.createObjectURL(event.target.files[0]);
		var preview = document.getElementById("item-photo-4-preview");
		preview.src = src;
	}
}
