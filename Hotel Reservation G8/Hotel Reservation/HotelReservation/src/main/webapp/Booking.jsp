<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Controller.DBConnect" %>

<%
    // Retrieve the hotelId parameter from the request
    String hotelId = request.getParameter("hotelId");
    
    // Check if hotelId is null or empty
    if (hotelId == null || hotelId.isEmpty()) {
        // If the hotelId is missing or empty, redirect back to the HotelList page
        response.sendRedirect("HotelList.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String hotelName = "";

    try {
        // Establish a connection using DBConnect class
        conn = DBConnect.getConnection();

        // Prepare the SQL query to fetch the hotel name based on the hotelId
        ps = conn.prepareStatement("SELECT hotel_name FROM hotel_list WHERE hotel_id = ?");
        ps.setString(1, hotelId);
        rs = ps.executeQuery();

        // If the hotel is found, store the name
        if (rs.next()) {
            hotelName = rs.getString("hotel_name");
        } else {
            // If no hotel is found with the given hotelId, redirect to the HotelList page
            response.sendRedirect("HotelList.jsp");
            return;
        }
    } catch (SQLException e) {
        // Handle any SQL exceptions
        e.printStackTrace();
        response.sendRedirect("error.jsp");
        return;
    } finally {
        // Clean up resources
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking</title>
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

        /* Navbar and spacing adjustments */
        .navbar {
            margin-bottom: 30px; /* Adds space between navbar and form */
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
            margin-top: 50px; /* Adds space above the footer */
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

        /* Body Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
            margin: 0;
            padding-top: 90px; /* Increased padding for navbar space */
            position: relative;
            min-height: 100vh;
        }

        /* Background image with low opacity and blur */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('images/p15.jpg'); /* Update with your image path */
            background-size: cover;
            background-position: center;
            filter: blur(8px); /* Apply blur */
            opacity: 1; /* Set the opacity */
            z-index: -1; /* Ensure it stays in the background */
        }

        /* Form styles */
        form {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent form background */
            padding: 40px; /* Increased padding for better spacing */
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            margin: 30px auto; /* Added margin for vertical spacing */
            max-width: 600px; /* Limit form width */
            z-index: 1; /* Ensure it is above the background */
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input[type="number"],
        input[type="date"],
        select {
            width: calc(100% - 10px); /* Full width with some padding */
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #337ab7;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #f68b1e;
        }

    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    <h1>Book a room in <%= hotelName %></h1>
    <form action="BookingServlet" method="post">
        <input type="hidden" name="hotelId" value="<%= hotelId %>" />
        
        <label>Number of rooms: </label>
        <input type="number" name="num_of_rooms" required min="1" /><br><br>

        <label>Check-in date: </label>
        <input type="date" name="checkin_date" required /><br><br>

        <label>Check-out date: </label>
        <input type="date" name="checkout_date" required /><br><br>

        <label>Room type: </label>
        <select name="room_type">
            <option value="deluxe">Deluxe</option>
            <option value="standard">Standard</option>
            <option value="suite">Suite</option>
        </select><br><br>

        <label>Total cost: </label>
        <input type="number" name="total_cost" value="20000" required min="0" /><br><br>

        <input type="submit" value="Book" />
    </form>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <p>We are a hotel booking system that provides the best hospitality experience and opportunities for sellers by enlisting hotels.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
					<li><a href="temphomepage.jsp">Home</a></li>
					<li><a href="HotelList.jsp">Hotels</a></li>
					<li><a href="manager.jsp">Be A Manager</a></li>	
					<li><a href="#contact">Feedbacks</a></li>
					<li><a href="#contact">Inquiries</a></li>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
