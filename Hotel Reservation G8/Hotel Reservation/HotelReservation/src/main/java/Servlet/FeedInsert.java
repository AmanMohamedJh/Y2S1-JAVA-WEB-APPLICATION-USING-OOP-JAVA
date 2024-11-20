package Servlet;

import java.io.IOException;

import Services.CustomerServices;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class FeedInsert
 */
@WebServlet("/FeedInsert")
public class FeedInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name =  request.getParameter("name");
		String email = request.getParameter("email");
		String phone =  request.getParameter("phone");
		String message = request.getParameter("message");
		
		boolean isTrue;
		isTrue = CustomerServices.insertdata(name, email, phone, message);
		
		  
		if (isTrue == true) {
			//Navigate to jsp page
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
			
		}
		else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}

