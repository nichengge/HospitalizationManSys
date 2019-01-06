package com.qut.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Bed;
import com.qut.pojo.Ward;
import com.qut.service.WardService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonResult;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/ward")
public class WardController {
	@Resource(name = "wardService")
	private WardService wardService;

	@RequestMapping(value = "/wardQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String wardQuery(@Param("departmentNo") String departmentNo, @Param("typeNo") String typeNo) {
		Ward ward = new Ward();
		List<Ward> list = null;
		if (departmentNo == null || "".equals(departmentNo)) {
			list = wardService.wardQuery(ward);
		} else {
			ward.setDepartmentNo(BaseUtils.toInteger(departmentNo));
			ward.setType(BaseUtils.toInteger(typeNo));
			ward.setState(0);
			list = wardService.wardQuery(ward);
		}
		JsonConfig js = new JsonConfig();
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Ward>>(list), js);
		return json.toString();
	}

	@RequestMapping(value = "/wardSave.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String wardSave(@Param("createTime") String createTime, @Param("departmentNo") String departmentNo,
			@Param("typeNo") String typeNo, @Param("wardNo") String wardNo) throws ParseException {
		Ward ward = new Ward();
		ward.setCreateTime(BaseUtils.toDate(createTime));
		ward.setDepartmentNo(BaseUtils.toInteger(departmentNo));
		ward.setType(BaseUtils.toInteger(typeNo));
		ward.setWardNo(BaseUtils.toInteger(wardNo));
		ward.setState(0);
		// 为病房表增加数据
		wardService.wardSave(ward);
		// 为床位表增加数据
		Integer i = BaseUtils.toInteger(wardNo);
		Integer start = 4 * (i - 1) + 1;
		for (int a = start; a <= i * 4; a++) {
			// 每新增一个病房就新增四张床位，床位号为病房号的四倍
			Bed bed = new Bed();
			bed.setBedNo(a);
			bed.setWardNo(i);
			bed.setState(0);
			wardService.bedSave(bed);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<Ward>(ward));
		return json.toString();
	}

	@RequestMapping(value = "/wardStatistics.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String wardStatistics(@Param("departmentNo") Integer departmentNo) {
		List<Map<String, Object>> list = wardService.wardStatistics(departmentNo);
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
		return json.toString();
	}
}
