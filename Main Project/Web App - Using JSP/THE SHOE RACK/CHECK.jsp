<%@page import = "java.sql.*"%>

<html>
<head>
	<title>CHECK</title>
	<link rel="stylesheet" href="CHECK.css">
	<script src="CHECK.js"></script>
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
	
	
	<!-- CHECK-->
	<div class="Check">
		<h2>Check</h2>
		
		<%
			Connection conn = null;
			Statement st;
			ResultSet rs;
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
				
				String EMAIL_ID = "", query = "";
				
				String Referer = request.getHeader("referer");
				
				if (Referer.equals("http://localhost:1522/THE%20SHOE%20RACK/PASSWORD%20RECOVERY.jsp")) {
					EMAIL_ID = request.getParameter("Email_ID");
					String BIRTH_PLACE = request.getParameter("Birth_Place");
					String FIRST_PET = request.getParameter("Pets_Name");
					String FAVORITE_DISH = request.getParameter("Favorite_Dish");
					
					query = "Select * from USERS where  EMAIL_ID = '" + EMAIL_ID + "'  and  BIRTH_PLACE = '" + BIRTH_PLACE + "'  and  FIRST_PET = '" + FIRST_PET + "'  AND  FAVORITE_DISH = '" + FAVORITE_DISH + "'";
					
					st = conn.createStatement();
					rs = st.executeQuery(query);
					
					if (rs.next()) {
						session.setAttribute("NoRedirect", "true");
						response.sendRedirect("CHANGE PASSWORD.jsp?value=success&Email_ID=" + EMAIL_ID + "&process=PasswordRecovery");
					}
					else {
						response.sendRedirect("CHANGE PASSWORD.jsp?value=failure");
					}
				}
				else if (Referer.equals("http://localhost:1522/THE%20SHOE%20RACK/CURRENT%20PASSWORD.jsp?value=ChangePassword")) {
					EMAIL_ID = session.getAttribute("userID").toString();
					String PASSWORD = request.getParameter("Password");
					
					query = "Select * from USERS where  EMAIL_ID = '" + EMAIL_ID + "'  and  PASSWORD = '" + PASSWORD + "'";
					
					st = conn.createStatement();
					rs = st.executeQuery(query);
					
					if (rs.next()) {
						session.setAttribute("NoRedirect", "true");
						response.sendRedirect("CHANGE PASSWORD.jsp?value=success&Email_ID=" + EMAIL_ID + "&process=ChangePassword");
					}
					else {
						response.sendRedirect("CHANGE PASSWORD.jsp?value=failure");
					}
				}
			}
			
			catch (Exception e) {
				out.println("Exception: " + e.getMessage());
			}
		%>
	</div>
</html>