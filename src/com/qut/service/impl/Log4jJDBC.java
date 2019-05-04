package com.qut.service.impl;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.apache.log4j.jdbc.JDBCAppender;


/**
 * 重写log4j的JDBCAppender,
 * 解决log4j日志写入数据库超时断开后数据无法继续写入的问题
 * */
public class Log4jJDBC extends JDBCAppender{
	 @Override
	    protected Connection getConnection() throws SQLException {
	        if (!DriverManager.getDrivers().hasMoreElements())
	            setDriver("sun.jdbc.odbc.JdbcOdbcDriver");
	 
	        if ((null != connection) && !connection.isValid(2)) {
	            connection = null;
	        }
	        
	        if (connection == null) {
	            connection = DriverManager.getConnection(databaseURL, databaseUser, databasePassword);
	        }
	 
	        return connection;
	    }
	}
