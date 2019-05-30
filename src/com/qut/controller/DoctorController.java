package com.qut.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Doctor;
import com.qut.pojo.DoctorCode;
import com.qut.pojo.PatientCode;
import com.qut.service.DoctorService;
import com.qut.service.PatientService;
import com.qut.util.JsonDateValueProcessor;
import com.qut.util.JsonResult;
import com.qut.util.Log4jLogsDetial;
import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	@Resource(name = "doctorService")
	private DoctorService doctorService;
	@Resource(name = "patientService")
	private PatientService patientService;
	private JSON json;
	Logger log = Logger.getLogger(Log4jLogsDetial.class);

	@RequestMapping(value = "/save.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String doctorSave(@Param("name") String name, @Param("title") Integer title,
			@Param("department") Integer department, @Param("gender") Integer gender, @Param("time") String time)
			throws ParseException {
		Doctor doctor = new Doctor();
		if (!(time == null || "".equals(time))) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date worktime = (Date) sdf.parse(time);
			doctor.setWorkTime(worktime);
		}
		doctor.setName(name);
		doctor.setGender(gender);
		doctor.setTitle(title);
		doctor.setDepartment(department);
		doctorService.doctorSave(doctor);
		log.info("新增医生" + doctor.getName());
		json = JSONSerializer.toJSON(new JsonResult<Doctor>(doctor));
		return json.toString();
	}

	@RequestMapping(value = "/doctorQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String doctorQuery(@Param("name") String name, @Param("startTime") String startTime,
			@Param("endTime") String endTime, @Param("title") Integer title, @Param("department") Integer department,
			@Param("state") Integer state) throws ParseException {
		DoctorCode doctorCode = new DoctorCode();
		doctorCode.setTitle(title);
		doctorCode.setName(name);
		doctorCode.setDepartment(department);
		/**
		 * 入院登记的医生查询下拉框和医生查询功能模块的医生查询复用的是这一个接口 但是入院登记的下拉框不会传入state参数，而且此处只希望查到在职医生
		 * 所以当没有传入state参数时，将医生状态设置为在职
		 */
		if (state != null) {
			// System.out.println("进入非空区");
			if (state == -1) {
				// System.out.println("进入-1区");
				doctorCode.setState(null);
				log.info("设置医生状态为缺省");
			}
			if (state == 0) {
				// System.out.println("进入0区");
				doctorCode.setState(0);
				log.info("设置医生状态为在职");
			}
			if (state == 1) {
				// System.out.println("进入1区");
				doctorCode.setState(1);
				log.info("设置医生状态为离职");
			}
		}
		if (state == null) {
			doctorCode.setState(0);
			// System.out.println("进入null区");
		}
		// System.out.println("医生状态最终设置为" + doctorCode.getState());
		if (!(startTime == null || "".equals(startTime))) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date start = (Date) sdf.parse(startTime);
			doctorCode.setStartTime(start);
		}
		if (!(endTime == null || "".equals(endTime))) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date end = (Date) sdf.parse(endTime);
			doctorCode.setEndTime(end);
		}
		List<Doctor> list = doctorService.doctorQuery(doctorCode);
		log.info("查询在职医生");
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-MM-dd"));
		json = JSONSerializer.toJSON(new JsonResult<List<Doctor>>(list), jc);
		return json.toString();

	}

	@RequestMapping(value = "/doctorDelete.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String doctorDelete(@Param("id") Integer id) {
		if (id == 0) {
			json = JSONSerializer.toJSON(new JsonResult<Doctor>(3, "该医生不存在", null));
		} else {
			/**
			 * 检查该医生名下是否有未出院的患者
			 */
			PatientCode patientCode = new PatientCode();
			patientCode.setDocid(id);
			patientCode.setOutStatus(0);
			List<Map<String, Object>> list = patientService.patientQuery(patientCode);
			// System.out.println("当前医生名下未出院患者：" + list);
			Doctor doctor = doctorService.doctorById(id);
			log.info("查询医生" + doctor.getId());
			if (doctor.getState() == 0 && list.size() == 0) {// 未离职且无患者
				doctorService.doctorDelete(id);
				log.info("医生" + doctor.getName() + "离职");
				json = JSONSerializer.toJSON(new JsonResult<Doctor>(new Doctor()));
			} else if (list.size() != 0) {// 有患者
				json = JSONSerializer.toJSON(new JsonResult<Doctor>(2, null, new Doctor()));
			} else {// 已离职
				json = JSONSerializer.toJSON(new JsonResult<Doctor>(1, null, new Doctor()));
			}
		}
		return json.toString();
	}

	@RequestMapping(value = "/updateDoctorMessage.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateDoctorMessage(@Param("id") Integer id, @Param("name") String name,
			@Param("keshi") Integer keshi, @Param("zhicheng") Integer zhicheng, @Param("gender") Integer gender) {
		Doctor doctor = new Doctor();
		doctor.setId(id);
		doctor.setName(name);
		doctor.setDepartment(keshi);
		doctor.setTitle(zhicheng);
		doctor.setGender(gender);
		doctorService.updateDoctorMessage(doctor);
		log.info("更新医生" + doctor.getName() + "信息");
		json = JSONSerializer.toJSON(new JsonResult<Doctor>(doctor));
		return json.toString();
	}
}
