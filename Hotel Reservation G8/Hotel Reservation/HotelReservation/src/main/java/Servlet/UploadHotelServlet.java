package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Controller.DBConnect; // Adjust the import according to your project structure

@WebServlet("/UploadHotelServlet")
public class UploadHotelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String hotelId = request.getParameter("hotel_id"); // Get hotel_id from request
        String hotelName = request.getParameter("hotelName");
        String roomType = request.getParameter("roomType");
        double price = Double.parseDouble(request.getParameter("price"));
        float rating = Float.parseFloat(request.getParameter("rating"));
        int reviewCount = Integer.parseInt(request.getParameter("reviewCount"));
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String manager = request.getParameter("manager");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish a connection to the database
            conn = DBConnect.getConnection();
            
            // SQL query to insert hotel details into hotel_list
            String sql = "INSERT INTO hotel_list (hotel_id, hotel_name, room_type, price, rating, review_count, location, description, manager) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, hotelId); // Set hotel_id
            stmt.setString(2, hotelName);
            stmt.setString(3, roomType);
            stmt.setDouble(4, price);
            stmt.setFloat(5, rating);
            stmt.setInt(6, reviewCount);
            stmt.setString(7, location);
            stmt.setString(8, description);
            stmt.setString(9, manager);

            // Execute the insert operation
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                // Set success message
                request.setAttribute("message", "Hotel details uploaded successfully!");
                request.setAttribute("isSuccess", true);
            } else {
                // Set failure message
                request.setAttribute("message", "Failed to upload hotel details.");
                request.setAttribute("isSuccess", false);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Set error message on exception
            request.setAttribute("message", "An error occurred: " + e.getMessage());
            request.setAttribute("isSuccess", false);
        } finally {
            // Close resources
            if (stmt != null) {
                try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }

        // Forward to the result page
        request.getRequestDispatcher("uploadResult.jsp").forward(request, response);
    }
}
