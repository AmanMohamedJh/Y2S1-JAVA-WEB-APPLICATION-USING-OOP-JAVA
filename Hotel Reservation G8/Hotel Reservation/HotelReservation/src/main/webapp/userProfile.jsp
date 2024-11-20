<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style>
/* Styling the entire page with background and blurring effect */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background: url('images/pic2.jpg') no-repeat center center fixed;
	background-size: cover;
}

.container {
	width: 100%;
	max-width: 600px;
	margin: 50px auto;
	background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
	padding: 20px;
	box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	backdrop-filter: blur(10px); /* Blurring effect behind the container */
}

/* Adding a slight blur to the background image */
body::before {
	content: '';
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: inherit;
	filter: blur(8px);
	z-index: -1;
}

h2 {
	text-align: center;
	color: #333;
	font-size: 24px;
	margin-bottom: 20px;
}

p {
	font-size: 16px;
	line-height: 1.5;
	color: #555;
}

label {
	font-size: 14px;
	color: #333;
	margin-top: 10px;
}

input[type="text"], input[type="email"] {
	width: calc(100% - 20px);
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	display: block;
	width: 100%;
	padding: 10px;
	border: none;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
	margin-top: 20px;
	border-radius: 4px;
}

.logout-btn {
	background-color: #f44336;
	color: white;
}

.logout-btn:hover {
	background-color: #d32f2f;
}

.update-btn {
	background-color: #4CAF50;
	color: white;
}

.update-btn:hover {
	background-color: #388E3C;
}

.delete-btn {
	background-color: #FF5722;
	color: white;
}

.delete-btn:hover {
	background-color: #D84315;
}

/* Responsive adjustments */
@media screen and (max-width: 768px) {
	.container {
		width: 90%;
		margin: 20px auto;
	}
}
.navbar {
	background-color: #333;
	overflow: hidden;
	padding: 10px 20px;
	transition: all 0.3s ease;
}

.navbar-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.navbar-logo img {
	width: 100px;
	height: 50px;
	object-fit: cover;
	margin-right: 20px;
}

.navbar-links {
	flex: 1;
	text-align: center;
}

.navbar-list {
	list-style: none;
	margin: 0;
	padding: 0;
}

.navbar-list li {
	display: inline-block;
	margin-left: 20px;
}

.navbar-list li a {
	color: white;
	text-decoration: none;
	padding: 10px;
	transition: all 0.3s ease;
}

.navbar-list li a:hover {
	background-color: #555;
	color: white;
}

.navbar-right {
	display: flex;
	align-items: center;
}

.navbar-profile {
	display: flex;
	align-items: center;
}

.user-icon {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 10px;
}

.user-name {
	color: white;
	margin-left: 10px;
}

.navbar-dropdown {
	margin-left: 20px;
	position: relative;
}

.dropdown-btn {
	background-color: #333;
	color: white;
	padding: 10px;
	border: none;
	cursor: pointer;
	transition: all 0.3s ease;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	z-index: 1;
	transition: all 0.3s ease;
}

.dropdown-content a {
	padding: 12px 16px;
	display: block;
	text-decoration: none;
	color: black;
	transition: all 0.3s ease;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.navbar-dropdown:hover .dropdown-content {
	display: block;
}

</style>
</head>
<body>
	<nav class="navbar">
		<div class="navbar-container">
			<div class="navbar-logo">
				<a href="#"><img src="images/Logo.png" alt="Logo"></a>
			</div>
			<div class="navbar-links">
				<ul class="navbar-list">
					<li><a href="temphomepage.jsp">Home</a></li>
					<li><a href="HotelList.jsp">Hotels</a></li>
					<li><a href="manager.jsp">Be A Manager</a></li>
					<li><a href="viewBooking.jsp">View bookings</a></li>
					<li><a href="#contact">Feedbacks</a></li>
					<li><a href="#contact">Inquiries</a></li>
				</ul>
			</div>
			<div class="navbar-right">
				<div class="navbar-profile">
					<img src="images/profile.jpg" alt="User" class="user-icon" />
					<div class="user-info">
						<%
                        String username = (String) session.getAttribute("username");
                        if (username != null) {
                        %>
						<span class="user-name"><%= username %></span> <a
							href="userProfile.jsp" style="color: white;">Profile</a> <a
							href="logout.jsp"><button type="button"
								class="btn btn-danger">Logout</button></a>
						<% } else { %>
						<div class="navbar-buttons">
							<a href="Register.jsp"><button type="button"
									class="btn btn-success">Register</button></a> <a href="login.jsp"><button
									type="button" class="btn btn-warning">Login</button></a>
						</div>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<div class="container">
		<h2>
			Welcome,
			<%= session.getAttribute("name") != null ? session.getAttribute("name") : "User" %>!
		</h2>
		<p>
			<strong>Username:</strong>
			<%= session.getAttribute("username") %></p>
		<p>
			<strong>Email:</strong>
			<%= session.getAttribute("email") != null ? session.getAttribute("email") : "" %></p>
		<p>
			<strong>Phone Number:</strong>
			<%= session.getAttribute("phone") != null ? session.getAttribute("phone") : "" %></p>
		<p>
			<strong>Address:</strong>
			<%= session.getAttribute("address") != null ? session.getAttribute("address") : "" %></p>

		<!-- Update Form -->
		<form action="profileServlet" method="post">
			<input type="hidden" name="action" value="update">
			<h3>Update Your Details</h3>
			<label>Name:</label> <input type="text" name="name"
				value="<%= session.getAttribute("name") != null ? session.getAttribute("name") : "" %>"
				required><br> <label>Email:</label> <input type="email"
				name="email"
				value="<%= session.getAttribute("email") != null ? session.getAttribute("email") : "" %>"
				required><br> <label>Phone Number:</label> <input
				type="text" name="phone"
				value="<%= session.getAttribute("phone") != null ? session.getAttribute("phone") : "" %>"
				required><br> <label>Address:</label> <input
				type="text" name="address"
				value="<%= session.getAttribute("address") != null ? session.getAttribute("address") : "" %>"
				required><br> <input type="submit" value="Update"
				class="update-btn">
		</form>

		<!-- Delete Account Form -->
		<form action="profileServlet" method="post">
			<input type="hidden" name="action" value="delete"> <input
				type="submit" value="Delete Account" class="delete-btn">
		</form>
	</div>
</body>
</html>
