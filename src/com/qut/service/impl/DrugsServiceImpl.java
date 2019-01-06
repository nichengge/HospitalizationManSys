package com.qut.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.qut.mapper.DrugsMapper;
import com.qut.pojo.Drugs;
import com.qut.pojo.DrugsCode;
import com.qut.pojo.Grant;
import com.qut.pojo.Stock;
import com.qut.pojo.WithdrawalDrug;
import com.qut.service.DrugsService;

@Service("drugsService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
public class DrugsServiceImpl implements DrugsService {
	@Resource(name = "drugsMapper")
	private DrugsMapper drugsMapper;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void DrugsSave(Drugs drugs) {
		drugsMapper.drugsSave(drugs);

	}

	@Override
	public Drugs drugsFindById(String id) {

		return drugsMapper.drugsFindById(id);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void DrugsUpdate(Drugs drugs) {
		drugsMapper.DrugsUpdate(drugs);
	}

	@Override
	public List<Drugs> drugsFind(DrugsCode drugsCode) {

		return drugsMapper.drugsFind(drugsCode);
	}

	@Override
	public Integer drugsStockQueryById(String drugId) {

		return drugsMapper.drugsStockQueryById(drugId);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void drugsStockAdd(Drugs drugs) {
		drugsMapper.drugsStockAdd(drugs);

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void drugsStockSave(Drugs drugs) {
		drugsMapper.drugsStockSave(drugs);

	}

	@Override
	public List<Stock> stockQuery(DrugsCode drugsCode) {

		return drugsMapper.stockQuery(drugsCode);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void grantAdd(Grant grant) {
		drugsMapper.grantAdd(grant);

	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void stockUpdate(Grant grant) {
		drugsMapper.stockUpdate(grant);

	}

	@Override
	public List<Stock> grantQuery(String patientId) {

		return drugsMapper.grantQuery(patientId);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void DrugWithdrawal(WithdrawalDrug withdrawalDrug) {
		drugsMapper.DrugWithdrawal(withdrawalDrug);

	}

}
