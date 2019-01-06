package com.qut.service;

import java.util.List;
import java.util.Map;

import com.qut.pojo.PatientCode;
import com.qut.pojo.Sign;

public interface SignService {
	/**
	 * 体征数据录入
	 * @param sign
	 */
	void signSave(Sign sign);
	/**
	 * 体征数据查询
	 * @param patientCode
	 * @return
	 */
	List<Map<String, Object>> signQuery(PatientCode patientCode);
}
