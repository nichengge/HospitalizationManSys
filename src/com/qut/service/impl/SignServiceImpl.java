package com.qut.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.qut.mapper.SignMapper;
import com.qut.pojo.PatientCode;
import com.qut.pojo.Sign;
import com.qut.service.SignService;

@Service("signService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class SignServiceImpl implements SignService{
	@Resource(name="signMapper")
	private SignMapper signMapper;
	@Override
	@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT,rollbackFor=Exception.class)
	public void signSave(Sign sign) {
		signMapper.signSave(sign);
		
	}

	@Override
	public List<Map<String, Object>> signQuery(PatientCode patientCode) {
		
		return signMapper.signQuery(patientCode);
	}

}
