<%@page import = "java.sql.*"%>

<html>
<head>
	<title>CONTACT US</title>
	<link rel="stylesheet" href="CONTACT US 1.css">
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
		</div>
		
		<%
			Connection conn = null;
			Statement st;
			ResultSet rs;
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
				
				int n = 0;
				
				st = conn.createStatement();
				
				
				rs = st.executeQuery("Select COUNT(*) from MESSAGE_DETAILS");
				
				if (rs.next()) {
					n = rs.getInt(1);
				}
				
				int MESSAGE_ID = 10000 + (n+1);
				
				
				String NAME = request.getParameter("Full_Name");
				String EMAIL_ID = request.getParameter("Email_ID");
				int MOBILE_NO = Integer.parseInt(request.getParameter("Mobile_Number"));
				String MESSAGE = request.getParameter("Message");
				String SITE_RATING = request.getParameter("Site_Rating");
				
				
				String query = "Insert into MESSAGE_DETAILS values ('" + MESSAGE_ID + "', '" + NAME + "', '" + EMAIL_ID + "', '" + MOBILE_NO + "', " + MESSAGE + ", '" + SITE_RATING + "')";
				int rRs = st.executeUpdate(query);
				
				if (rRs == 1) { %>
					<p>
						Your message has been delivered to us. <br>
						You will recieve an email concerning the same.
					</p>
				<% }
				else { %>
					<p>
						Sorry! <br> <br>
						Your message could not be delivered.
					</p>
				<% }
			}
			
			catch (Exception e) {
				out.println("Exception: " + e.getMessage() + "");
			}
		%>
	</div>
</html>