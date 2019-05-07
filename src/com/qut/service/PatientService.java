package com.qut.service;

import java.util.List;
import java.util.Map;

import com.qut.pojo.Patient;
import com.qut.pojo.PatientCode;

public interface PatientService {
	/**
	 * 病人的添加
	 */
	void patientAdd(Patient patient);

	/**
	 * 病人列表查询
	 */
	List<Map<String, Object>> patientQuery(PatientCode patientCode);

	/**
	 * 病人列表查询--通过身份证
	 */
	List<Map<String, Object>> patientQueryBycerificateNo(String BycerificateNo);

	/**
	 * 更新病人信息
	 */
	void patientUpdate(Patient patient);

	/**
	 * 费用结算
	 */
	void jiesuan(String patientId);

	/**
	 * 出院登记
	 */
	void patientLeave(String patientId);

	/**
	 * 统计查询patientStatistics
	 */
	List<Map<String, Object>> patientStatistics(Map<String, Object> map);
}
