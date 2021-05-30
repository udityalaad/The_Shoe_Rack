<%@page import = "java.sql.*"%>

<html>
<head>
	<title>SIGN IN</title>
	<link rel="stylesheet" href="SIGN IN 1.css">
</head>

<body>
	<!-- Global Variables -->
	<%!
		boolean SignIn_Successfull = false;
		String userName, query;
	%>
	
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	
	<%
		Connection conn = null;
		Statement st;
		ResultSet rs;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
			
			String EMAIL_ID = request.getParameter("Email_ID");
			String PASSWORD = request.getParameter("Password");
			
			st = conn.createStatement();
			
			query = "Select * from USERS where  EMAIL_ID = '" + EMAIL_ID + "'  AND  PASSWORD = '" + PASSWORD + "'";
			rs = st.executeQuery(query);
			
			if (rs.next()) {
				SignIn_Successfull = true;
				
				session.setAttribute("userID", EMAIL_ID);
				
				userName = rs.getString("FIRST_NAME") + " " + rs.getString("MIDDLE_NAME") + " " + rs.getString("LAST_NAME");
				
				if (request.getParameter("suggestionsRedirect").equals("true")) {
					response.sendRedirect("SUGGESTIONS.jsp");
				}
			}
			else {
				SignIn_Successfull = false;
			}
		}
		catch (Exception e) {
			out.println("Exception: " + e.getMessage() + "");
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
	<div class="SignIn">
		<div class="form-head">
			<h2>SIGN IN</h2>
		</div>
		
		<%
			if (SignIn_Successfull) { %>
				<p>
					Welcome <%= userName %> <br> <br>
					You have Signed In successfully.
				</p>
			<% }
			else { %>
				<p>
					Sorry! <br> <br>
					Sign In failed. <br> <br>
					Invalid credentials.
				</p>
			<% }
		%>
		
	</div>
</html>