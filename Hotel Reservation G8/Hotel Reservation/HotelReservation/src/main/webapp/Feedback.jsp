<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Controller.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
    <style>
        /* Body styling with background image and blur effect */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('images/pic1.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        /* Applying blur to the background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: inherit;
            filter: blur(10px);
            z-index: -1;
        }

        /* Container styling with semi-transparent background */
        .container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.85); /* Semi-transparent white */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px); /* Blurring behind container */
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        textarea, input[type="text"], input[type="email"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"], input[type="button"] {
            display: block;
            width: 100%;
            padding: 12px;
            border: none;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #388E3C;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f4f4f4;
        }

        /* Responsive adjustments */
        @media screen and (max-width: 768px) {
            .container {
                width: 90%;
                margin: 20px auto;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Feedback</h2>
        
        <!-- Form to add or update feedback -->
        <form action="FeedbackServlet" method="post">
            <input type="hidden" name="feedbackID" value="<%= request.getParameter("feedbackID") != null ? request.getParameter("feedbackID") : "" %>">
            
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>" required>
            
            <label for="email">Your Email:</label>
            <input type="email" id="email" name="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>

            <!-- New Hotel field -->
            <label for="hotel">Hotel:</label>
            <input type="text" id="hotel" name="hotel" value="<%= request.getParameter("hotel") != null ? request.getParameter("hotel") : "" %>" required>

            <label for="feedback">Your Feedback:</label>
            <textarea id="feedback" name="feedback" required><%= request.getParameter("feedback") != null ? request.getParameter("feedback") : "" %></textarea>
            
            <input type="submit" value="<%= request.getParameter("feedbackID") != null ? "Update Feedback" : "Submit Feedback" %>">
        </form>

        <!-- Display feedback records -->
        <h2>Your Feedbacks</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Hotel</th> <!-- New Hotel column -->
                <th>Feedback</th>
                <th>Actions</th>
            </tr>

            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    conn = DBConnect.getConnection();
                    String query = "SELECT * FROM Feedback";
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        int feedbackID = rs.getInt("FeedbackID");
                        String name = rs.getString("Name");
                        String email = rs.getString("Email");
                        String hotel = rs.getString("Hotel"); // Fetching the hotel data
                        String feedback = rs.getString("Feedback");
            %>
                        <tr>
                            <td><%= feedbackID %></td>
                            <td><%= name %></td>
                            <td><%= email %></td>
                            <td><%= hotel %></td> <!-- Displaying the hotel -->
                            <td><%= feedback %></td>
                            <td>
                                <!-- Update button -->
                                <form action="Feedback.jsp" method="get" style="display:inline;">
                                    <input type="hidden" name="feedbackID" value="<%= feedbackID %>">
                                    <input type="hidden" name="name" value="<%= name %>">
                                    <input type="hidden" name="email" value="<%= email %>">
                                    <input type="hidden" name="hotel" value="<%= hotel %>"> <!-- Passing hotel value -->
                                    <input type="hidden" name="feedback" value="<%= feedback %>">
                                    <input type="submit" value="Update">
                                </form>

                                <!-- Delete button -->
                                <form action="FeedbackServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="feedbackID" value="<%= feedbackID %>">
                                    <input type="submit" name="action" value="Delete">
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { }
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { }
                }
            %>
        </table>
    </div>

</body>
</html>
