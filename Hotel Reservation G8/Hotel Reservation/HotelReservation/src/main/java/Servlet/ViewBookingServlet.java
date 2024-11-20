package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Controller.DBConnect;

@WebServlet("/ViewBookingServlet")
public class ViewBookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        Integer customerId = null;

        if (session != null) {
            customerId = (Integer) session.getAttribute("userId");
        }

        // Check if user is logged in
        if (customerId == null) {
            response.sendRedirect("login.jsp");
            return; 
        }

        // Retrieve booking details for the logged-in user
        String sql = "SELECT hotel_id, checkin_date, checkout_date, room_type, number_of_rooms FROM bookings WHERE customer_id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, customerId);
            ResultSet rs = pstmt.executeQuery();

            request.setAttribute("bookings", rs);
            try {
				request.getRequestDispatcher("viewBooking.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
