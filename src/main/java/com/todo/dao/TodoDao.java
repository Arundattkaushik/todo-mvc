package com.todo.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;

import com.todo.utility.Utils;
import com.todo.entities.TODO;

public class TodoDao implements Dao {
	int id;
	Boolean isUpdated = false;

	@Override
	public int create(TODO todo) {
		Utils.getSession().getTransaction();
		id = (int) Utils.getSession().save(todo);
		Utils.getSession().getTransaction().begin();
		Utils.getSession().getTransaction().commit();
		return id;
	}

	@Override
	public Boolean update(TODO todo) {
		isUpdated = false;
		Utils.getSession().clear();
		Utils.getSession().update(todo);
		Utils.getSession().getTransaction().begin();
		Utils.getSession().getTransaction().commit();
		isUpdated = true;
		return isUpdated;
	}

	@Override
	public TODO getTODO(int id) {
		TODO todo = Utils.getSession().get(TODO.class, id);
		return todo;
	}

	@Override
	public List<TODO> getTODOList() {
		List<TODO> todoList = new ArrayList<TODO>();
		String q = "from TODO";
		Query<TODO> query = Utils.getSession().createQuery(q);
		todoList = query.list();
		return todoList;
	}

	@Override
	public Boolean deleteATODO(TODO todo) {
		isUpdated = false;
		Utils.getSession().delete(todo);
		Utils.getSession().getTransaction().begin();
		Utils.getSession().getTransaction().commit();
		isUpdated = true;
		return isUpdated;
	}

}
