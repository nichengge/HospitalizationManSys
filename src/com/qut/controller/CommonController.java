package com.qut.controller;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Common;
import com.qut.pojo.Parameter;
import com.qut.service.CommonService;
import com.qut.util.JsonResult;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;


@Controller
@RequestMapping("/common")
public class CommonController {
	@Resource(name = "commonService")
	private CommonService commonService;

	@RequestMapping(value="/list.do",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String titleQuery(@Param("name") String name) {	
		List<Common> list = commonService.titleQuery(name);
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Common>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/parameterQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String parameterQuery() {
		List<Parameter> list = commonService.parameterQuery();
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/parameterCodeQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String parameterCodeQuery(@Param("code")String code) {
		List<Parameter> list = commonService.parameterCodeQuery(code);
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();

	}

	@RequestMapping(value = "/parameterCodeSave.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String parameterCodeSave(@Param("code") String code, @Param("list") String list) {
		String[] parameterCodes = list.split(",");
		for (int i = 0; i < parameterCodes.length; i++) {
			Integer id = null;
			String[] codes = parameterCodes[i].split(":");
			if (Integer.parseInt(codes[0]) == -1) {
				codes[0] = null;
				id = null;
			} else {
				id = Integer.parseInt(codes[0]);
			}
			String codees = codes[3];
			String name = codes[2];
			Integer value = Integer.parseInt(codes[1]);
			Parameter parameter = new Parameter();
			parameter.setId(id);
			parameter.setCode(codees);
			parameter.setName(name);
			parameter.setValue(value);
			if (parameter.getId() == null) {
				commonService.parameterCodeInsert(parameter);
			}
			if (parameter.getId() != null) {
				commonService.parameterCodeUpdate(parameter);
			}
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/parameterCodeDelete.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String parameterCodeDelete(@Param("id") Integer id) {
		commonService.parameterCodeDelete(id);
		JSON json = JSONSerializer.toJSON(new JsonResult<Parameter>(new Parameter()));
		return json.toString();
	}

	/**
	 * 病房类型
	 * 
	 * @return
	 */
	@RequestMapping(value = "/typeList.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String wardTypeQuery() {
		List<Parameter> list = commonService.wardTypeQuery();
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();
	}

	/**
	 * 民族查询
	 * @return
	 */
	@RequestMapping(value = "/nationList.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String nationQuery() {
		List<Parameter> list = commonService.nationQuery();
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();
	}
}
