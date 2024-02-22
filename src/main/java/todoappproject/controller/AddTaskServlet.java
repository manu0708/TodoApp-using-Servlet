package todoappproject.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import todoappproject.dao.EntityFactory;
import todoappproject.dto.Task;
import todoappproject.dto.User;

@WebServlet("/add-task")
public class AddTaskServlet extends HttpServlet{
	private static final long serialVersionUID = 4917567579784413021L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String taskName = request.getParameter("task-name");
		String taskDescription = request.getParameter("task-description");
		
		User user = (User) request.getSession().getAttribute("user");
		Task task = new Task(taskName,taskDescription,"Complete",user);
		EntityFactory.addTask(task);
		request.getSession().setAttribute("msg", "Task is added");
		response.sendRedirect("index.jsp");
	}
}
