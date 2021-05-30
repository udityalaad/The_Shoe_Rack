<html>
<head>
	<title>SIGN IN</title>
	<link rel="stylesheet" href="SIGN IN.css">
	<script src="SIGN IN.js"></script>
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
	
	
	<!-- SIGN IN -->
	<div class="SignIn">
		<h2>Welcome</h2>
		<%
			String Referer = request.getHeader("referer");
			
			if(Referer.equals("http://localhost:1522/THE%20SHOE%20RACK/SUGGESTIONS.jsp")) { %>
				<form name="SIGN_IN" onSubmit="return validateForm()" action="SIGN IN 1.jsp?suggestionRedirect=true" method="post">
					<p><b>Sign In</b></p>
					
					<input type="text" name="Email_ID" placeholder=" Email ID"><br><br>
					<input type="password" name="Password" placeholder=" Password"><br><br>
					
					<input type="submit" value="LOGIN"> &nbsp &nbsp
				</form>
				
				<% } else { %>
				
				<form name="SIGN_IN" onSubmit="return validateForm()" action="SIGN IN 1.jsp" method="post">
					<p><b>Sign In</b></p>
					
					<input type="text" name="Email_ID" placeholder=" Email ID"><br><br>
					<input type="password" name="Password" placeholder=" Password"><br><br>
					
					<input type="submit" value="LOGIN"> &nbsp &nbsp
				</form>
			<% }
		%>
		
		
		<div class="Problem">
			<br> <br>
			<b>Forgot Password?</b> &nbsp <a href="PASSWORD RECOVERY.jsp">Click Here</a> <br> <br>
			<b>New to THE SHOE RACK?</b> &nbsp <a href="SIGN UP.jsp">Sign Up</a>
		</div>
	</div>
</html>