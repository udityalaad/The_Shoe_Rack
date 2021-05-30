function validateForm() {
	var search = document.forms["SearchBar"]["Search"].value;
	
	if (search == "") {
		alert("Search Field is compulsory.");
		return false;
	}
	
	return true;
}