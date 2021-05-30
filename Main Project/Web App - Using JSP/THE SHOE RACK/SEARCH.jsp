<%@page import = "java.sql.*"%>
<%@page import = "java.text.SimpleDateFormat" %>

<html>
<head>
	<title>SEARCH</title>
	<link rel="stylesheet" href="SEARCH.css">
	<script src="SEARCH.js"></script>
</head>

<body>
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	
	<%!
		String SEARCH;
		
		boolean searchProd (String s, String prodDetails) {
			String search[] = s.split(",");
			
			for (int i=0; i<search.length; i++) {
				if (prodDetails.toLowerCase().contains(search[i].toLowerCase())) {
					return true;
				}
			}
			
			return false;
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
		
		<% 
			String searchButton = request.getParameter("SearchButton");
			
			if (searchButton != null) {
				SEARCH = request.getParameter("Search");
			}
			else {
				SEARCH = request.getParameter("value");
			}
		%>
		
		<a class="active" href="SEARCH.jsp?value=<%= SEARCH%> ">SEARCH</a>
			
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
				<h2>Search</h2>
			</div>
			
			<hr>
			
			<br>
			
			<%
				Connection conn = null;
				Statement st;
				ResultSet rs;
				
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "uditya", "uditya1234");
					
					SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
					
					st = conn.createStatement();
					
					String query = "Select * from SHOES";
					rs = st.executeQuery(query);
					
					boolean searchSuccess = false;
					
					if (rs.next()) { %>
						<table>
							<% do {
								String prodDetails = rs.getString("BRAND") + "," + rs.getString("NAME") + "," + rs.getString("CATEGORY");
								
								if (searchProd(SEARCH, prodDetails)) {
									searchSuccess = true; %>
									<tr>
										<% String shoeImage = "Images/" + rs.getString("BRAND") + " - " + rs.getString("NAME") + ".jpg"; %>
										
										<td>
											<a href="PRODUCT.jsp?ShoeNo=<%= rs.getInt("SHOE_NO")%>">
												<img src="<%= shoeImage %>" class="shoe_image" alt="<%= shoeImage %>" > </div>
											</a>
										</td>
										
										<td>
											<a href="PRODUCT.jsp?ShoeNo=<%= rs.getInt("SHOE_NO")%>">
												<div class="brand"> <b> <%= rs.getString("BRAND") %> </b> </div>
												<b> <%= rs.getString("NAME") %> </b> <br> <br>
												<b> Category: </b> <%= rs.getString("CATEGORY") %> <br> <br>
												<b> Date: </b> <%= formatter.format(rs.getDate("LAUNCH_DATE")) %>
											</a>
										</td>
										
										<td>
											<a href="PRODUCT.jsp?ShoeNo=<%= rs.getInt("SHOE_NO")%>">
												<b> Price: </b> &nbsp  Rs. <%= rs.getString("PRICE") %> &nbsp <br> <br>
												
												<a href="BUY NOW.jsp"> <img src="Buy Now.png" class="buy_now" alt="Buy Now"> </a>
												&nbsp &nbsp
												<a href="CART.jsp"> <img src="Add To Cart.png" class="add_to_cart"alt="Add To Cart"> </a>
											</a>
										</td>
									<tr>
								<% }
							}while (rs.next());%>
						</table>
					<% }
					
					
					if (!searchSuccess) { %>
						<p>
							Sorry! <br>
							No results were found.
						</p>
					<% }
				}
				catch (Exception e) {
					out.println("Exception: " + e.getMessage() + "");
				}
			%>
		<div>
	<div>
</body>
</html>