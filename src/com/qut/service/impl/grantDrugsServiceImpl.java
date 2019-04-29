package com.qut.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.qut.mapper.grantDrugsMapper;
import com.qut.pojo.grantDrugs;
import com.qut.service.grantDrugsService;

@Service("grantDrugsService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
public class grantDrugsServiceImpl implements grantDrugsService {
	@Resource(name = "grantDrugsMapper")
	private grantDrugsMapper grantDrugsMapper;


	@Override
	public List<grantDrugs> grantDrugsFindByPatienId(String patientId) {

		return grantDrugsMapper.grantDrugsFindByPatienId(patientId);
	}
}
