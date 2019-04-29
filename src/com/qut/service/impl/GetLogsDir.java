package com.qut.service.impl;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
/**
 * 获取系统运行路径
 * 便于在运行路径下生成运行日志
 * */
public class GetLogsDir implements ServletContextListener {
	 public static final String log4jdirkey = "log4jdir";
	  public void contextDestroyed(ServletContextEvent servletcontextevent) {
	   System.getProperties().remove(log4jdirkey);
	 }
	  
	 public void contextInitialized(ServletContextEvent servletcontextevent) {
	   String log4jdir = servletcontextevent.getServletContext().getRealPath("/");
	   System.out.println("运行日志根目录:"+log4jdir);
	   System.setProperty(log4jdirkey, log4jdir);
	 }
	}