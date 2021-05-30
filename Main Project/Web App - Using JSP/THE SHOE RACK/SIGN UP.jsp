<html>
<head>
	<title>SIGN UP</title>
	<link rel="stylesheet" href="SIGN UP.css">
	<script src="SIGN UP.js"></script>
</head>

<body>
	<div class="header">
		<br>
		<h1>&nbsp THE SHOE RACK</h1>
		<p>&nbsp &nbsp &nbsp Put your best feet forward</p>
	</div>
	
	<nav>
		<a href="HOME.jsp">HOME</a>
		<a href="SUGGESTIONS.jsp">SUGGESTIONS</a>
		<a href="LATEST DEALS.jsp">LATEST DEALS</a>
		<a href="ABOUT US.jsp">ABOUT US</a>
		<a href="CONTACT US.jsp">CONTACT US</a>
			
		<div class="account">
			<button class="dropBtn">ACCOUNT</button>
			
			<div class="account-dropDown-content">
				<% if (session.getAttribute("userID") == null) {%>
					<a href="SIGN IN.jsp">SIGN IN</a>
					<a href="SIGN UP.jsp">New to THE SHOE RACK? SIGN UP</a>
				<% }
				else { %>
					<a href="SIGN OUT.jsp">SIGN OUT</a>
					<a href="MY ACCOUNT.jsp">MY ACCOUNT</a>
				<% } %>
			</div>
		</div>
	</nav>
	
	<br>
	
	
	<!-- SIGN UP -->
	<form name="SIGN_UP" action="SIGN UP 1.jsp" method="post">
		<div class="form-head">
			<h2>SIGN UP</h2>
			
			<p>Please fill the following details carefully:</p> <br>
		</div>
		
		
		<input type="text" name="First_Name" placeholder=" First Name">  &nbsp &nbsp
		<input type="text" name="Middle_Name" placeHolder=" Middle Name (Optional)"> &nbsp &nbsp
		<input type="text" name="Last_Name" placeholder=" Last Name" ><br><br>
		
		<input type="text" name="Email_ID" placeholder=" Email ID"><br><br>
		<input type="number" name="Mobile_Number" placeholder=" Mobile Number"><br><br>
		<input type="text" name="Nationality" placeholder=" Nationality"><br><br> <br>
		
		
		<input type="password" name="Password1" placeholder=" Password"><br><br>
		<input type="password" name="Password2" placeholder=" Re-enter Password"><br><br><br>
		
		
		<b>Date Of Birth:</b> &nbsp <input type="date" name="DOB"><br><br>
		
		<b>Gender:</b> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
		<input type="radio" name="Gender" id="Male" value="Male">Male &nbsp
		<input type="radio" name="Gender" id="Female" value="Female">Female &nbsp
		<input type="radio" name="Gender" id="Other" value="Other">Other<br><br><br>
		
		<b>Address:</b> &nbsp &nbsp
		<input type="number" name="HFN" placeHolder=" House No. / Flat No."> &nbsp &nbsp
		<input type="text" name="SBC" placeholder=" Street / Building / Colony"> &nbsp &nbsp
		<input type="text" name="City" placeholder=" City"> <br> <br> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
		<input type="text" name="State" placeholder=" State"> &nbsp &nbsp
		<input type="text" name="Country" placeholder=" Country"> &nbsp &nbsp
		<input type="number" name="Postal_Code" placeholder=" Postal Code"> <br> <br> <br>
		
		
		<b>Security:</b> &nbsp &nbsp
		<input type="text" name="Birth_Place" placeholder=" Birth Place">  &nbsp &nbsp
		<input type="text" name="Pets_Name" placeHolder=" Name Of 1st Pet"> &nbsp &nbsp
		<input type="text" name="Favorite_Dish" placeholder=" Favorite Dish"><br><br><br>
		
		<b>Preferred Shoe Categories:</b> &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Categories" value="Sports">Sports &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Categories" value="Casual">Casual &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Categories" value="Formal">Formal &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Categories" value="Fashionable">Fashionabe <br> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Categories" value="Daily Use">Daily Use &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Categories" value="Tracking">Tracking &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Categories" value="Rough Use">Rough Use &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Categories" value="Laceless">Laceless<br><br>
		
		<b> Preferred Shoe Brands:</b> &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Woodland">Woodland &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Puma">Puma &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Nike">Nike &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Reebok">Reebok &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Adidas">Adidas <br> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Bata">Bata &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Converse">Converse &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Jordan">Jordan &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Bostonia">Bostonia &nbsp &nbsp
		<input type="checkbox" name="Preferred_Shoe_Brands" value="Testoni">Testoni<br><br><br>
		
		<div class="submit-or-clear">
			<input type="submit" value="SUBMIT"> &nbsp &nbsp
			<input type="reset" value="CLEAR">
		</div>
	</form>
	
	<br>
</body>
</html>