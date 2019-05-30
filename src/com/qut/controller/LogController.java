package com.qut.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Log;
import com.qut.service.LogService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonDateValueProcessor;
import com.qut.util.JsonResult;
import com.qut.util.Log4jLogsDetial;
import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/log")
public class LogController {
	@Resource(name = "LogService")
	private LogService logService;
	Logger logg = Logger.getLogger(Log4jLogsDetial.class);

	@RequestMapping(value = "/LogsQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String LogsQuery(@Param("type") String type, @Param("startTime") String startTime,
			@Param("endTime") String endTime) throws ParseException {
		Log log = new Log();

		if ("".equals(type)) {
			type = null;
			log.setType(type);
		} else {
			Integer type_T = BaseUtils.toInteger(type);
			String type_s = new String();
			if (type_T == 1) {
				type_s = "ERROR";
				log.setType(type_s);
				logg.info("设置日志类型为ERROR");
			}
			if (type_T == 2) {
				type_s = "WARN";
				log.setType(type_s);
				logg.info("设置日志类型为WARN");
			}
			if (type_T == 3) {
				type_s = "INFO";
				log.setType(type_s);
				logg.info("设置日志类型为INFO");
			}
			if (type_T == 4) {
				type_s = "DEBUG";
				log.setType(type_s);
				logg.info("设置日志类型为DEBUG");
			}
		}
		if (!(startTime == null || "".equals(startTime))) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date start = (Date) sdf.parse(startTime);
			log.setStartTime(start);
		}
		if (!(endTime == null || "".equals(endTime))) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date end = (Date) sdf.parse(endTime);
			log.setEndTime(end);
		}
		List<Log> loglist = logService.LogsQuery(log);
		logg.info("查询" + log.getType() + "类型日志");
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-MM-dd HH-mm-ss"));
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Log>>(loglist), jc);
		return json.toString();
	}

	@RequestMapping(value = "/LogQueryById.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String LogQueryById(@Param("id") Integer id) throws ParseException {
		Log log = new Log();
		log.setId(id);
		List<Log> loglist = logService.LogQueryById(log);
		logg.info("查询ID为" + log.getId() + "的日志");
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-MM-dd HH-mm-ss"));
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Log>>(loglist), jc);
		return json.toString();
	}
}
