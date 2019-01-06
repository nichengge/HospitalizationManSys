package com.qut.service;

import java.util.List;

import com.qut.pojo.Drugs;
import com.qut.pojo.DrugsCode;
import com.qut.pojo.Grant;
import com.qut.pojo.Stock;
import com.qut.pojo.WithdrawalDrug;

public interface DrugsService {
	/**
	 * 药品的入库
	 * @param drugs
	 */
	void DrugsSave(Drugs drugs);
	
	/**
	 * 查询药品
	 */
	Drugs drugsFindById(String id);
	/**
	 * 药品的更新
	 */
	void DrugsUpdate(Drugs drugs);
	/**
	 * 药品按条件查询
	 */
	List<Drugs> drugsFind(DrugsCode drugsCode);
	/**
	 * 根据药品编号查询库存中是否有该种药品
	 */
	Integer drugsStockQueryById(String drugId);
	/**
	 * 更新库存
	 */
	void drugsStockAdd(Drugs drugs);
	/**
	 * 插入库存
	 */
	void drugsStockSave(Drugs drugs);
	/**
	 * 库存查询
	 */
	List<Stock> stockQuery(DrugsCode drugsCode);
	/**
	 * 药品发放
	 */
	void grantAdd(Grant grant);
	/**
	 * 更新库存
	 */
	void stockUpdate(Grant grant);
	/**
	 * 药品发放查询
	 */
	List<Stock> grantQuery(String patientId);
	/**
	 * 退药
	 * @param withdrawalDrug
	 */
	void DrugWithdrawal(WithdrawalDrug withdrawalDrug);
}
