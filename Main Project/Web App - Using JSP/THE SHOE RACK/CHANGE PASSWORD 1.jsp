<%@page import = "java.sql.*"%>

<html>
<head>
	<title>CHANGE PASSWORD</title>
	<link rel="stylesheet" href="CHANGE PASSWORD 1.css">
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
	
	
	<!-- CHANGE PASSWORD -->
	<div class="ChangePassword">
		<h2>Change Password</h2>
		
		<%
			Connection conn = null;
			Statement st;
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
				
				st = conn.createStatement();
				
				String EMAIL_ID = request.getParameter("theUser");
				String PASSWORD = request.getParameter("Password1");
				
				
				String query = "Update USERS  set  PASSWORD = '" + PASSWORD + "'  where  EMAIL_ID = '" + EMAIL_ID + "'";
				int rRs = st.executeUpdate(query);
				
				
				if (session.getAttribute("NoRedirect") != null) {
					session.removeAttribute("NoRedirect");
				}
				
				
				if (rRs == 1) { %>
					<p>
						Your password has been reset successfully. <br>
						Try & Sign In again to confirm the same.
					</p>
				<% }
				else { %>
					<p>
						Sorry! <br> <br>
						There was a problem resetting your password.
					</p>
				<% }
			}
			
			catch (Exception e) {
				out.println("Exception: " + e.getMessage() + "");
			}
		%>
	</div>
</html>