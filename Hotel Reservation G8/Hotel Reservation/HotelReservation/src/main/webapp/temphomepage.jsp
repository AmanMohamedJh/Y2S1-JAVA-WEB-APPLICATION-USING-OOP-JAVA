<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOMEPAGE</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<style>
/* Global Styles */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	font-weight: bold;
	line-height: 1.6;
	color: #333;
	background-color: #f0f0f0;
}

a {
	text-decoration: none;
	color: #337ab7;
}

a:hover {
	color: #23527c;
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

/* Hero Section Styles */
.hero {
	background-color: #f0f0f0;
	padding: 20px;
	text-align: center;
	transition: all 0.3s ease;
}

.hero-content {
	margin-bottom: 20px;
}

.hero-image {
	width: 100%;
	height: 300px;
	background-size: cover;
	background-position: center;
	transition: all 0.3s ease;
}

.hero-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* Features Section Styles */
.features {
	padding: 20px;
	background-color: #f0f0f0;
	transition: all 0.3s ease;
}

.feature {
	margin-bottom: 20px;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	transition: all 0.3s ease;
}

.feature img {
	width: 100%;
	height: 150px;
	object-fit: cover;
	border-radius: 10px 10px 0 0;
	transition: all 0.3s ease;
}

.feature:hover {
	background-color: #f5f5f5;
}


.call-to-action {
	padding: 20px;
	background-color: #333;
	color: #fff;
	text-align: center;
	transition: all 0.3s ease;
}


.call-to-action {
	padding: 20px;
	background-color: #333;
	color: #fff;
	text-align: center;
	transition: all 0.3s ease;
}

.call-to-action button {
	background-color: #337ab7;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	transition: all 0.3s ease;
}

.call-to-action button:hover {
	background-color: #23527c;
}

/* Button Styles */
button {
	border-radius: 10px;
	background-color: #337ab7;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	transition: all 0.3s ease;
}

button:hover {
	background-color: #23527c;
}

.gallery {
	padding: 20px;
	text-align: center;
}

.gallery-item {
	display: inline-block;
	margin: 0 10px;
	width: calc(30% - 20px);
}

.gallery-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 10px;
}

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
    width: 25%; /* Set the width of each section to 25% */
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
}
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
					<li><a href="Feedback.jsp">Feedbacks</a></li>
					<li><a href="#contact">Inquiries</a></li>
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
								type="button" class="btn btn-danger">Logout</button></a>
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

	<!-- Page Content -->

	<!-- Hero Section -->
	<div class="hero">
		<div class="hero-content">
			<h1>Welcome to Wilson Hotel Booking System</h1>
			<p>Book your dream hotel with us and experience the best
				hospitality</p>
			<a href="HotelList.jsp"><button type="button"
					class="btn btn-primary">Book Now</button></a>
		</div>
		<div class="hero-image">
			<img src="images/pic6.jpg" alt="Hero Image">
		</div>
	</div>

	<!-- Features Section -->
	<div class="features">
	<h2>Why Choose Us?</h2>
	<div class="feature">
		<img src="images/pic5.jpg" alt="Feature 1">
		<h3>Best Prices Guaranteed</h3>
		<p style="font-family: 'Lato', sans-serif; font-size: 16px; color: #666; line-height: 1.8; text-align: justify;">We offer the best prices for our hotels, guaranteed. Our team of experts works tirelessly to ensure that you get the best deals on your hotel bookings. Whether you're looking for a luxurious stay or a budget-friendly option, we've got you covered. Our prices are competitive, and we're confident that you won't find a better deal anywhere else.</p>
	</div>
	<div class="feature">
		<img src="images/p1.jpg" alt="Feature 2">
		<h3>Wide Range of Hotels</h3>
		<p style="font-family: 'Lato', sans-serif; font-size: 16px; color: #666; line-height: 1.8; text-align: justify;">We have a wide range of hotels to choose from, catering to all your needs. From luxurious 5-star hotels to budget-friendly options, we've got a hotel that suits your taste and budget. Our hotels are carefully selected to ensure that you have a comfortable and enjoyable stay. Whether you're traveling for business or leisure, we've got a hotel that's perfect for you.</p>
	</div>
		<div class="call-to-action">
		<h2>Here you can Enlist Hotels ! Be A Manager</h2>
		<a href="HotelList.jsp"><button type="button"
				class="btn btn-primary">Enlist Hotels</button></a>
	</div>
		<div class="feature">
		<img src="images/p9.jpg" alt="Feature 3">
		<h3>Easy Booking Process</h3>
		<p style="font-family: 'Lato', sans-serif; font-size: 16px; color: #666; line-height: 1.8; text-align: justify;">Our booking process is easy and hassle-free, ensuring a smooth experience. Simply search for your desired hotel, select your dates, and book your room. Our secure payment system ensures that your transaction is safe and secure. We also offer a 24/7 customer support team to help you with any questions or concerns you may have.</p>
	</div>
	<div class="feature">
		<img src="images/p9.jpg" alt="Feature 3">
		<h3>Easy Booking Process</h3>
		<p style="font-family: 'Lato', sans-serif; font-size: 16px; color: #666; line-height: 1.8; text-align: justify;">Our booking process is easy and hassle-free, ensuring a smooth experience. Simply search for your desired hotel, select your dates, and book your room. Our secure payment system ensures that your transaction is safe and secure. We also offer a 24/7 customer support team to help you with any questions or concerns you may have.</p>
	</div>
</div>

	<!-- Call to Action Section -->
	<div class="call-to-action">
		<h2>Ready to Book Your Dream Hotel?</h2>
		<a href="HotelList.jsp"><button type="button"
				class="btn btn-primary">Book Now</button></a>
	</div>

	<!-- Gallery Section -->
	<div class="gallery">
		<h2>Our Hotels</h2>
		<div class="gallery-item">
			<img src="images/pic1.jpg" alt="Hotel 1">
		</div>
		<div class="gallery-item">
			<img src="images/pic2.jpg" alt="Hotel 2">
		</div>
		<div class="gallery-item">
			<img src="images/pic3.jpg" alt="Hotel 3">
		</div>

	</div>

<footer>
    <div class="footer-content">
        <div class="footer-section">
            <h3>About Us</h3>
            <p>We are a hotel booking system that provides the best hospitality experience.and provide opportunities for sellers by enlisting hotels</p>
        </div>
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="Booking.jsp">Booking</a></li>
                <li><a href="viewBooking.jsp">View Bookings</a></li>
                <li><a href="HotelList.jsp">Enlist hotels</a></li>
                <li><a href="userProfile.jsp">User Profile</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <p>Phone: +94 764050889</p>
            <p>Email: <a href="mailto:info@example.com">wilsonHotel@gmail.com</a></p>
        </div>
    </div>
    <div class="footer-copyright">
        <p>&copy; 2024 Wilson hotel reservations. All rights reserved.</p>
    </div>
</footer>






	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
