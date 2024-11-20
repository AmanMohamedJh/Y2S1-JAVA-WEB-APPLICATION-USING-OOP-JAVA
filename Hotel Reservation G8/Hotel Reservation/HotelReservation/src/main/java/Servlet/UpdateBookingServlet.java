package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Controller.DBConnect;

@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdStr = request.getParameter("bookingId");
        int bookingId = Integer.parseInt(bookingIdStr);
        String hotelId = request.getParameter("hotelId");
        String checkInDate = request.getParameter("checkin_date");
        String checkOutDate = request.getParameter("checkout_date");
        String roomType = request.getParameter("room_type");
        int numberOfRooms = Integer.parseInt(request.getParameter("num_of_rooms"));

        try {
            Connection conn = DBConnect.getConnection();
            String sql = "UPDATE bookings SET hotel_id = ?, checkin_date = ?, checkout_date = ?, room_type = ?, number_of_rooms = ? WHERE booking_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, hotelId);
            pstmt.setString(2, checkInDate);
            pstmt.setString(3, checkOutDate);
            pstmt.setString(4, roomType);
            pstmt.setInt(5, numberOfRooms);
            pstmt.setInt(6, bookingId);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.getWriter().println("<script>alert('Booking updated successfully.'); window.location.href='viewBooking.jsp?bookingId=" + bookingId + "';</script>");
            } else {
                response.getWriter().println("<script>alert('Update failed. Please try again.'); window.location.href='viewBooking.jsp?bookingId=" + bookingId + "';</script>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error processing the update.'); window.location.href='viewBooking.jsp?bookingId=" + bookingId + "';</script>");
        }
    }
}
