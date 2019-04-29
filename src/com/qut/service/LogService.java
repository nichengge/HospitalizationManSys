package com.qut.service;
import java.util.List;
import java.util.Map;
import com.qut.pojo.Log;

public interface LogService {
	/**
	 * 日志查询
	 * */
	List<Log> LogsQuery(Log log);
	
	/**
	 * 日志统计
	 * */
	List<Log> LogQueryById(Log log);
}
