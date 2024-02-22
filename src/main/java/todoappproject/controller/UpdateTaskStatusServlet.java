package todoappproject.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import todoappproject.dao.EntityFactory;
import todoappproject.services.Aes;

@WebServlet("/updateTaskStatus")
public class UpdateTaskStatusServlet extends HttpServlet{
	private static final long serialVersionUID = 5603816968982866663L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(Aes.decrypt(request.getParameter("id"), "task-id"));
		EntityFactory.updateTaskStatus(id);
		request.getSession().setAttribute("msg", "Task is Completed");
		response.sendRedirect("index.jsp");
	}
}
