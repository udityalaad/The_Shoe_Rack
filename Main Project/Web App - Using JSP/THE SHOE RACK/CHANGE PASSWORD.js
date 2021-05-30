function validateForm() {
	/* Password Validation */
	pass1 = document.forms["CHANGE_PASSWORD"]["Password1"].value;
	pass2 = document.forms["CHANGE_PASSWORD"]["Password2"].value;
	
	var passwordRestrictions = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_+-]).{8,30}$/;
	
	if (pass1 == "") {
		alert("New Password is compulsory.");
		return false;
	}
	else if(!passwordRestrictions.test(pass1)) {
		alert("Your Password should contain at least 1 Lower Case Letter, 1 Upper Case Letter, , 1 number, 1 Special Character & must be 8-30 characters long.");
		return false;
	}
	
	if (pass2 == "") {
		alert("Re-entering the New Password is compulsory.");
		return false;
	}
	else if(pass2 != pass1) {
		alert("Password and Re-entered Password must be same.");
		return false;
	}
	
	return true;
}