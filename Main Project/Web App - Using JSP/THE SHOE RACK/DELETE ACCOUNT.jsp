<%@page import = "java.sql.*"%>

<html>
<head>
	<title>DELETE ACCOUNT</title>
	<link rel="stylesheet" href="DELETE ACCOUNT.css">
</head>

<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>

	<% if (session.getAttribute("userID") == null  ||  session.getAttribute("NoRedirect") == null) {
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
		
		<%
			response.setHeader("Cache-Control","no-cache");
			response.setHeader("Cache-Control","no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
		%>
	</nav>
	
	<br>
	
	
	<!-- SIGN IN -->
	<div class="DeleteAccount">
		<div class="form-head">
			<h2>DELETE ACCOUNT</h2>
		</div>
		
		<%
			Connection conn = null;
			Statement st;
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
				
				String query = "";
				
				st = conn.createStatement();
				
				String EMAIL_ID = session.getAttribute("userID").toString();
				String PASSWORD = request.getParameter("Password");
				
				query = "Delete from USERS where  EMAIL_ID = '" + EMAIL_ID + "'  and  PASSWORD = '" + PASSWORD + "'";
				int rRs = st.executeUpdate(query);
				
				if (rRs == 1) {
					response.sendRedirect("DELETE ACCOUNT 1.jsp?value=success");
				}
				else {
					response.sendRedirect("DELETE ACCOUNT 1.jsp?value=failure");
				}
			}
			catch (Exception e) {
				out.println("Exception: " + e.getMessage() + "");
			}
		%>
	</div>
</html>