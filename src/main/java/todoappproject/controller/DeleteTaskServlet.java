package todoappproject.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import todoappproject.dao.EntityFactory;
import todoappproject.services.Aes;

@WebServlet("/delete-task")
public class DeleteTaskServlet extends HttpServlet{
	private static final long serialVersionUID = -1378024881159511468L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(Aes.decrypt(request.getParameter("id"), "task-id"));
		
		EntityFactory.deleteTask(id);
		request.getSession().setAttribute("msg", "Task is Removed");
		response.sendRedirect("index.jsp");
	}
}
