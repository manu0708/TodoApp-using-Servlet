package todoappproject.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import todoappproject.dao.EntityFactory;
import todoappproject.services.Aes;

@WebServlet("/edit-task")
public class EditTaskServlet extends HttpServlet{
	private static final long serialVersionUID = 5079958518148370188L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(Aes.decrypt(request.getParameter("task-id"), "task-id"));
		String taskName = request.getParameter("task-name");
		String taskDescription = request.getParameter("task-description");
		
		EntityFactory.updateTask(id,taskName,taskDescription);
		request.getSession().setAttribute("msg", "Task is Updated");
		response.sendRedirect("index.jsp");
	}
}
