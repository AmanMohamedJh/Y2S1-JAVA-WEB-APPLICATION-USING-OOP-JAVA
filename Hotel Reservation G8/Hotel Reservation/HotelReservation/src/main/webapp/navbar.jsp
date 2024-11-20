<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
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

.navbar-buttons {
    display: flex;
}

.navbar-buttons button {
    margin-left: 10px;
}

</style>

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
                <li><a href="viewBooking.jsp">View bookings</a></li>
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
                    <span class="user-name"><%= username %></span> 
                    <a href="userProfile.jsp">Profile</a> 
                    <a href="logout.jsp"><button type="button" class="btn btn-danger">Logout</button></a>
                    <% } else { %>
                    <div class="navbar-buttons">
                        <a href="Register.jsp"><button type="button" class="btn btn-success">Register</button></a>
                        <a href="login.jsp"><button type="button" class="btn btn-warning">Login</button></a>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</nav>
