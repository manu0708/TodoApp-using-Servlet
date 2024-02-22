package todoappproject.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import todoappproject.dto.Task;
import todoappproject.dto.User;

public class EntityFactory {
	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("dev");
	static EntityManager manager = factory.createEntityManager();
	static EntityTransaction transaction = manager.getTransaction();
	
	public static void createUser(User user) {
		transaction.begin();
		manager.persist(user);
		transaction.commit();
	}

	public static boolean isUser(String email) {
		try {
			Object user = manager.createQuery("select record from User record where email=?1").setParameter(1, email).getSingleResult();
			return false;
		} catch (Exception e) {
			return true;
		}
	}
	
	@SuppressWarnings("unchecked")
	public static List<User> login(String username,String password) {
		return manager.createQuery("select record from User record where username=?1 and password=?2").setParameter(1, username).setParameter(2, password).getResultList();
	}

	public static void addTask(Task task) {
		transaction.begin();
		manager.persist(task);
		transaction.commit();
	}
	@SuppressWarnings("unchecked")
	public static List<Task> getAllTask(User user){
		return manager.createQuery("select record from Task record where userId_id=?1").setParameter(1,  (int)(user.getId())).getResultList();
	}

	public static void deleteTask(int id) {
		Task task = manager.find(Task.class, id);
		if (task!=null) {
			transaction.begin();
			manager.remove(task);
			transaction.commit();
		}
	}

	public static void updateTaskStatus(int id) {
		Task task = manager.find(Task.class, id);
		task.setTaskStatus("Completed");
		if (task!=null) {
			transaction.begin();
			manager.merge(task);
			transaction.commit();
		}
	}

	public static void updateTask(int id, String taskName, String taskDescription) {
		Task task = manager.find(Task.class, id);
		if (task!=null) {
			if (!task.getTaskName().equalsIgnoreCase(taskName)) {
				task.setTaskName(taskName);
			}
			if (!task.getTaskDescription().equalsIgnoreCase(taskDescription)) {
				task.setTaskDescription(taskDescription);
			}
			transaction.begin();
			manager.merge(task);
			transaction.commit();
		}
	}
}
