function validateForm() {
	var email = document.forms["PASSWORD_RECOVERY"]["Email_ID"].value;
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
	
	
	
	if (document.forms["PASSWORD_RECOVERY"]["Birth_Place"].value == "") {
		alert("Birth Place is compulsory.");
		return false;
	}
	
	if (document.forms["PASSWORD_RECOVERY"]["Pets_Name"].value == "") {
		alert("Pet's Name is compulsory.");
		return false;
	}
	
	if (document.forms["PASSWORD_RECOVERY"]["Favorite_Dish"].value == "") {
		alert("Favorite Dish is compulsory.");
		return false;
	}
	
	return true;
}