<%@ page import="java.sql.*, Controller.DBConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.IOException" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel List</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
            margin: 0; /* Remove default body margin */
            padding-top: 70px; /* Space for navbar */
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

        .navbar {
            background-color: #333;
            overflow: hidden;
            padding: 10px 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%; /* Make it span the entire width */
            z-index: 1000; /* Ensure it's on top of other content */
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .navbar-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .navbar-logo img {
            width: 100px;
            height: 45px;
            object-fit: cover;
        }

        .navbar-links {
            flex: 1;
            display: flex;
            justify-content: center;
        }

        .navbar-list {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .navbar-list li {
            margin-left: 20px;
        }

        .navbar-list li a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            transition: background-color 0.3s;
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
            gap: 10px;
        }

        .user-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-name {
            color: white;
            margin-right: 10px;
        }

        .navbar-buttons button, .navbar-profile a button {
            margin-left: 10px;
            background-color: #337ab7;
            border-radius: 20px;
            color: white;
        }

        .hotel-list-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center the cards */
            width: 80%;
            max-width: 1200px;
            margin: auto;
            z-index: 1; /* Keep hotel content above the background */
        }

        .hotel {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            padding: 15px;
            margin: 15px; /* Space between cards */
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s, box-shadow 0.3s; /* Smooth hover effect */
            z-index: 1;
        }

        .hotel:hover {
            transform: scale(1.05); /* Slightly enlarge on hover */
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .book-button {
            padding: 8px 12px;
            background-color: #337ab7;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .book-button:hover {
            background-color: #f68b1e;
        }

        .footer-bottom {
            background-color: #222;
            text-align: center;
            padding: 10px 0;
            color: #ccc;
            font-size: 14px;
            width: 100%;
            position: relative;
            left: 0;
            bottom: 0;
            margin: 0;
            box-sizing: border-box;
            z-index: 1;
        }
        .search-container {
    margin: 20px auto;
    text-align: center;
}

.search-container form {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    border: 2px solid #007bff; /* Blue border */
    border-radius: 25px; /* Rounded corners */
    padding: 10px;
    background-color: #ffffff; /* White background */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    transition: box-shadow 0.3s ease; /* Smooth transition */
}

.search-container form:hover {
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Enhanced shadow on hover */
}

.form-control {
    border: none; /* Remove default border */
    border-radius: 20px; /* Rounded input */
    padding: 10px 15px; /* Padding for input */
    font-size: 16px; /* Font size */
    width: 250px; /* Fixed width */
    transition: box-shadow 0.3s ease; /* Smooth transition */
}

.form-control:focus {
    outline: none; /* Remove outline */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Blue shadow on focus */
}

.btn {
    background-color: #007bff; /* Button color */
    color: white; /* Text color */
    border: none; /* Remove border */
    border-radius: 20px; /* Rounded button */
    padding: 10px 20px; /* Padding for button */
    font-size: 16px; /* Font size */
    margin-left: 10px; /* Space between input and button */
    transition: background-color 0.3s ease; /* Smooth transition */
}

.btn:hover {
    background-color: #0056b3; /* Darker blue on hover */
}
        }
    </style>
</head>
<body>

    <!-- Navigation Bar (Header) -->
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
                        <span class="user-name"><%= username %></span> 
                        <a href="userProfile.jsp" style="color:white;">Profile</a> 
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

    <!-- Search Bar -->
    <div class="search-container">
        <form action="<%= request.getContextPath() %>/HotelList.jsp" method="get" class="form-inline">
            <input type="text" name="location" class="form-control" placeholder="Enter Location" required>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>

    <!-- Hotel List Container -->
    <h1>Available Hotels</h1>
    <div class="hotel-list-container">
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String locationFilter = request.getParameter("location"); // Get location from search form

            try {
                conn = DBConnect.getConnection(); // Correct usage of your DBConnect class
                
                // Base query to fetch hotel data
                String query = "SELECT hotel_id, hotel_name, room_type, price, rating, review_count, location, description FROM hotel_list";

                // If a location filter is provided, modify the query
                if (locationFilter != null && !locationFilter.trim().isEmpty()) {
                    query += " WHERE location LIKE ?";
                }

                stmt = conn.prepareStatement(query);
                
                // Set the location parameter if it exists
                if (locationFilter != null && !locationFilter.trim().isEmpty()) {
                    stmt.setString(1, "%" + locationFilter.trim() + "%"); // Use LIKE for partial matches
                }

                rs = stmt.executeQuery();

                // Loop through the result set
                while (rs.next()) {
                    String hotelId = rs.getString("hotel_id"); // hotel_id is now a string
                    String hotelName = rs.getString("hotel_name");
                    String roomType = rs.getString("room_type");
                    double price = rs.getDouble("price");
                    double rating = rs.getDouble("rating");
                    int reviewCount = rs.getInt("review_count");
                    String location = rs.getString("location");
                    String description = rs.getString("description");
        %>
        <div class="hotel">
            <h3><%= hotelName %></h3>
            <p><strong>Room Type:</strong> <%= roomType %></p>
            <p><strong>Price:</strong> $<%= price %></p>
            <p><strong>Rating:</strong> <%= rating %> (<%= reviewCount %> reviews)</p>
            <p><strong>Location:</strong> <%= location %></p>
            <p><strong>Description:</strong> <%= description %></p>
            <a href="Booking.jsp?hotelId=<%= hotelId %>"><button class="book-button">Book Now</button></a>
        </div>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        %>
    </div>

    <!-- Footer -->
    <footer class="footer-bottom">
        <p>&copy; 2024 WILSON HOTELS RESERVATION. All rights reserved.</p>
    </footer>

</body>
</html>
