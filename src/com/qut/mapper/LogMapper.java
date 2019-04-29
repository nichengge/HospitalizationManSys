package com.qut.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.qut.pojo.Log;
import com.qut.pojo.grantDrugs;

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
