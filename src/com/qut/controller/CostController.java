package com.qut.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Cost;
import com.qut.service.CostService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonResult;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping("/cost")
public class CostController {
	@Resource(name = "costService")
	private CostService costService;

	@RequestMapping(value = "/costAdd.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String costAdd(@Param("patientId") String patientId, @Param("types") String types,
			@Param("account") Float account, @Param("userId") String userId) {
		Cost cost = new Cost();
		cost.setAccount(account);
		cost.setPatientId(patientId);
		cost.setType(types);
		cost.setUserId(userId);
		String id = System.currentTimeMillis() + "";
		cost.setId(id);
		costService.costAdd(cost);
		JSON json = JSONSerializer.toJSON(new JsonResult<Cost>(cost));
		return json.toString();
	}

	@RequestMapping(value = "/costQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String costQuery(@Param("id") String id, @Param("patientId") String patientId, @Param("types") String types,
			@Param("userId") String userId, @Param("startTime") String startTime, @Param("endTime") String endTime,
			@Param("patientName") String patientName) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("patientId", BaseUtils.toString(patientId));
		map.put("startTime", BaseUtils.toDate(startTime));
		map.put("endTime", BaseUtils.toDate(endTime));
		map.put("patientName", BaseUtils.toString(patientName));
		List<Map<String, Object>> list = costService.costQuery(map);
		for (Map<String, Object> mapp : list) {
			String costTime = mapp.get("costTime").toString();
			mapp.put("costTime", costTime);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/costTotal.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String costTotal(@Param("patientId") String patientId) {
		List<Map<String, Object>> list = costService.costTotal(patientId);
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/countTotal.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String countTotal(@Param("patientId") String patientId, @Param("drugId") String drugId) {
		Integer count = costService.drugscountQuery(patientId, drugId);
		JSON json = JSONSerializer.toJSON(new JsonResult<Integer>(count));
		return json.toString();
	}
}
