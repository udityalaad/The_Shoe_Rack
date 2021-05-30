function validateForm() {
	if (document.forms["SIGN_UP"]["First_Name"].value == "") {
		alert("First Name is compulsory.");
		return false;
	}
	
	if (document.forms["SIGN_UP"]["Last_Name"].value == "") {
		alert("Last Name is compulsory.");
		return false;
	}
	
	
	var email = document.forms["SIGN_UP"]["Email_ID"].value;
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
	
	var mn = document.forms["SIGN_UP"]["Mobile_Number"].value;
	if (mn == "") {
		alert("Mobile Number is compulsory.");
		return false;
	}
	else if (mn.length != 10) {
		alert("!! Invalid Mobile Number !!");
		return false;
	}
	
	
	if (document.forms["SIGN_UP"]["Nationality"].value == "") {
		alert("Nationality is compulsory.");
		return false;
	}
	
	
	
	
	/* Password Validation */
	pass1 = document.forms["SIGN_UP"]["Password1"].value;
	pass2 = document.forms["SIGN_UP"]["Password2"].value;
	var passwordRestrictions = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_+-]).{8,30}$/;
	if (pass1 == "") {
		alert("Password is compulsory.");
		return false;
	}
	else if(!passwordRestrictions.test(pass1)) {
		alert("Your Password should contain at least 1 Lower Case Letter, 1 Upper Case Letter, , 1 number, 1 Special Character & must be 8-30 characters long.");
		return false;
	}
	
	if (pass2 == "") {
		alert("Re-entering the Password is compulsory.");
		return false;
	}
	else if(pass2 != pass1) {
		alert("Password and Re-entered Password must be same.");
		return false;
	}
	
	
	
	
	/* Date Of Birth Validation */
	var dob = document.forms["SIGN_UP"]["DOB"].value;
	if (dob == "") {
		alert("Date Of Birth is compulsory.");
		return false;
	}
	else {
		var todaysDate = new Date();
		var birthDate = new Date(dob);
		var B8YDate = new Date();

		B8YDate.setFullYear(B8YDate.getFullYear() - 8);
		
		if (birthDate >= todaysDate) {
			alert("Invalid Date Of Birth.");
			return false;
		}
		else if(birthDate >= B8YDate) {
			alert("You need to be atleast 8 years old to have an account at THE SHOE RACK.");
			return false;
		}
	}
	
	
	
	
	if (!document.getElementById("Male").checked   &&   !document.getElementById("Female").checked   &&   !document.getElementById("Other").checked) {
		alert("Gender is compulsory.");
		return false;
	}
	
	
	
	
	if (document.forms["SIGN_UP"]["HFN"].value == "") {
		alert("House No./Flat No. is compulsory.");
		return false;
	}
	
	if (document.forms["SIGN_UP"]["SBC"].value == "") {
		alert("Street/Building/Colony is compulsory.");
		return false;
	}
	
	if (document.forms["SIGN_UP"]["City"].value == "") {
		alert("City is compulsory.");
		return false;
	}
	
	if (document.forms["SIGN_UP"]["State"].value == "") {
		alert("State is compulsory.");
		return false;
	}
	
	if (document.forms["SIGN_UP"]["Country"].value == "") {
		alert("Country is compulsory.");
		return false;
	}
	
	if (document.forms["SIGN_UP"]["Postal_Code"].value == "") {
		alert("Postal Code is compulsory.");
		return false;
	}
	else if (document.forms["SIGN_UP"]["Postal_Code"].value.length != 6) {
		alert("!! Invalid Postal Code !!");
		return false;
	}
	
	
	
	
	if (document.forms["SIGN_UP"]["Birth_Place"].value == "") {
		alert("Birth Place is compulsory.");
		return false;
	}
	
	if (document.forms["SIGN_UP"]["Pets_Name"].value == "") {
		alert("Pet's Name is compulsory.");
		return false;
	}
	
	if (document.forms["SIGN_UP"]["Favorite_Dish"].value == "" ) {
		alert("Favourite Dish is compulsory.");
		return false;
	}
	
	return true;
}