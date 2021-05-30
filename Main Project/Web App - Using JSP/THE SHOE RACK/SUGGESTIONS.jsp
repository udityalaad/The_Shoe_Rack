<%@page import = "java.sql.*"%>
<%@page import = "java.text.SimpleDateFormat" %>

<html>
<head>
	<title>SUGGESTIONS</title>
	<link rel="stylesheet" href="SUGGESTIONS.css">
	<script src="SEARCH.js"></script>
</head>

<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		
		
	%>
	
	<% if (session.getAttribute("userID") == null) {
		session.setAttribute("suggestionsRedirect", "true");
		response.sendRedirect("SIGN IN.jsp");
	} %>
	
	<div class="header">
		<br>
		<h1>&nbsp THE SHOE RACK</h1>
		<p>&nbsp &nbsp &nbsp Put your best feet forward</p>
	</div>
	
	<nav>
		<a href="HOME.jsp">HOME</a>
		<a class="active" href="SUGGESTIONS.jsp">SUGGESTIONS</a>
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
	
	<!-- Content -->
	<div class="content">
		<div class="search">
			<form name="SearchBar" onSubmit="return validateForm()" action="SEARCH.jsp" method="post">
				<input type="text" name="Search" placeholder="Search"> <br> <br>
				<input type="submit" name="SearchButton" value="Search"> <br> <br>
				
				<div class="categories">
					<b>Categories:</b>
					<ul style="list-style-type:none">
						<li><a href="SEARCH.jsp?value=Sports">Sports</a><li>
						<li><a href="SEARCH.jsp?value=Casual">Casual</a><li>
						<li><a href="SEARCH.jsp?value=Formal">Formal</a><li>
						<li><a href="SEARCH.jsp?value=Fashionable">Fashionable</a><li>
						<li><a href="SEARCH.jsp?value=Daily Use">Daily Use</a><li>
						<li><a href="SEARCH.jsp?value=Tracking">Tracking</a><li>
						<li><a href="SEARCH.jsp?value=Rough Use">Rough Use</a><li>
						<li><a href="SEARCH.jsp?value=Laceless">Laceless</a><li>
					</ul>
				</div>
				
				<div></div>
				
				<div class="brands">
					<b>Brands:</b>
					<ul style="list-style-type:none">
						<li><a href="SEARCH.jsp?value=Woodland">Woodland</a><li>
						<li><a href="SEARCH.jsp?value=Puma">Puma</a><li>
						<li><a href="SEARCH.jsp?value=Nike">Nike</a><li>
						<li><a href="SEARCH.jsp?value=Reebok">Reebok</a><li>
						<li><a href="SEARCH.jsp?value=Adidas">Adidas</a><li>
						<li><a href="SEARCH.jsp?value=Bata">Bata</a><li>
						<li><a href="SEARCH.jsp?value=Converse">Converse</a><li>
						<li><a href="SEARCH.jsp?value=Jordan">Jordan</a><li>
						<li><a href="SEARCH.jsp?value=Bostonia">Bostonia</a><li>
						<li><a href="SEARCH.jsp?value=Testoni">Testoni</a><li>
					</ul>
				</div>
			</form>
		</div>
		
		&nbsp &nbsp &nbsp &nbsp &nbsp
		<div class="PageContent">
			<div class="PCHeading">
				<h2>Suggestions</h2>
			</div>
			
			
			<hr>
			
			<br>
			
			<%
				Connection conn = null;
				Statement st;
				ResultSet rsUSER, rsCAT, rsBRAND;
				
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
					
					SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
					
					
					String EMAIL_ID = session.getAttribute("userID").toString();
					
					st = conn.createStatement();
					
					String queryUSER = "Select * from USERS where  EMAIL_ID = '" + EMAIL_ID + "'";
					rsUSER = st.executeQuery(queryUSER);
					
					if (rsUSER.next()) {
						String PSC[] = rsUSER.getString("PREF_SHOE_CAT").split(",");
						String PSB[] = rsUSER.getString("PREF_SHOE_BRAND").split(","); %>
						
						<table>
							<% for (int i=0; i<PSC.length; i++) {
								String queryCAT = "Select * from SHOES where  CATEGORY = '" + PSC[i] + "'";
								rsCAT = st.executeQuery(queryCAT);
								
								if (rsCAT.next()) { %>
									<% do { %>
										<tr>
											<% String shoeImage = "Images/" + rsCAT.getString("BRAND") + " - " + rsCAT.getString("NAME") + ".jpg"; %>
											
											<td>
												<a href="PRODUCT.jsp?ShoeNo=<%= rsCAT.getInt("SHOE_NO")%>">
													<img src="<%= shoeImage %>" class="shoe_image" alt="<%= shoeImage %>" > </div>
												</a>
											</td>
											
											<td>
												<a href="PRODUCT.jsp?ShoeNo=<%= rsCAT.getInt("SHOE_NO")%>">
													<div class="brand"> <b> <%= rsCAT.getString("BRAND") %> </b> </div>
													<b> <%= rsCAT.getString("NAME") %> </b> <br> <br>
													<b> Category: </b> <%= rsCAT.getString("CATEGORY") %> <br> <br>
													<b> Date: </b> <%= formatter.format(rsCAT.getDate("LAUNCH_DATE")) %>
												</a>
											</td>
											
											<td>
												<a href="PRODUCT.jsp?ShoeNo=<%= rsCAT.getInt("SHOE_NO")%>">
													<b> Price: </b> &nbsp  Rs. <%= rsCAT.getString("PRICE") %> &nbsp <br> <br>
													
													<a href="BUY NOW.jsp"> <img src="Buy Now.png" class="buy_now" alt="Buy Now"> </a>
													&nbsp &nbsp
													<a href="CART.jsp"> <img src="Add To Cart.png" class="add_to_cart"alt="Add To Cart"> </a>
												</a>
											</td>
										<tr>
									<% } while (rsCAT.next());
								}
							}
							
							for (int i=0; i<PSB.length; i++) {
								String queryBRAND = "Select * from SHOES where  BRAND = '" + PSB[i] + "'";
								rsBRAND = st.executeQuery(queryBRAND);
								
								if (rsBRAND.next()) { %>
									<% do { %>
										<tr>
											<% String shoeImage = "Images/" + rsBRAND.getString("BRAND") + " - " + rsBRAND.getString("NAME") + ".jpg"; %>
											
											<td>
												<a href="PRODUCT.jsp?ShoeNo=<%= rsBRAND.getInt("SHOE_NO")%>">
													<img src="<%= shoeImage %>" class="shoe_image" alt="<%= shoeImage %>" > </div>
												</a>
											</td>
											
											<td>
												<a href="PRODUCT.jsp?ShoeNo=<%= rsBRAND.getInt("SHOE_NO")%>">
													<div class="brand"> <b> <%= rsBRAND.getString("BRAND") %> </b> </div>
													<b> <%= rsBRAND.getString("NAME") %> </b> <br> <br>
													<b> Category: </b> <%= rsBRAND.getString("CATEGORY") %> <br> <br>
													<b> Date: </b> <%= formatter.format(rsBRAND.getDate("LAUNCH_DATE")) %>
												</a>
											</td>
											
											<td>
												<a href="PRODUCT.jsp?ShoeNo=<%= rsBRAND.getInt("SHOE_NO")%>">
													<b> Price: </b> &nbsp  Rs. <%= rsBRAND.getString("PRICE") %> &nbsp <br> <br>
													
													<a href="BUY NOW.jsp"> <img src="Buy Now.png" class="buy_now" alt="Buy Now"> </a>
													&nbsp &nbsp
													<a href="CART.jsp"> <img src="Add To Cart.png" class="add_to_cart"alt="Add To Cart"> </a>
												</a>
											</td>
										<tr>
									<% } while (rsBRAND.next());
								}
							} %>
							
						</table>
						
					<% }
				}
				catch (Exception e) {
					out.println("Exception: " + e.getMessage() + "");
				}
			%>
		</div>
	</div>
</body>
</html>