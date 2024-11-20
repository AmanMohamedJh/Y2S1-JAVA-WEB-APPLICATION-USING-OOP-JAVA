<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Controller.DBConnect"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manager Page</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	background: url('images/pic5.jpg') no-repeat center center fixed;
	background-size: cover;
}

.background-blur {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	backdrop-filter: blur(8px);
	z-index: -1;
}

.form-container {
	margin: 20px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	max-width: 600px; /* Max width for the form container */
}

.form-container h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea {
	resize: vertical; /* Allows vertical resizing only */
}

button[type="submit"] {
	background-color: #337ab7; /* Button color */
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
	background-color: #0056b3; /* Darker shade on hover */
}
/* Navbar Styles */
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

/* Footer Styles */
footer {
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #333;
	color: white;
	padding: 20px;
	text-align: center;
	z-index: 1000;
}

.footer-content {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.footer-section {
	margin-right: 20px;
	width: 25%;
	text-align: center;
}

.footer-section h3 {
	color: #337ab7;
}

.footer-section ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.footer-section li {
	margin-bottom: 10px;
}

.footer-section a {
	color: #337ab7;
	text-decoration: none;
}

.footer-section a:hover {
	color: #23527c;
}

.footer-copyright {
	background-color: #333;
	color: #fff;
	padding: 10px;
	text-align: center;
	clear: both;
	width: 100%;
}
</style>
</head>
<body>

	<nav class="navbar">
		<div class="navbar-container">
			<!-- Logo -->
			<div class="navbar-logo">
				<a href="#"><img src="images/Logo.png" alt="Logo" /></a>
			</div>

			<!-- Menu Links -->
			<div class="navbar-links">
				<ul class="navbar-list">
					<li><a href="temphomepage.jsp">Home</a></li>
					<li><a href="HotelList.jsp">Hotels</a></li>
					<li><a href="manager.jsp">Be A Manager</a></li>
					<li><a href="#contact">Feedbacks</a></li>
				</ul>
			</div>

			<!-- Right-side Options -->
			<div class="navbar-right">
				<!-- User Profile -->
				<div class="navbar-profile">
					<img src="images/profile.jpg" alt="User" class="user-icon" />
					<div class="user-info">
						<%
                    String username = (String) session.getAttribute("username");
                    if (username != null) {
                    %>
						<span class="user-name"><%= username %></span> <a
							href="userProfile.jsp">Profile</a> <a href="logout.jsp"><button
								type="button" class="btn btn-danger"
								style="background-color: #337ab7; color: white;">Logout</button></a>
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

	<div class="form-container">
		<h2>Upload Hotel Details</h2>
		<form action="UploadHotelServlet" method="post">
			<div class="form-group">
				<label for="hotel_id">Hotel ID:</label> <input type="text"
					id="hotel_id" name="hotel_id" required>
			</div>
			<div class="form-group">
				<label for="hotelName">Hotel Name:</label> <input type="text"
					id="hotelName" name="hotelName" required>
			</div>
			<div class="form-group">
				<label for="roomType">Room Type:</label> <input type="text"
					id="roomType" name="roomType" required>
			</div>
			<div class="form-group">
				<label for="price">Price:</label> <input type="text" id="price"
					name="price" required>
			</div>
			<div class="form-group">
				<label for="rating">Rating:</label> <input type="text" id="rating"
					name="rating" required>
			</div>
			<div class="form-group">
				<label for="reviewCount">Review Count:</label> <input type="text"
					id="reviewCount" name="reviewCount" required>
			</div>
			<div class="form-group">
				<label for="location">Location:</label> <input type="text"
					id="location" name="location" required>
			</div>
			<div class="form-group">
				<label for="description">Description:</label>
				<textarea id="description" name="description" required></textarea>
			</div>
			<div class="form-group">
				<button type="submit">Upload Hotel</button>
			</div>
		</form>
	</div>

	<footer>
		<div class="footer-content">
			<div class="footer-section">
				<h3>About Us</h3>
				<ul>
					<li><a href="#mission">Mission</a></li>
					<li><a href="#vision">Vision</a></li>
					<li><a href="#team">Our Team</a></li>
				</ul>
			</div>
			<div class="footer-section">
				<h3>Contact</h3>
				<ul>
					<li><a href="#email">Email Us</a></li>
					<li><a href="#support">Support</a></li>
					<li><a href="#feedback">Feedback</a></li>
				</ul>
			</div>
			<div class="footer-section">
				<h3>Follow Us</h3>
				<ul>
					<li><a href="#facebook">Facebook</a></li>
					<li><a href="#twitter">Twitter</a></li>
					<li><a href="#instagram">Instagram</a></li>
				</ul>
			</div>
		</div>
		<div class="footer-copyright">&copy; 2024 Hotel Reservation
			System. All rights reserved.</div>
	</footer>

	<script src="JS/bootstrap.min.js"></script>
</body>
</html>
