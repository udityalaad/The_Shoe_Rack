function validateForm() {
	/* Password Validation */
	pass = document.forms["CURRENT_PASSWORD"]["Current_Password"].value;
	
	if (pass == "") {
		alert("Current Password is compulsory.");
		return false;
	}
	
	return true;
}