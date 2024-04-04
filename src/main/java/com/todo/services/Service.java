package com.todo.services;

import java.util.ArrayList;
import java.util.List;

import com.todo.dao.Dao;
import com.todo.dao.TodoDao;
import com.todo.entities.TODO;



public class Service {

	static Dao dao = new TodoDao();
	static int id;
	static Boolean isDeleted = false;
	static Boolean isUpdate = false;

	public static int saveTodo(TODO todo) {
		try {
			id = dao.create(todo);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public static List<TODO> getAllTodo(){
		List<TODO> list = new ArrayList<TODO>();
		list = dao.getTODOList();
		return list;
	}
	
	public static Boolean deleteTODO(TODO todo) {
		isDeleted = false;
		dao.deleteATODO(todo);
		return isDeleted;
	}
	
	public static TODO getTodo(int id) {
		TODO todo = dao.getTODO(id);
		return todo;
	}
	
	public static Boolean updateTODO(TODO todo) {
		isUpdate = false;
		dao.update(todo);
		isUpdate = true;
		return isUpdate;
	}
}
