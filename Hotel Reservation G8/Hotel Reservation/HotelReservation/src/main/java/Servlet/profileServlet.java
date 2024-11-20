package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Controller.DBConnect;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profileServlet")
public class profileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);  // Get the session, but do not create a new one if it doesn't exist
        
        // Check if a user is logged in by checking if "username" is stored in session
        if (session == null || session.getAttribute("username") == null) {
            // If the session is null or no user is logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Fetch user details from the database
            String sql = "SELECT CusName, CusEmail, Phone, Address FROM customer WHERE UserName=?";
            connection = DBConnect.getConnection();  // Using your DBConnect class
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("CusName");
                String email = rs.getString("CusEmail");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");

                // Store user details in the session
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);
            } else {
                System.out.println("No user data found for username: " + username);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Forward the request to the profile page (userProfile.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            updateUser(request, session);
        } else if ("delete".equals(action)) {
            deleteUser(session, response);  // Also pass response to redirect after delete
            return;
        }

        // After update, forward back to the profile page
        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpSession session) {
        String username = (String) session.getAttribute("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Connection connection = null;
        PreparedStatement pstmt = null;

        try {
            String sql = "UPDATE customer SET CusName=?, CusEmail=?, Phone=?, Address=? WHERE UserName=?";
            connection = DBConnect.getConnection();  // Using your DBConnect class
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, address);
            pstmt.setString(5, username);
            pstmt.executeUpdate();

            // Update session attributes
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            session.setAttribute("phone", phone);
            session.setAttribute("address", address);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteUser(HttpSession session, HttpServletResponse response) throws IOException {
        String username = (String) session.getAttribute("username");

        Connection connection = null;
        PreparedStatement pstmt = null;

        try {
            String sql = "DELETE FROM customer WHERE UserName=?";
            connection = DBConnect.getConnection();  // Using your DBConnect class
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.executeUpdate();

            // Invalidate the session after deletion
            session.invalidate();

            // Redirect to login page after deletion
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (connection != null) connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
