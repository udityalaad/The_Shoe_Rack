<%@page import = "java.sql.*"%>
<%@page import = "java.util.Date" %>
<%@page import = "java.text.SimpleDateFormat" %>

<html>
<head>
	<title>SIGN UP</title>
	<link rel="stylesheet" href="SIGN UP 1.css">
</head>

<body>
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
	
	
	<!-- SIGN UP -->
	<div class="SIGN_UP">
		<div class="form-head">
			<h2>SIGN UP</h2>
		</div>
		
		<%
			Connection conn = null;
			Statement st;
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
				out.println("connected....!!");
				
				SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-mm-dd");
				SimpleDateFormat formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
				
				
				// USERS
				String FIRST_NAME = request.getParameter("First_Name");
				
				String MIDDLE_NAME = request.getParameter("Middle_Name");
				if (MIDDLE_NAME == null) {
					MIDDLE_NAME = "";
				}
				
				String LAST_NAME = request.getParameter("Last_Name");
				String EMAIL_ID = request.getParameter("Email_ID");
				
				Date dob = formatter1.parse(request.getParameter("DOB"));
				String DOB = formatter2.format(dob);
				
				long  MOBILE_NO = Long.parseLong(request.getParameter("Mobile_Number"));
				String NATIONALITY = request.getParameter("Nationality");
				String PASSWORD = request.getParameter("Password1");
				String GENDER = request.getParameter("Gender");
				
				String BIRTH_PLACE = request.getParameter("Birth_Place");
				String FIRST_PET = request.getParameter("Pets_Name");
				String FAVOURITE_DISH = request.getParameter("Favorite_Dish");
				
				String PREF_SHOE_CAT = "";
				String[] PSC = request.getParameterValues("Preferred_Shoe_Categories");
				for (int i=0; i < PSC.length; i++) {
					if (i != 0) {
						PREF_SHOE_CAT += ",";
					}
					
					PREF_SHOE_CAT += PSC[i];
				}
				
				String PREF_SHOE_BRAND = "";
				String[] PSB = request.getParameterValues("Preferred_Shoe_Brands");
				for (int i=0; i<PSB.length; i++) {
					if (i != 0) {
						PREF_SHOE_BRAND += ",";
					}
					
					PREF_SHOE_BRAND += PSB[i];
				}
				
				
				// ADRRESS
				int H_F_N = Integer.parseInt(request.getParameter("HFN"));
				String S_B_C = request.getParameter("SBC");
				String CITY = request.getParameter("City");
				String STATE = request.getParameter("State");
				String COUNTRY = request.getParameter("Country");
				int POSTAL_CODE = Integer.parseInt(request.getParameter("Postal_Code"));
				
				
				
				st = conn.createStatement();
				
				String queryUSERS = "Insert into USERS values ('" + FIRST_NAME + "', '" + MIDDLE_NAME + "', '" + LAST_NAME + "', '" + EMAIL_ID + "', " + MOBILE_NO + ", '" + NATIONALITY + "', '" + PASSWORD + "', '" + DOB + "', '" + GENDER + "', '" + BIRTH_PLACE + "', '" + FIRST_PET + "', '" + FAVOURITE_DISH +  "', '" + PREF_SHOE_CAT + "', '" + PREF_SHOE_BRAND + "')";
				String queryADDRESS = "Insert into ADDRESS values ('" + EMAIL_ID + "', " + H_F_N + ", '" + S_B_C + "', '" + CITY + "', '" + STATE + "', '" + COUNTRY + "', " + POSTAL_CODE + ")";
				
				int rRs1 = st.executeUpdate(queryUSERS);
				
				if (rRs1 == 1) {
					int rRs2 = st.executeUpdate(queryADDRESS);
					
					if (rRs2 == 1) { %>
						<p>
							<b> Congratulations! <b>
							<br>
							Your Account has been created succesfully. Please try and Sign In to confirm the same.
						</p>
					<% }
					else { 
						String queryDeleteUser = "Delete from USERS where  EMAIL_ID = " + EMAIL_ID + ")"; %>
						
						int rRs3 = st.executeUpdate(queryDeleteUser);
						
						<p>
							Sorry! <br> <br>
							There was a problem creating your account.
						</p>
					<% }
				}
			}
			
			catch (Exception e) {
				out.println("Exception: " + e.getMessage() + "");
			}
		%>
	</div>
	
	<br>
</body>
</html>