package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Controller.DBConnect;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get the existing session without creating a new one
        HttpSession session = request.getSession(false);
        Integer customerId = null;

        if (session != null) {
            customerId = (Integer) session.getAttribute("userId");
        }

        // Check if the user is logged in
        if (customerId == null) {
            response.getWriter().println("<script>alert('You must be logged in to book a room.'); window.location.href='login.jsp';</script>");
            return; 
        }

        // Retrieve booking details from the request
        String hotelId = request.getParameter("hotelId");
        String checkInDate = request.getParameter("checkin_date");
        String checkOutDate = request.getParameter("checkout_date");
        String roomType = request.getParameter("room_type");
        int numberOfRooms = Integer.parseInt(request.getParameter("num_of_rooms"));
        
        // Note: Removed totalCost since it is not in your database schema.
        
        // Validate parameters before proceeding with the database interaction
        if (hotelId == null || checkInDate == null || checkOutDate == null || roomType == null) {
            response.getWriter().println("<script>alert('All booking fields must be filled out.'); window.location.href='Booking.jsp';</script>");
            return;
        }

        // Insert booking details into the database and get the booking ID
        int bookingId = processBooking(hotelId, checkInDate, checkOutDate, roomType, numberOfRooms);

        if (bookingId > 0) {
            // Debugging: Print out the booking ID
            System.out.println("Successfully created booking with ID: " + bookingId);
            // Redirect to BookingServlet with booking ID
            response.sendRedirect("BookingServlet?bookingId=" + bookingId);
        } else {
            // Show error message if booking fails
            response.getWriter().println("<script>alert('Booking failed. Please try again later.'); window.location.href='Booking.jsp';</script>");
        }
    }

    // Function to process the booking and insert into the database
    private int processBooking(String hotelId, String checkInDate, 
                               String checkOutDate, String roomType, int numberOfRooms) {
        int bookingId = -1; // Default to -1 if booking fails

        try {
            // Database connection
            Connection conn = DBConnect.getConnection();
            String sql = "INSERT INTO bookings (hotel_id, checkin_date, checkout_date, room_type, number_of_rooms) "
                       + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            
            pstmt.setString(1, hotelId); 
            pstmt.setString(2, checkInDate);
            pstmt.setString(3, checkOutDate);
            pstmt.setString(4, roomType);
            pstmt.setInt(5, numberOfRooms);

            // Execute the update query
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                // Get the generated booking ID
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    bookingId = generatedKeys.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace(); 
        }

        return bookingId;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookingIdStr = request.getParameter("bookingId");

        if (bookingIdStr != null) {
            int bookingId = Integer.parseInt(bookingIdStr);

            // Debugging: Print out the booking ID
            System.out.println("Booking ID: " + bookingId);

            // Fetch booking details from the database
            try {
                Connection conn = DBConnect.getConnection();
                String sql = "SELECT * FROM bookings WHERE booking_id = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, bookingId);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Retrieve booking details
                    String hotelId = rs.getString("hotel_id");
                    String checkInDate = rs.getString("checkin_date");
                    String checkOutDate = rs.getString("checkout_date");
                    String roomType = rs.getString("room_type");
                    int numberOfRooms = rs.getInt("number_of_rooms");

                    // Debugging: Print out the values retrieved
                    System.out.println("Hotel ID: " + hotelId);
                    System.out.println("Check-in Date: " + checkInDate);
                    System.out.println("Check-out Date: " + checkOutDate);
                    System.out.println("Room Type: " + roomType);
                    System.out.println("Number of Rooms: " + numberOfRooms);

                    // Set booking details as request attributes
                    request.setAttribute("hotelId", hotelId);
                    request.setAttribute("checkInDate", checkInDate);
                    request.setAttribute("checkOutDate", checkOutDate);
                    request.setAttribute("roomType", roomType);
                    request.setAttribute("numberOfRooms", numberOfRooms);

                    // Forward to the booking details page (e.g., viewBooking.jsp)
                    request.getRequestDispatcher("viewBooking.jsp").forward(request, response);
                } else {
                    response.getWriter().println("<script>alert('No booking found with the given ID.'); window.location.href='temphomepage.jsp';</script>");
                }

            } catch (SQLException | ServletException e) {
                e.printStackTrace();
                response.getWriter().println("<script>alert('Error retrieving booking details.'); window.location.href='temphomepage.jsp';</script>");
            }
        } else {
            response.getWriter().println("<script>alert('No booking ID provided.'); window.location.href='temphomepage.jsp';</script>");
        }
    }
}
