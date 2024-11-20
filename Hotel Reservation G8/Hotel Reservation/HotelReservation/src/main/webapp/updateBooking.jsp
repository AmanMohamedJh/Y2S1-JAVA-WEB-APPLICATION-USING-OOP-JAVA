<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Booking</title>
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
            background-color: #f0f0f0;
            padding-top: 100px; /* Space for navbar */
            position: relative;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        /* Form Styles */
        form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            margin: 50px auto;
            max-width: 600px;
            z-index: 1;
            position: relative;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"] {
            width: calc(100% - 10px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus {
            border-color: #337ab7;
            box-shadow: 0 0 5px rgba(51, 122, 183, 0.5);
        }

        button[type="submit"] {
            background-color: #337ab7;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        button[type="submit"]:hover {
            background-color: #f68b1e;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #337ab7;
            text-decoration: none;
        }

        a:hover {
            color: #f68b1e;
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
            margin-top: 50px;
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

        /* Background image with low opacity and blur */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('images/p15.jpg');
            background-size: cover;
            background-position: center;
            filter: blur(8px);
            opacity: 1;
            z-index: -1;
        }
    </style>
</head>
<body>
    <!-- Booking Update Form -->
    <h1>Update Booking</h1>
    <form action="UpdateBookingServlet" method="post">
        <input type="hidden" name="bookingId" value="<%= request.getParameter("bookingId") %>" />

        <label for="hotelId">Hotel ID:</label>
        <input type="text" name="hotelId" required><br>

        <label for="checkin_date">Check-in Date:</label>
        <input type="date" name="checkin_date" required><br>

        <label for="checkout_date">Check-out Date:</label>
        <input type="date" name="checkout_date" required><br>

        <label for="room_type">Room Type:</label>
        <input type="text" name="room_type" required><br>

        <label for="num_of_rooms">Number of Rooms:</label>
        <input type="number" name="num_of_rooms" required><br>

        <button type="submit">Update Booking</button>
    </form>

    <a href="temphomepage.jsp">Return to Homepage</a>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>About Us</h3>
                <p>We provide the best hospitality experience and opportunities for sellers by enlisting hotels.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="Booking.jsp">Booking</a></li>
                    <li><a href="viewBooking.jsp">View Bookings</a></li>
                    <li><a href="HotelList.jsp">Enlist Hotels</a></li>
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
            <p>&copy; 2024 Wilson Hotel Reservations. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="JS/bootstrap.bundle.min.js"></script>
</body>
</html>
