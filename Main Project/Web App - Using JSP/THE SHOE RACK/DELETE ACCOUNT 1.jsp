<%@page import = "java.sql.*"%>

<html>
<head>
	<title>DELETE ACCOUNT</title>
	<link rel="stylesheet" href="DELETE ACCOUNT 1.css">
</head>

<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	
	<%
		if (request.getParameter("value").equals("success")  ||  request.getParameter("value").equals("failure")) {
			session.removeAttribute("userID");
		}
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
	<div class="DeleteAccount">
		<div class="form-head">
			<h2>DELETE ACCOUNT</h2>
		</div>
		
		<% if (request.getParameter("value").equals("success")) { %>
			<p>
				Account deleted successfully.
			</p>
		<% }
		else if (request.getParameter("value").equals("failure")) { %>
			<p>
				Sorry! <br>
				Invalid credentials. <br> <br>
				
				You have been Logged Out due to security reasons.
			</p>
		<% } %>
	</div>
</html>