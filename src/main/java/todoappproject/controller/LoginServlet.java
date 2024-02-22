package todoappproject.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import todoappproject.dao.EntityFactory;
import todoappproject.dto.User;
import todoappproject.services.Aes;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 11950944340956832L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> user= EntityFactory.login(req.getParameter("username"), Aes.encrypt(req.getParameter("password"), req.getParameter("username")));
		if (!user.isEmpty()) {
			HttpSession session = req.getSession(true);
			session.setAttribute("user",user.get(0));
			session.setAttribute("msg", "Login Success");
			resp.sendRedirect("index.jsp");
		}
		else {
			req.setAttribute("msg", "User is invalid");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}
