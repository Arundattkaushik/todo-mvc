package com.todo.controllers;

import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.todo.entities.TODO;
import com.todo.services.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;

@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping(path = "/add-todo")
	public void addTODOFormViewer() {
		
	}
	
	@RequestMapping(path =  "/create-todo", method = RequestMethod.POST)
	public String createTODO(@ModelAttribute() TODO todo, ModelAndView view) {
		Service.saveTodo(new TODO(new Random().nextInt(1000) ,todo.getNoteTitle(), todo.getNoteContent(), new Date()));
		return "redirect:/home";
	}
	
	@RequestMapping("/todo-list")
	public void todoList() {
		
	}
	
	@RequestMapping("/delete-todo")
	public String deleteTODO(@RequestParam("todo_id") String todo_id) {
		TODO todo = Service.getTodo(Integer.parseInt(todo_id));
		Service.deleteTODO(todo);
		return "redirect:/home";	
	}
	
	@RequestMapping("/edit-todo")
	public void editTodoViewer() {
	
	}
	
	
	@RequestMapping(path = "/edit-details", method = RequestMethod.POST)
	public String updateTodo(@ModelAttribute() TODO todo ,@RequestParam("todo_id") int id) {

		TODO to = Service.getTodo(id);
		
		todo.setId(id);
		todo.setCreateDate(to.getCreateDate());
		todo.setLastUpdatedDate(new Date());
		todo.setNoteTitle(todo.getNoteTitle());
		todo.setNoteContent(todo.getNoteContent());
		Service.updateTODO(todo);
		
		return "redirect:/home";	
	}
	
	
	@RequestMapping(path = "/todo-details")
	public ModelAndView viewTodoDetails(ModelAndView view) {
		view.setViewName("todo-details");
		return view;
	}
	
	
	
}
