package com.todo.dao;

import java.util.List;
import com.todo.entities.TODO;

public interface Dao {
	public int create(TODO todo);
	public Boolean update(TODO todo);
	public TODO getTODO(int id);
	public List<TODO> getTODOList();
	public Boolean deleteATODO(TODO todo);
}
