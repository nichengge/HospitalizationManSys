package com.qut.service;

import java.util.List;
import java.util.Map;

import com.qut.pojo.Bed;
import com.qut.pojo.Patient;
import com.qut.pojo.Ward;

public interface WardService {
	/**
	 * 病房的添加
	 * @param ward
	 */
	void wardSave(Ward ward);
	/**
	 * 增加床位
	 * @param bed
	 */
	void bedSave(Bed bed);
	/**
	 * 病房查询
	 */
	Ward wardQueryById(Integer wardId);
	/**
	 * 病房查询
	 * @param ward
	 * @return
	 */
	List<Ward> wardQuery(Ward ward);
	/**
	 * 更改病房状态
	 * @param wardNo
	 */
	void wardUpdate(Ward ward);
	/**
	 * 改变床位
	 * @param patient
	 */
	void logWard(Patient patient);
	/**
	 * 病床使用情况统计
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> wardStatistics(Integer id);
}
