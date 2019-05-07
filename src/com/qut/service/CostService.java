package com.qut.service;

import java.util.List;
import java.util.Map;

import com.qut.pojo.Cost;

public interface CostService {
	/**
	 * 预交费用保存
	 * 
	 * @param cost
	 */
	void costAdd(Cost cost);

	/**
	 * 预交费用查询
	 */
	List<Map<String, Object>> costQuery(Map<String, Object> map);

	/**
	 * 费用结算查询
	 */
	List<Map<String, Object>> costTotal(String patientId);

	/**
	 * 药品数量
	 * 
	 * @param patienId
	 * @param drugId
	 * @return
	 */
	Integer drugscountQuery(String patientId, String drugId);
}
