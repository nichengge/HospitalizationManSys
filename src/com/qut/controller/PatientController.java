package com.qut.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Bed;
import com.qut.pojo.Patient;
import com.qut.pojo.PatientCode;
import com.qut.pojo.Ward;
import com.qut.service.BedService;
import com.qut.service.PatientService;
import com.qut.service.WardService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonResult;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping("/patient")
public class PatientController {
	@Resource(name = "patientService")
	private PatientService patientService;
	@Resource(name = "bedService")
	private BedService bedService;
	@Resource(name = "wardService")
	private WardService wardService;

	@RequestMapping(value = "/patientAdd.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String patientAdd(HttpServletRequest request) throws ParseException {
		Patient patient = new Patient();
		patient.setPatientId(System.currentTimeMillis() + "");
		patient.setName(request.getParameter("name"));
		patient.setDoctorId(BaseUtils.toInteger(request.getParameter("doctorNo")));
		patient.setNation(BaseUtils.toInteger(request.getParameter("nationNo")));
		patient.setDepartment(BaseUtils.toInteger(request.getParameter("departmentNo")));
		patient.setCerificateNo(request.getParameter("cerificateNo"));
		patient.setWorkUnit(request.getParameter("workUnit"));
		patient.setMaritalStatus(BaseUtils.toInteger(request.getParameter("marryNo")));
		patient.setGender(BaseUtils.toInteger(request.getParameter("genderNo")));
		patient.setHomeAddress(request.getParameter("homeAddress"));
		patient.setHomePhone(request.getParameter("homePhone"));
		patient.setContacts(request.getParameter("contacts"));
		patient.setContactsPhone(request.getParameter("contactsPhone"));
		patient.setAdmissionStatus(BaseUtils.toInteger(request.getParameter("statusNo")));
		patient.setRoomType(BaseUtils.toInteger(request.getParameter("typeNo")));
		patient.setRoomNo(BaseUtils.toInteger(request.getParameter("wardNo")));
		patient.setBedNo(BaseUtils.toInteger(request.getParameter("bedNo")));
		patient.setBirth(BaseUtils.toDate(request.getParameter("birth")));
		patient.setState(0);// 区别是否出院
		// 保存病人信息
		patientService.patientAdd(patient);
		// 记录床位信息
		wardService.logWard(patient);
		// 更改床位的状态
		Bed bed = new Bed();
		bed.setWardNo(patient.getRoomNo());
		bed.setBedNo(patient.getBedNo());
		bed.setState(1);
		bedService.bedUpdate(bed);
		// 判断房间是否满，如果满就改变状态
		Integer sum = bedService.bedStateQuery(bed);
		if (sum == 4) {
			// 改变病房的状态
			Ward ward = new Ward();
			ward.setWardNo(bed.getWardNo());
			ward.setState(1);
			wardService.wardUpdate(ward);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<Patient>(new Patient()));
		return json.toString();
	}

	@RequestMapping(value = "/patientQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String patientQuery(HttpServletRequest request) throws ParseException {
		PatientCode patientCode = new PatientCode();
		String patientId = BaseUtils.toString(request.getParameter("patientId"));
		String name = BaseUtils.toString(request.getParameter("name"));
		patientCode.setPatientId(patientId);
		patientCode.setDepartmentNo(BaseUtils.toInteger(request.getParameter("departmentNo")));
		patientCode.setName(name);
		patientCode.setWardNo(BaseUtils.toInteger(request.getParameter("wardNo")));
		patientCode.setBedNo(BaseUtils.toInteger(request.getParameter("bedNo")));
		patientCode.setStart(BaseUtils.toDate(request.getParameter("start")));
		patientCode.setEnd(BaseUtils.toDate(request.getParameter("end")));
		patientCode.setOutStatus(0);
		List<Map<String, Object>> list = patientService.patientQuery(patientCode);
		for (Map<String, Object> map : list) {
			String admissionTime = map.get("admissionTime").toString();
			map.put("admissionTime", admissionTime);
			String birth = map.get("birth").toString();
			map.put("birth", birth);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/patientUpdate.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String patientUpdate(HttpServletRequest request) {
		String patientId = BaseUtils.toString(request.getParameter("patientId"));
		Integer departmentNo = BaseUtils.toInteger(request.getParameter("departmentNo"));
		Integer typeNo = BaseUtils.toInteger(request.getParameter("typeNo"));
		Integer wardNo = BaseUtils.toInteger(request.getParameter("wardNo"));
		Integer bedNo = BaseUtils.toInteger(request.getParameter("bedNo"));
		Integer doctorNo = BaseUtils.toInteger(request.getParameter("doctorNo"));
		Integer ybed = BaseUtils.toInteger(request.getParameter("ybed"));
		Integer yroom = BaseUtils.toInteger(request.getParameter("yroom"));
		Patient patient = new Patient();
		patient.setPatientId(patientId);
		patient.setDepartment(departmentNo);
		patient.setRoomType(typeNo);
		patient.setBedNo(bedNo);
		patient.setRoomNo(wardNo);
		patient.setDoctorId(doctorNo);
		// 更新病人信息
		patientService.patientUpdate(patient);
		// 记录改变床位记录
		wardService.logWard(patient);
		// 改变原床位的状态为可住
		Bed bed = new Bed();
		bed.setBedNo(ybed);
		bed.setState(0);
		bedService.bedUpdate(bed);
		// 判断原病房是否已满
		Ward ward = wardService.wardQueryById(yroom);
		if (ward.getState() == 1) {
			// 改变房间状态为未满
			Ward ward2 = new Ward();
			ward2.setWardNo(yroom);
			ward2.setState(0);
			wardService.wardUpdate(ward2);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<Patient>(patient));
		return json.toString();
	}

	@RequestMapping(value = "/patientLeave.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String patientLeave(String patientId, Integer bedNo,Integer roomNo) {
		// 改变病人的是否出院的状态
		patientService.patientLeave(patientId);
		// 改变原床位的状态为可住
		Bed bed = new Bed();
		bed.setBedNo(bedNo);
		bed.setState(0);
		bedService.bedUpdate(bed);
		// 判断原病房是否已满
		Ward ward = wardService.wardQueryById(roomNo);
		if (ward.getState() == 1) {
			// 改变房间状态为未满
			Ward ward2 = new Ward();
			ward2.setWardNo(roomNo);
			ward2.setState(0);
			wardService.wardUpdate(ward2);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<Patient>(new Patient()));
		return json.toString();
	}

	@RequestMapping(value = "/jiesuan.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String jiesuan(String patientId) {
		patientService.jiesuan(patientId);
		JSON json = JSONSerializer.toJSON(new JsonResult<Patient>(new Patient()));
		return json.toString();
	}

	@RequestMapping(value = "/leftFind.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String leftFind(String patientId, String patientName, String inStart, String inEnd, String outStart,
			String outEnd) throws ParseException {
		PatientCode patientCode = new PatientCode();
		patientCode.setPatientId(BaseUtils.toString(patientId));
		patientCode.setName(BaseUtils.toString(patientName));
		patientCode.setStart(BaseUtils.toDate(inStart));
		patientCode.setEnd(BaseUtils.toDate(inEnd));
		patientCode.setOutStart(BaseUtils.toDate(outStart));
		patientCode.setOutEnd(BaseUtils.toDate(outEnd));
		patientCode.setOutStatus(1);
		List<Map<String, Object>> list = patientService.patientQuery(patientCode);
		for (Map<String, Object> map : list) {
			String leaveTime = map.get("leaveTime").toString();
			map.put("leaveTime", leaveTime);
			String admissionTime = map.get("admissionTime").toString();
			map.put("admissionTime", admissionTime);
			String birth = map.get("birth").toString();
			map.put("birth", birth);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/patientStatistics.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String patientStatistics(String startTime, String endTime) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startTime", BaseUtils.toDate(startTime));
		map.put("endTime", BaseUtils.toDate(endTime));
		List<Map<String, Object>> list = patientService.patientStatistics(map);
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
		return json.toString();
	}

}
