function validateForm() {
	if (document.forms["CONTACT_US"]["Full_Name"].value == "") {
		alert("First Name is compulsory.");
		return false;
	}
	
	var email = document.forms["CONTACT_US"]["Email_ID"].value;
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
	
	var mn = document.forms["CONTACT_US"]["Mobile_Number"].value;
	if (mn == "") {
		alert("Mobile Number is compulsory.");
		return false;
	}
	else if (mn.length != 10) {
		alert("!! Invalid Mobile Number !!");
		return false;
	}
	
	
	if (document.forms["CONTACT_US"]["Message"].value == "") {
		alert("Message is compulsory.");
		return false;
	}
	
	return true;
}