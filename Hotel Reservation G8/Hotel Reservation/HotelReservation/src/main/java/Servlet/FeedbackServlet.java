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


import Controller.DBConnect;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the form
        String feedbackID = request.getParameter("feedbackID");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String hotel = request.getParameter("hotel"); // New hotel parameter
        String feedback = request.getParameter("feedback");
        String action = request.getParameter("action");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnect.getConnection(); // Your existing database connection method

            if ("Delete".equals(action)) {
                // Delete feedback
                String sqlDelete = "DELETE FROM Feedback WHERE FeedbackID=?";
                pstmt = conn.prepareStatement(sqlDelete);
                pstmt.setInt(1, Integer.parseInt(feedbackID));
                pstmt.executeUpdate();
                response.sendRedirect("Feedback.jsp?success=deleted");
            } else if (feedbackID != null && !feedbackID.isEmpty()) {
                // Update existing feedback
                String sqlUpdate = "UPDATE Feedback SET Name=?, Email=?, Hotel=?, Feedback=? WHERE FeedbackID=?";
                pstmt = conn.prepareStatement(sqlUpdate);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, hotel); // Setting hotel field
                pstmt.setString(4, feedback);
                pstmt.setInt(5, Integer.parseInt(feedbackID));
                pstmt.executeUpdate();
                response.sendRedirect("Feedback.jsp?success=updated");
            } else {
                // Insert new feedback
                String sqlInsert = "INSERT INTO Feedback (Name, Email, Hotel, Feedback) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sqlInsert);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, hotel); // Setting hotel field
                pstmt.setString(4, feedback);
                pstmt.executeUpdate();
                response.sendRedirect("Feedback.jsp?success=inserted");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Feedback.jsp?success=false");
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
            if (conn != null) try { conn.close(); } catch (SQLException e) { }
        }
    }
}