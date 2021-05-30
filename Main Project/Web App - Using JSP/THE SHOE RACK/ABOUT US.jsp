<html>
<head>
	<title>ABOUT US</title>
	<link rel="stylesheet" href="ABOUT US.css">
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
		<a class="active" href="ABOUT US.jsp">ABOUT US</a>
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
	
	<!-- ABOUT US -->
	<div class="AboutUs">
		<h2>ABOUT US</h2>
		<div class="CompanyInfo">
			<p>
			THE SHOE RACK is an commerce and cloud computing company based in California which was founded by a group of 2 Engineering students from India. The tech giant is the largest Internet retailer of shoes in the world as measured by revenue and market capitalization and total sales. THE SHOE RACK started as an online shoe store with brands only local to the Indian subcontinent. As the time passed, the it started pulling in more brands, especially global brands. Almost every shoe company now sells its products on THE SHOE RACK.<br><br>
			
			THE SHOE RACK has separate retail websites for India, United States, the United Kingdom and Ireland, France, Canada, Germany, italy, Spain, Netherlands, Australia, Brazil, Japan, China, and Mexico. Recently, different language versions of THE SHOE RACK website were also launched. THE SHOE RACK also offers international shipping to certain other countries for some of its products.<br><br>
			
			THE SHOE RACK was founded in 2011 by Uditya Laad & Ishan Gude. Both were doing their Bachelor's in the Goa College Of Engineering at that time. It all started as a project for one of their important subject: Web Technology(WT). Then they took the idea further and finally started the company 6 months later.<br>
			</p>
		</div>
		
		<hr>
		
		<br>
		
		<h3>FOUNDERS:</h3>
		<div class="Founders">
			<div class="Uditya">
				<b>Uditya Laad</b><br><br>
				
				<b><u>Qualification:</u></b> Bachelor of Engineering, Information Technology - GEC, Goa<br><br>
				<b><u>Profession:</u></b> CEO, THE SHOE RACK
			</div>
			
			<div class="Ishan Gude">
				<b>Ishan Gude</b><br><br>
				
				<b><u>Qualification:</u></b> Bachelor of Engineering, Information Technology - GEC, Goa<br><br>
				<b><u>Profession:</u></b> Marketing Head, THE SHOE RACK
			</div>
	</div>
</html>