package com.qut.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.qut.pojo.Log;

/**
 * 日志Dao
 */
@Repository("LogMapper")
public interface LogMapper {
	/**
	 * 查询日志
	 */
	List<Log> LogsQuery(Log log);

	/**
	 * 单个日志查询
	 */
	List<Log> LogQueryById(Log log);
}
