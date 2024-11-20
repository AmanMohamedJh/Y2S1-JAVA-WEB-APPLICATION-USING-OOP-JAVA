package Servlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Controller.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValidUser = false;
        String userEmail = null;
        String cusName = null;
        int userId = 0; // Add userId variable

        try {
            Connection conn = DBConnect.getConnection();
            String sql = "SELECT CustomerID, CusEmail, CusName FROM customer WHERE UserName=? AND Password=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                isValidUser = true;
                userEmail = rs.getString("CusEmail");
                cusName = rs.getString("CusName");
                userId = rs.getInt("CustomerID"); // Retrieve CustomerID
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isValidUser) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId); // Set userId in session
            session.setAttribute("username", username);
            session.setAttribute("email", userEmail);
            session.setAttribute("cusname", cusName);
            response.sendRedirect("temphomepage.jsp");
        } else {
            response.getWriter().println(
                    "<script>alert('Invalid username or password'); window.location.href='login.jsp';</script>");
        }
    }
}
