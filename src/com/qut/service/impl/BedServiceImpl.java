package com.qut.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.qut.mapper.BedMapper;
import com.qut.pojo.Bed;
import com.qut.service.BedService;

@Service("bedService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class BedServiceImpl implements BedService {
	@Resource(name = "bedMapper")
	private BedMapper bedMapper;

	@Override
	public List<Bed> bedQuery(Bed bed) {

		return bedMapper.bedQuery(bed);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void bedUpdate(Bed bed) {

		bedMapper.bedUpdate(bed);
	}

	@Override
	public Integer bedStateQuery(Bed bed) {
		return bedMapper.bedStateQuery(bed);
	}

	@Override
	public Integer countwardpatient(Bed bed) {
		return bedMapper.countwardpatient(bed);
	}
}
