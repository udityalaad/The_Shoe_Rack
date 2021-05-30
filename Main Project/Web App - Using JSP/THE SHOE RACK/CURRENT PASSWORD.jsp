<html>
<head>
	<title>CURRENT PASSWORD</title>
	<link rel="stylesheet" href="CURRENT PASSWORD.css">
	<script src="CURRENT PASSWORD.js"></script>
</head>

<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	
	<% if (session.getAttribute("userID") == null) {
		response.sendRedirect("SIGN IN.jsp");
	} %>
	
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
	
	
	<!-- CURRENT PASSWORD -->
	<div class="formData">
		<% if (request.getParameter("value").equals("ChangePassword")) {%>
			<form name="CURRENT_PASSWORD" onsubmit="return validateForm()" action="CHECK.jsp" method="post">
				<b>Enter Current Password: <br> <br>
				
				<input type="password" name="Password" placeholder=" Current Password"><br><br>
		<% }
		else if (request.getParameter("value").equals("DeleteAccount")) {
			session.setAttribute("NoRedirect", "true"); %>
			
			<form name="CURRENT_PASSWORD" onsubmit="return validateForm()" action="DELETE ACCOUNT.jsp" method="post">
				<b>Enter Password: <br> <br>
				
				<input type="password" name="Password" placeholder=" Password"><br><br>
		<% } %>
				
				
				<input type="submit" value="SUBMIT"> &nbsp &nbsp
				<input type="reset" value="CLEAR">
			</form>
			
		<br>
	</div>
</body>
</html>