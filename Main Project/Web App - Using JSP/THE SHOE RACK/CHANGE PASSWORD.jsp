<%@page import = "java.sql.*"%>

<html>
<head>
	<title>CHANGE PASSWORD</title>
	<link rel="stylesheet" href="CHANGE PASSWORD.css">
	<script src="CHANGE PASSWORD.js"></script>
</head>

<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	
	<%
		String process = request.getParameter("process");
		
		if ((session.getAttribute("userID") == null && request.getParameter("process").equals("ChangePassword"))  ||  session.getAttribute("NoRedirect") == null) {
			if (request.getParameter("process").equals("PasswordRecovery")) {
				response.sendRedirect("SIGN IN.jsp");
			}
			else if (request.getParameter("process").equals("ChangePassword")) {
				response.sendRedirect("HOME.jsp");
			}
		}
		
		
		if (request.getParameter("value").equals("failure")) {
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
	
	
	<!-- CHANGE PASSWORD -->
	<div class="ChangePassword">
		<h2>Change Password</h2>
		
		<%
			if (request.getParameter("value").equals("success")) {
				String EMAIL_ID = request.getParameter("Email_ID"); %>
				
				<form name="CHANGE_PASSWORD" onsubmit="return validateForm()" action="CHANGE PASSWORD 1.jsp?process=<%= process%>" method="post">
					<input type="hidden" name="theUser" value=<%= EMAIL_ID%> >
					
					<b>Enter New Password: <br> <br>
					<input type="password" name="Password1" placeholder=" New Password"> <br> <br>
					<input type="password" name="Password2" placeholder=" Re-Enter New Password"> <br> <br> <br>
					
					<div class="submitInput">
						<input type="submit" value="SUBMIT"> &nbsp &nbsp
					</div>
				</form>
			<% }
			else if(request.getParameter("value").equals("failure")) { %>
				<p>
					Sorry! <br>
					Invalid credentials. <br> <br>
					
					You have been Logged Out due to security reasons.
				</p>
			<% }
			else {
				out.println(request.getParameter("value"));
			}
		%>
	</div>
</html>