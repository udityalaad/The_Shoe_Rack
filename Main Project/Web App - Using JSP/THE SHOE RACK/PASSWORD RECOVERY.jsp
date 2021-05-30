<html>
<head>
	<title>PASSWORD RECOVERY</title>
	<link rel="stylesheet" href="PASSWORD RECOVERY.css">
	<script src="PASSWORD RECOVERY.js"></script>
</head>

<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	
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
	
	
	<!-- PASSWORD RECOVERY -->
	<div class="PasswordRecovery">
		<h2>Password Recovery</h2>
		
		<form name="PASSWORD_RECOVERY" onsubmit="return validateForm()" action="CHECK.jsp" method="post">
			<b>Please fill the following security requirements:</b> <br> <br>
			
			<input type="text" name="Email_ID" placeholder=" Email ID"> <br> <br>
			<input type="text" name="Birth_Place" placeholder=" Birth Place"> <br> <br>
			<input type="text" name="Pets_Name" placeHolder=" Name Of 1st Pet"> <br> <br>
			<input type="text" name="Favorite_Dish" placeholder=" Favorite Dish"> <br> <br> <br>
			
			<div class="submitInput">
				<input type="submit" value="RECOVER PASSWORD"> &nbsp &nbsp
			</div>
		</form>
	</div>
</html>