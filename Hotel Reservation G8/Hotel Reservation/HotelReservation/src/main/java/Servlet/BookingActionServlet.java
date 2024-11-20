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

@WebServlet("/BookingActionServlet")
public class BookingActionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String bookingIdStr = request.getParameter("bookingId");
        int bookingId = Integer.parseInt(bookingIdStr);

        try {
            Connection conn = DBConnect.getConnection();
            if ("delete".equals(action)) {
                deleteBooking(conn, bookingId);
                response.getWriter().println("<script>alert('Booking deleted successfully.'); window.location.href='temphomepage.jsp';</script>");
            } else if ("update".equals(action)) {
                // Forward to an update page or implement inline updating here
                response.sendRedirect("updateBooking.jsp?bookingId=" + bookingId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error processing the request.'); window.location.href='temphomepage.jsp';</script>");
        }
    }

    private void deleteBooking(Connection conn, int bookingId) throws SQLException {
        String sql = "DELETE FROM bookings WHERE booking_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bookingId);
        pstmt.executeUpdate();
    }
}
