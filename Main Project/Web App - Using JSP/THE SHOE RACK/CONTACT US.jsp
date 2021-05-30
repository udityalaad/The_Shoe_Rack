<html>
<head>
	<title>CONTACT US</title>
	<link rel="stylesheet" href="CONTACT US.css">
	
	<script src="CONTACT US.js"></script>
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
		<a class="active" href="CONTACT US.jsp">CONTACT US</a>
			
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
	
	<!-- CONTACT US -->
	<div class="contactUs">
		<div class="contactUs-head">
			<h2 text-align="center">CONTACT US</h2>
			
			<hr>
			
			<h3>Always Ready To Help!</h3>
			
			<p>We like to solve issues with full customer satisfaction. Feel free to say hello.</p> <br>
		</div>
		
		<form name="CONTACT_US" onsubmit="return validateForm()" action="CONTACT US 1.jsp" method="post">
			<input type="text" name="Full_Name" placeholder=" Full Name"><br><br>
			<input type="text" name="Email_ID" placeholder=" Email ID"><br><br>
			<input type="number" name="Mobile_Number" placeholder=" Mobile Number"><br><br>
			
			<textarea name="Message" placeholder=" Message" type="scroll" rows="4" cols="40"></textarea><br><br>
			
			Rate our site:
			<select name="Site_Rating">
				<option value="">None</option>
				<option value="Amazing">Amazing</option>
				<option value="Good">Good</option>
				<option value="Average">Average</option>
				<option value="Bad">Bad</option>
			</select><br><br><br>
			
			<div class="submit-or-clear">
				<input type="submit" value="SUBMIT"> &nbsp &nbsp
				<input type="reset" value="CLEAR">
			</div>
		</form>
		
		<br>
		
		<div class="contactInfo">
			<b>ADRRESS:</b>  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp The Shoe Rack <br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						Cupertino, CA 95014 <br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						USA <br> <br>
			<b>CONTACT NUMBER:</b> &nbsp&nbsp (617)312-2190<br><br>
			<b>EMAIL:</b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp support@theshoerack.com
		</div>
		
		<div class="additionalInfo">
			<h4>You can also follow us on Facebook, Twitter, Instagram to keep in touch with the latest updates.<h4>
		<div>
	</div>
</html>