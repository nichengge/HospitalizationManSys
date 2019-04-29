package com.qut.service.impl;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.qut.mapper.LogMapper;
import com.qut.pojo.Log;
import com.qut.service.LogService;

@Service("LogService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
public class LogServiceImpl implements LogService {
	@Resource(name = "LogMapper")
	private LogMapper LogMapper;


	@Override
	public List<Log> LogsQuery(Log log){
		return LogMapper.LogsQuery(log);
	}
	
	@Override
	public List<Log> LogQueryById(Log log){
		return LogMapper.LogQueryById(log);
	}
}
