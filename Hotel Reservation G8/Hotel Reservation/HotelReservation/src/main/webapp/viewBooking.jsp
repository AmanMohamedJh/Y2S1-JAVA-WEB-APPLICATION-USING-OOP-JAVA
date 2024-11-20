<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Booking</title>
    <style>
        
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('images/pic2.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        /* Dim and blur effect */
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

        /* Main content styling */
        .container {
            position: relative;
            z-index: 10;
            padding: 20px;
            max-width: 600px;
            margin: 100px auto;
            background-color: rgba(255, 255, 255, 0.9); /* Slight transparency for the content background */
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        p {
            font-size: 18px;
            color: #444;
        }

        /* Button styles */
        button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #45a049;
            transform: translateY(-3px);
        }

        button:active {
            transform: translateY(0px);
        }

        /* Link styling */
        a {
            text-decoration: none;
            color: #2196F3;
            font-size: 16px;
            transition: color 0.3s;
        }

        a:hover {
            color: #0b7dda;
        }

        /* Form and button container */
        form {
            text-align: center;
            margin-top: 20px;
        }

        /* Mobile responsiveness */
        @media screen and (max-width: 768px) {
            .container {
                margin: 50px auto;
                padding: 15px;
            }

            p {
                font-size: 16px;
            }

            button {
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <!-- Background blur layer -->
    <div class="background-blur"></div>

    <!-- Main content container -->
    <div class="container">
        <h1>Booking Details</h1>
        <p>Hotel ID: <%= request.getAttribute("hotelId") != null ? request.getAttribute("hotelId") : "N/A" %></p>
        <p>Check-in Date: <%= request.getAttribute("checkInDate") != null ? request.getAttribute("checkInDate") : "N/A" %></p>
        <p>Check-out Date: <%= request.getAttribute("checkOutDate") != null ? request.getAttribute("checkOutDate") : "N/A" %></p>
        <p>Room Type: <%= request.getAttribute("roomType") != null ? request.getAttribute("roomType") : "N/A" %></p>
        <p>Number of Rooms: <%= request.getAttribute("numberOfRooms") != null ? request.getAttribute("numberOfRooms") : "N/A" %></p>
        
        <!-- Buttons for deleting and updating the booking -->
        <form action="BookingActionServlet" method="post">
            <input type="hidden" name="bookingId" value="<%= request.getParameter("bookingId") %>" />
            <button type="submit" name="action" value="delete">Delete Booking</button>
            <button type="submit" name="action" value="update">Update Booking</button>
        </form>

        <a href="temphomepage.jsp">Return to Homepage</a>
    </div>
</body>
</html>
