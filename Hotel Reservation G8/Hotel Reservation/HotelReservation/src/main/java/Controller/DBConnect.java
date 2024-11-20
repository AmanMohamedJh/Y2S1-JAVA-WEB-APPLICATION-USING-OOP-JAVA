package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	public static Connection getConnection() {
	    String url = "jdbc:mysql://127.0.0.1:3308/hotelReservation";
	    String user = "root";
	    String pass = ""; // Add your password here if necessary

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        System.out.println("Attempting to connect to the database...");
	        Connection conn = DriverManager.getConnection(url, user, pass);
	        System.out.println("Connection established successfully.");
	        return conn;
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace(); // Log the exception
	        throw new RuntimeException("MySQL JDBC Driver not found.", e);
	    } catch (SQLException e) {
	        e.printStackTrace(); // Log the exception
	        throw new RuntimeException("Connection to database failed.", e);
	    }
	}

}
