package com.todo.utility;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Utils {

	private static SessionFactory factory = null;
	private static Session session = null;
	
	public static SessionFactory getFactory() {
		if (factory==null) {
			factory = new Configuration().configure("com/todo/main/hibernate.cfg.xml").buildSessionFactory();
		}
		return factory;
	}
	
	
	public static Session getSession() {
		if (session==null) {
			session = Utils.getFactory().openSession();
		}
		return session;
	}
	
	
	public static void closeSession() {
		if (session !=null) {
			Utils.getSession().close();
		}
	}
	
	public static void closeFactory() {
		if (factory !=null) {
			Utils.getFactory().close();
		}
	}
}
