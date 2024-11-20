package Servlet;

import java.io.IOException;

import Services.CustomerServices;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;


@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String CusName = request.getParameter("CusName");
        String CusEmail = request.getParameter("CusEmail");
        String UserName = request.getParameter("UserName");
        String Password = request.getParameter("Password");
        String Phone = request.getParameter("Phone");
        String Address = request.getParameter("Address");
        
        boolean isTrue = CustomerServices.insertdata(CusName, CusEmail, UserName, Password, Phone, Address);

        if (isTrue) {
            String alertMessage = "Data Insert Successful";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='temphomepage.jsp';</script>");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("temphomepage.jsp");
            dis2.forward(request, response);
        }
    }
}
