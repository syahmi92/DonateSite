/*--JS FOR LOGIN AND REGISTER ANIMATION--*/
var LoginForm = document.getElementById("LoginForm");
var RegForm = document.getElementById("RegForm");
var indicator = document.getElementById("indicator");

function register() {
	RegForm.style.transform = "translateX(-125%)";
	LoginForm.style.transform = "translateX(-125%)";
	indicator.style.transform = "translateX(100px)";
}

function login() {
	RegForm.style.transform = "translateX(0px)";
	LoginForm.style.transform = "translateX(0px)";
	indicator.style.transform = "translateX(0px)";
}