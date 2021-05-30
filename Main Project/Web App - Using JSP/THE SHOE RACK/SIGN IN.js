function validateForm() {
	var email = document.forms["SIGN_IN"]["Email_ID"].value;
	if (email == "") {
		alert("Email ID is compulsory.");
		return false;
	}
	else {
		var atPos = email.indexOf("@");
		var dotPos = email.lastIndexOf(".");
		
		if ((atPos < 1)  ||  (dotPos < atPos + 2)  ||  (dotPos + 2 >= email.length)) {
			alert("!! Invalid Email Address !!");
			return false;
		}
	}
	
	pass1 = document.forms["SIGN_IN"]["Password"].value;
	if (pass1 == "") {
		alert("Password is compulsory.");
		return false;
	}
	
	return true;
}