package com.qut.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.ArrayList;
import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Bed;
import com.qut.pojo.Ward;
import com.qut.pojo.Category;
import com.qut.pojo.Parameter;
import com.qut.service.WardService;
import com.qut.service.CategoryService;
import com.qut.service.CommonService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonResult;
import com.qut.util.Log4jLogsDetial;
import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/ward")
public class WardController {
	@Resource(name = "wardService")
	private WardService wardService;
	@Resource(name = "categoryService")
	private CategoryService categoryService;
	@Resource(name = "commonService")
	private CommonService commonService;
	Logger log = Logger.getLogger(Log4jLogsDetial.class);

	@RequestMapping(value = "/wardQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String wardQuery(@Param("departmentNo") String departmentNo, @Param("typeNo") String typeNo) {
		Ward ward = new Ward();
		List<Ward> list = null;
		if (departmentNo == null || "".equals(departmentNo)) {
			list = wardService.wardQuery(ward);
			log.info("执行病房查询");
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
			@Param("typeNo") String typeNo, @Param("wardNo") String wardNo, @Param("wardSpace") String wardSpace)
			throws ParseException {
		Ward ward = new Ward();
		ward.setCreateTime(BaseUtils.toDate(createTime));
		ward.setDepartmentNo(BaseUtils.toInteger(departmentNo));
		ward.setType(BaseUtils.toInteger(typeNo));
		ward.setWardNo(BaseUtils.toInteger(wardNo));
		ward.setwardSpace(BaseUtils.toInteger(wardSpace));
		ward.setState(0);
		// 为病房表增加数据
		wardService.wardSave(ward);
		log.info("新增病房");
		// 根据容量生成床位号，每个房间的床位号是（房间号*100）+ 床号，床号是1,2,3……自然序列。
		// 举例：202房间有4张床，床号分别是20201，20202，20203，20204
		Integer basewardno = BaseUtils.toInteger(wardNo);// 最初前端传入的房间号
		Integer wardno = basewardno * 100;// 扩大100倍后的房间号
		Integer wardspace = BaseUtils.toInteger(wardSpace);
		for (int i = 1; i <= wardspace; i++) {
			Bed bed = new Bed();
			bed.setBedNo((wardno + i));
			bed.setWardNo(basewardno);
			bed.setState(0);
			wardService.bedSave(bed);
			log.info("生成床位" + bed.getBedNo());
		}

		// 病房信息写入参数化表paracode
		/**
		 * paracode写入的病房信息是：code,parameter_value,parameter_value 其中，code是004，代表是病房信息
		 * parameter_value是病房房间号 parameter_value是病房类型名称
		 * 由于病房类型名称在category表中，此接口传入的参数typeNo仅仅是病房类型待代号
		 * 所以，先调用/categoryQuery.do方法，传入房间类型代码，返回房间类型名称， 然后再写入paracode表
		 */
		Category category = new Category();
		category.setType(BaseUtils.toInteger(typeNo));
		List<Category> list = categoryService.categoryQuery(category);
		// 取出list中的name属性
		// list.stream().map(集合变量::集合类变量属性).collect(Collectors.toList());
		List<String> wardTypeName = new ArrayList<String>();
		wardTypeName = list.stream().map(Category::getName).collect(Collectors.toList());
		// System.out.println("列表_病房类型名称："+wardTypeName);
		// 列表转字符串
		String wardTypeName_String = String.join("", wardTypeName);
		// System.out.println("字符串_病房类型名称："+wardTypeName_String);
		Parameter parameter = new Parameter();
		parameter.setCode("004");
		parameter.setValue(BaseUtils.toInteger(wardNo));
		parameter.setName(wardTypeName_String);
		commonService.parameterCodeInsert(parameter);
		log.info("病房信息写入参数化表");
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
