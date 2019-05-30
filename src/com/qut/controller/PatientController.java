package com.qut.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Bed;
import com.qut.pojo.Patient;
import com.qut.pojo.PatientCode;
import com.qut.pojo.Ward;
import com.qut.pojo.User;
import com.qut.service.BedService;
import com.qut.service.PatientService;
import com.qut.service.WardService;
import com.qut.service.UserService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonResult;
import com.qut.util.MD5;
import com.qut.util.Log4jLogsDetial;
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
	@Resource(name = "userService")
	private UserService userService;
	Logger log = Logger.getLogger(Log4jLogsDetial.class);

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
		log.info("患者" + request.getParameter("name") + "入院");
		// 记录床位信息
		wardService.logWard(patient);
		log.info("记录到病房变更");
		// 更改床位的状态
		Bed bed = new Bed();
		bed.setWardNo(patient.getRoomNo());
		bed.setBedNo(patient.getBedNo());
		bed.setState(1);
		bedService.bedUpdate(bed);
		log.info("更新床位状态");
		// 判断房间是否满，如果满就改变状态
		Ward ward = new Ward();
		ward.setWardNo(patient.getRoomNo());
		Integer patientNum = bedService.countwardpatient(bed);// 当前病房的患者数
		Integer wardspace = wardService.wardspace(ward);// 当前病房的额定容量
		if (patientNum == wardspace) {// 已经住满
			// 改变病房的状态
			ward.setWardNo(patient.getRoomNo());
			ward.setState(1);
			wardService.wardUpdate(ward);
			log.info("更新病房状态");
		}

		// 将患者的基本信息插入到user表，如果患者以前住过院，用户表里会存有患者身份证，则不再插入
		User user = new User();
		user.setId(request.getParameter("cerificateNo"));// 用户ID是患者入院的身份证号
		user.setName(request.getParameter("name"));// 用户姓名是患者的入院姓名
		String defaultpassword = "123456";
		defaultpassword = defaultpassword.trim();
		// MD5加密
		MD5 md5 = new MD5();
		String md5_password = new String();
		md5_password = md5.to_md5(defaultpassword);
		user.setPassword(md5_password);// 患者初始密码123456
		user.setDescribe(0);// 账户类型是0--患者
		User checkuser = userService.findUserById(request.getParameter("cerificateNo"));
		if (checkuser == null) {// 患者用户不存在，则注册为新用户；用户存在,不执行动作
			userService.register(user);
			log.info("患者" + patient.getName() + "开户：" + patient.getCerificateNo());
		} else {
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
		// patientCode.setDocid(BaseUtils.toInteger(request.getParameter("Docid")));
		patientCode.setName(name);
		patientCode.setWardNo(BaseUtils.toInteger(request.getParameter("wardNo")));
		patientCode.setBedNo(BaseUtils.toInteger(request.getParameter("bedNo")));
		patientCode.setStart(BaseUtils.toDate(request.getParameter("start")));
		patientCode.setEnd(BaseUtils.toDate(request.getParameter("end")));
		patientCode.setOutStatus(0);// 设置出院状态为未出院
		// System.out.println("当前患者码为:" + patientCode);
		List<Map<String, Object>> list = patientService.patientQuery(patientCode);
		log.info("患者查询");
		for (Map<String, Object> map : list) {// 此处不对从库中取出的时间做toString转化会报java.lang.IllegalArgumentException
			String admissionTime = map.get("admissionTime").toString();
			map.put("admissionTime", admissionTime);
			String birth = map.get("birth").toString();
			map.put("birth", birth);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/patientQueryBycerificateNo.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String patientQueryBycerificateNo(HttpServletRequest request) throws ParseException {
		String patientcerificateNo = BaseUtils.toString(request.getParameter("cerificateNo"));
		List<Map<String, Object>> list = patientService.patientQueryBycerificateNo(patientcerificateNo);
		log.info("身份证" + patientcerificateNo + "患者查询信息");
		for (Map<String, Object> map : list) {// 此处不对从库中取出的时间做toString转化会报java.lang.IllegalArgumentException
			String admissionTime = map.get("admissionTime").toString();
			map.put("admissionTime", admissionTime);
			String birth = map.get("birth").toString();
			map.put("birth", birth);
			if (map.get("leaveTime") != null) {
				String leaveTime = map.get("leaveTime").toString();
				map.put("leaveTime", leaveTime);
			} else {
				String leaveTime = "未出院";
				map.put("leaveTime", leaveTime);
			}
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Map<String, Object>>>(list));
		// System.out.println("返回的json是："+json.toString());
		return json.toString();
	}

	@RequestMapping(value = "/patientUpdate.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String patientUpdate(HttpServletRequest request) {
		String patientId = BaseUtils.toString(request.getParameter("patientId"));
		Integer departmentNo = BaseUtils.toInteger(request.getParameter("departmentNo"));
		Integer typeNo = BaseUtils.toInteger(request.getParameter("typeNo"));
		Integer new_ward_No = BaseUtils.toInteger(request.getParameter("wardNo"));
		Integer new_bed_No = BaseUtils.toInteger(request.getParameter("bedNo"));
		Integer doctorNo = BaseUtils.toInteger(request.getParameter("doctorNo"));
		Integer old_bed_Num = BaseUtils.toInteger(request.getParameter("ybed"));
		Integer old_ward_Num = BaseUtils.toInteger(request.getParameter("yroom"));
		Patient patient = new Patient();
		patient.setPatientId(patientId);
		patient.setDepartment(departmentNo);
		patient.setRoomType(typeNo);
		patient.setBedNo(new_bed_No);
		patient.setRoomNo(new_ward_No);
		patient.setDoctorId(doctorNo);

		// 更新病人信息到病人信息表(patient)
		patientService.patientUpdate(patient);
		log.info("患者" + patient.getName() + "转病房:更新患者信息");
		// 记录改变床位记录到病房变更表(wardupdate)
		wardService.logWard(patient);
		log.info("患者" + patient.getName() + "转病房:记录到病房转移");
		// 改变原床位的状态为可住到床位表(bed)
		Bed old_bed = new Bed();
		old_bed.setWardNo(old_ward_Num);
		old_bed.setBedNo(old_bed_Num);
		old_bed.setState(0);
		bedService.bedUpdate(old_bed);
		log.info("患者" + patient.getName() + "转病房:更新旧床位状态");
		// 改变新床位的状态为已住
		Bed new_bed = new Bed();
		new_bed.setWardNo(new_ward_No);
		new_bed.setBedNo(new_bed_No);
		new_bed.setState(1);
		bedService.bedUpdate(new_bed);
		log.info("患者" + patient.getName() + "转病房:更新新床位状态");
		/**
		 * 改变原病房状态，如果之前为已满，则改为未满
		 */
		Ward ward1 = wardService.wardQueryById(old_ward_Num);
		if (ward1.getState() == 1) {
			ward1.setWardNo(old_ward_Num);
			ward1.setState(0);
			wardService.wardUpdate(ward1);
			log.info("患者" + patient.getName() + "转病房:更新旧病房状态");
		}

		/**
		 * 改变新病房状态，如果满了，就把状态改为已满
		 */
		Ward ward2 = new Ward();
		ward2.setWardNo(new_ward_No);
		Integer patientNum = bedService.countwardpatient(new_bed);// 当前病房的患者数
		Integer wardspace = wardService.wardspace(ward2);// 当前病房的额定容量
		if (patientNum == wardspace) {// 已经住满
			// 改变病房的状态
			ward2.setState(1);
			wardService.wardUpdate(ward2);
			log.info("患者" + patient.getName() + "转病房:更新新病房状态");
		}

		JSON json = JSONSerializer.toJSON(new JsonResult<Patient>(patient));
		return json.toString();
	}

	@RequestMapping(value = "/patientLeave.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String patientLeave(String patientId, Integer bedNo, Integer roomNo) {
		// 标记patient表中的leaveState状态为1，标记为出院
		patientService.patientLeave(patientId);
		log.info("患者" + patientId + "出院");
		// 改变原床位的状态为可住
		Bed bed = new Bed();
		bed.setWardNo(roomNo);
		bed.setBedNo(bedNo);
		bed.setState(0);
		bedService.bedUpdate(bed);// 将bed表中的roomNum&&bedNo行的State标记为0，床位设置为未使用
		log.info("患者" + patientId + "出院:更新床位状态");
		// 判断原病房是否已满
		Ward ward = wardService.wardQueryById(roomNo);
		if (ward.getState() == 1) {// 如果之前已经住满了，则把新状态置为未住满，state=0
			ward.setState(0);
			wardService.wardUpdate(ward);
			log.info("患者" + patientId + "出院:更新病房状态");
		}

		JSON json = JSONSerializer.toJSON(new JsonResult<Patient>(new Patient()));
		return json.toString();
	}

	@RequestMapping(value = "/jiesuan.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String jiesuan(String patientId) {
		patientService.jiesuan(patientId);
		log.info("患者" + patientId + "结算");
		JSON json = JSONSerializer.toJSON(new JsonResult<Patient>(new Patient()));
		return json.toString();
	}

	@RequestMapping(value = "/leftFind.do", produces = "application/json;charset=utf-8")
	@ResponseBody // 出院记录查询
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
		log.info("患者查询");
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
