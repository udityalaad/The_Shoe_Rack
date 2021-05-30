<%@page import = "java.sql.*"%>
<%@page import = "java.text.SimpleDateFormat" %>

<html>
<head>
	<title>MY ACCOUNT</title>
	<link rel="stylesheet" href="MY ACCOUNT.css">
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
	
	
	<!-- MY ACCOUNT -->
	<div class="MyAccount" align="left">
		<h2>My Account</h2>
		
		<%
			if (session.getAttribute("userID") != null) {
				Connection conn = null;
				Statement st1, st2;
				ResultSet rsUSERS, rsADDRESS;
				
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
					
					SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
					
					String EMAIL_ID = session.getAttribute("userID").toString();
					
					st1 = conn.createStatement();
					st2 = conn.createStatement();
					
					String queryUSERS = "Select * from USERS where  EMAIL_ID = '" + EMAIL_ID + "'";
					rsUSERS = st1.executeQuery(queryUSERS);
					
					String queryADDRESS = "Select * from ADDRESS where  EMAIL_ID = '" + EMAIL_ID + "'";
					rsADDRESS = st2.executeQuery(queryADDRESS);
					
					if (rsUSERS.next() && rsADDRESS.next()) { %>
						<%
							String NAME = rsUSERS.getString("FIRST_NAME");
							
							if (rsUSERS.getString("MIDDLE_NAME") != null) {
								NAME += " " + rsUSERS.getString("MIDDLE_NAME");
							}
							
							NAME += " " + rsUSERS.getString("LAST_NAME");
						%>
						
						<table class="AccountData">
							<tr>
								<th> NAME </th>
								<td> <%= NAME %> </td>
							</tr>
							
							<tr>
								<th> EMAIL ID </th>
								<td> <%= rsUSERS.getString("EMAIL_ID") %> </td>
							</tr>
							
							<tr>
								<th> MOBILE NO </th>
								<td> <%= rsUSERS.getLong("MOBILE_NO") %> </td>
							</tr>
							
							<tr>
								<th> NATIONALITY </th>
								<td> <%= rsUSERS.getString("NATIONALITY") %> </td>
							</tr>
							
							<tr>
								<th> DATE OF BIRTH </th>
								<td> <%= formatter.format(rsUSERS.getDate("DOB")) %> </td>
							</tr>
							
							<tr>
								<th> GENDER </th>
								<td> <%= rsUSERS.getString("GENDER") %> </td>
							</tr>
							
							<% String ADDRESS = "H.No. " + rsADDRESS.getString("H_F_N") + ", " + rsADDRESS.getString("S_B_C") + ", " + rsADDRESS.getString("CITY") + ", " + rsADDRESS.getString("STATE") + ", " + rsADDRESS.getString("COUNTRY") + ", " + rsADDRESS.getString("POSTAL_CODE"); %>
							<tr>
								<th> ADDRESS </th>
								<td> <%= ADDRESS %> </td>
							</tr>
							
							<tr>
								<th> PREFFERED SHOE CATEGORIES </th>
								<td> <%= rsUSERS.getString("PREF_SHOE_CAT") %> </td>
							</tr>
							
							<tr>
								<th> PREFFERED SHOE BRANDS </th>
								<td> <%= rsUSERS.getString("PREF_SHOE_BRAND") %> </td>
							</tr>
						</table>
						
						<br> <br>
						
						<form name="ChangePassword" action="CURRENT PASSWORD.jsp?value=ChangePassword" method="post">
							<input type="submit" value="CHANGE PASSWORD"> &nbsp &nbsp
						</form>
						
						<form name="DeleteAccount" action="CURRENT PASSWORD.jsp?value=DeleteAccount" method="post">
							<input type="submit" value="DELETE ACCOUNT"> &nbsp &nbsp
						</form>
					<% }
				}
				
				catch (Exception e) {
					out.println("Exception: " + e.getMessage() + "");
				}
			}
		%>
	</div>
</html>