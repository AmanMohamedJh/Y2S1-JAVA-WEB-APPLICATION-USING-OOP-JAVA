<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Result</title>
    <link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <%
            String message = (String) request.getAttribute("message");
            Boolean isSuccess = (Boolean) request.getAttribute("isSuccess");

            if (isSuccess != null && isSuccess) {
        %>
            <div class="alert alert-success" role="alert">
                <%= message %> <a href="HotelList.jsp">View Hotel List</a>
            </div>
        <%
            } else {
        %>
            <div class="alert alert-danger" role="alert">
                <%= message %> Please try again.
            </div>
            <a href="manager.jsp">Go back to upload form</a>
        <%
            }
        %>
    </div>
</body>
</html>
