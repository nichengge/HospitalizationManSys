package com.qut.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Common;
import com.qut.pojo.Ward;
import com.qut.pojo.PatientCode;
import com.qut.pojo.DoctorCode;
import com.qut.pojo.Doctor;
import com.qut.pojo.Parameter;
import com.qut.service.CommonService;
import com.qut.service.DoctorService;
import com.qut.service.PatientService;
import com.qut.service.WardService;
import com.qut.util.JsonResult;
import com.qut.util.Log4jLogsDetial;
import net.sf.json.JSON;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping("/common")
public class CommonController {
	@Resource(name = "commonService")
	private CommonService commonService;
	@Resource(name = "doctorService")
	private DoctorService doctorService;
	@Resource(name = "patientService")
	private PatientService patientService;
	@Resource(name = "wardService")
	private WardService wardService;
	Logger log = Logger.getLogger(Log4jLogsDetial.class);

	@RequestMapping(value = "/list.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String titleQuery(@Param("name") String name) {
		List<Common> list = commonService.titleQuery(name);
		log.info("职称查询");
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Common>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/parameterQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String parameterQuery() {
		List<Parameter> list = commonService.parameterQuery();
		log.info("一级参数查询");
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/parameterCodeQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String parameterCodeQuery(@Param("code") String code) {
		List<Parameter> list = commonService.parameterCodeQuery(code);
		log.info("二级参数查询");
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();

	}

	@RequestMapping(value = "/parameterCodeSave.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String parameterCodeSave(@Param("code") String code, @Param("list") String list) {
		/*
		 * 传入的数据格式：list: 1:1:内科:001,2:2:儿科:001,3:3:妇科:001, 先用逗号分隔，区分出每个科室
		 * 再用:分割，区分出传参序号、科室编号、科室名称、参数序号
		 */
		JSON json = null;
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
			if (codees.equals("004")) {// 添加病房到病房管理--新置病房处添加
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(4, "添加病房到病房管理-新置病房处添加", null));
			} else if (codees.equals("005")) {// 角色系统未开发
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(5, "角色系统未开发", null));
			} else if (codees.equals("001") || codees.equals("002") || codees.equals("003")) {
				Parameter parameter = new Parameter();
				parameter.setId(id);
				parameter.setCode(codees);
				parameter.setName(name);
				parameter.setValue(value);
				if (parameter.getId() == null) {
					commonService.parameterCodeInsert(parameter);
					log.info("增加参数" + parameter.getName());
				}
				if (parameter.getId() != null) {
					commonService.parameterCodeUpdate(parameter);
					log.info("更新参数" + parameter.getName());
				}
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(0, "添加成功", null));
			} else {
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(6, "请求码异常", null));
			}
		}
		return json.toString();
	}

	/*
	 * 删除科室/医生头衔， 满足以下两点： ①删除头衔以前，确保头衔里面没有医生 ②删除科室以前，确保科室里面没有医生 ③删除科室以前，确保科室里面没有患者
	 * ④删除科室以前，确保科室里面没有病房 ⑤删除病房类型前，确保病房类型里面没有病房 ⑥删除病房前，确保病房里面没有患者
	 */
	@RequestMapping(value = "/parameterCodeDelete.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String parameterCodeDelete(@Param("id") Integer id, @Param("value") Integer value,
			@Param("code") String code) {
		/**
		 * 如果传入的code码是001，表明是要修改/删除科室，此时要保证②③④成立才能执行
		 * 如果传入的code码是002，表明要修改/删除头衔，此时要保证①成立才能执行
		 * 如果传入的code码是003，表明要修改/删除病房类型，此时要保证⑤成立才能执行 如果传入的code码是004,
		 * 表明要修改/删除病房，此时要保证⑥成立才能执行 如果传入其他code码，请求异常
		 */
		JSON json = null;
		if (code.equals("001")) {
			// 查询科室下的医生
			DoctorCode doctorcode = new DoctorCode();
			doctorcode.setDepartment(value);
			doctorcode.setState(0);// 在职的医生
			List<Doctor> list1 = doctorService.doctorQuery(doctorcode);
			log.info("查询医生");
			// 查询科室下的患者
			PatientCode patientcode = new PatientCode();
			patientcode.setDepartmentNo(value);
			patientcode.setOutStatus(0);// 未出院患者
			List<Map<String, Object>> list2 = patientService.patientQuery(patientcode);
			log.info("查询科室" + patientcode.getDepartmentNo() + "患者");
			// 查询科室下的病房
			Ward ward = new Ward();
			ward.setDepartmentNo(value);
			List<Ward> list3 = wardService.wardQuery(ward);
			log.info("查询科室:" + ward.getDepartmentNo() + "病房");
			// System.out.println(list1);
			// System.out.println(list2);
			// System.out.println(list3);

			if (list1.size() == 0 && list2.size() == 0 && list3.size() == 0) {
				// System.out.println("进入删除科室区");
				commonService.parameterCodeDelete(id);// 删除参数
				log.info("删除科室成功");
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(0, "删除成功", null));
			} else {
				// System.out.println("进入删除科室异常区");
				log.info("删除科室失败");
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(1, "当前科室正在使用", null));
			}
		} else if (code.equals("002")) {
			// 查询头衔里面有没有医生，结果返回到list1
			DoctorCode doctorcode = new DoctorCode();
			doctorcode.setTitle(value);
			doctorcode.setState(0);// 在职的医生
			List<Doctor> list1 = doctorService.doctorQuery(doctorcode);
			// System.out.println(list1);

			if (list1.size() == 0) {
				// System.out.println("进入删除职称区");
				commonService.parameterCodeDelete(id);// 删除参数
				log.info("删除职称成功");
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(0, "删除成功", null));
			} else {
				// System.out.println("进入删除职称异常区");
				log.info("删除职称异常");
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(2, "当前职称正在使用", null));
			}
		} else if (code.equals("003")) {
			Ward ward = new Ward();
			ward.setType(value);
			List<Ward> list1 = wardService.wardQuery(ward);// 查询该类型下的病房
			// System.out.println("根据病房类型的查询结果："+ward);
			if (list1.size() == 0) {
				// System.out.println("进入删除病房类型区");
				// 删除参数表,数据库内的触发器会同步删除category表中的相关行
				commonService.parameterCodeDelete(id);
				log.info("删除病房类型成功");
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(0, "删除成功", null));
			} else {
				// System.out.println("进入删除病房类型异常区");
				log.info("删除病房类型异常");
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(3, "当前病房类型正在使用", null));
			}
		} else if (code.equals("004")) {
			PatientCode patientCode = new PatientCode();
			patientCode.setWardNo(value);
			patientCode.setOutStatus(0);// 未出院
			List<Map<String, Object>> list1 = patientService.patientQuery(patientCode);
			if (list1.size() == 0) {
				// System.out.println("进入删除病房区");
				// 删除参数
				commonService.parameterCodeDelete(id);
				// 删除病房
				wardService.wardDelete(value);
				log.info("删除病房成功");
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(0, "删除成功", null));
			} else {
				// System.out.println("进入删除病房异常区");
				log.info("删除病房异常");
				json = JSONSerializer.toJSON(new JsonResult<Parameter>(4, "当前病房正在使用", null));
			}
		} else if (code.equals("005")) {
			json = JSONSerializer.toJSON(new JsonResult<Parameter>(5, "角色系统未开发", null));
			// TODO 角色系统

		} else {
			// System.out.println("异常的请求code:"+code);
			json = JSONSerializer.toJSON(new JsonResult<Parameter>(6, "请求码异常", null));
		}
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
		log.info("查询病房类型列表");
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();
	}

	/**
	 * 民族查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "/nationList.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String nationQuery() {
		List<Parameter> list = commonService.nationQuery();
		log.info("查询民族列表");
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Parameter>>(list));
		return json.toString();
	}
}
