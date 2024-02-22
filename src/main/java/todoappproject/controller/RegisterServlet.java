package todoappproject.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import todoappproject.dao.EntityFactory;
import todoappproject.dto.User;
import todoappproject.services.Aes;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = -730810217112759823L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=new User(request.getParameter("username"),Aes.encrypt(request.getParameter("password"), request.getParameter("username")),request.getParameter("email"),Long.parseLong(request.getParameter("mobileNumber")),request.getParameter("gender"),LocalDate.parse(request.getParameter("dateOfBirth")));
		if (EntityFactory.isUser(user.getEmail())) {
			EntityFactory.createUser(user);
			request.setAttribute("msg", "Register Success");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else {
			request.setAttribute("msg", "Email is taken");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}
}
