<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    // Invalidate the session to log the user out
    session.invalidate();

    // Redirect to the homepage or login page
    response.sendRedirect("temphomepage.jsp");
%>
</body>
</html>
