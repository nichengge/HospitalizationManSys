package com.qut.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.qut.mapper.WardMapper;
import com.qut.pojo.Bed;
import com.qut.pojo.Patient;
import com.qut.pojo.Ward;
import com.qut.service.WardService;

@Service("wardService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class WardServiceImpl implements WardService {
	@Resource(name = "wardMapper")
	private WardMapper wardMapper;

	/**
	 * 病房的增加
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void wardSave(Ward ward) {
		wardMapper.wardSave(ward);

	}

	/**
	 * 增加床位
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void bedSave(Bed bed) {
		wardMapper.bedSave(bed);

	}

	/**
	 * 病房的查询
	 */
	@Override
	public Ward wardQueryById(Integer wardId) {

		return wardMapper.wardQueryById(wardId);
	}

	@Override
	public List<Ward> wardQuery(Ward ward) {

		return wardMapper.wardQuery(ward);
	}

	/**
	 * 更改病房状态
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void wardUpdate(Ward ward) {
		wardMapper.wardUpdate(ward);

	}

	/**
	 * 记录换床信息
	 */
	@Override
	public void logWard(Patient patient) {
		wardMapper.logWard(patient);

	}

	/**
	 * 病床使用情况统计
	 */
	@Override
	public List<Map<String, Object>> wardStatistics(Integer id) {
		// 查询所属科室
		List<Map<String, Object>> list = wardMapper.departQuery(id);
		// 查询每个科室的总床位
		List<Map<String, Object>> list1 = wardMapper.bedTotal(id);
		// 查询每个科室未使用的床位
		List<Map<String, Object>> list2 = wardMapper.bedWy(id);
		for (Map<String, Object> map : list) {
			for (Map<String, Object> map1 : list1) {
				String depart1 = map.get("parameter_values") + "";
				String depart2 = map1.get("departmentNo") + "";
				if (depart1.equals(depart2)) {
					map.put("total", map1.get("total"));
				}
			}
		}
		for (Map<String, Object> map : list) {
			for (Map<String, Object> map1 : list2) {
				String depart1 = map.get("parameter_values") + "";
				String depart2 = map1.get("departmentNo") + "";
				if (depart1.equals(depart2)) {
					map.put("wy", map1.get("total"));
				}
			}
		}
		return list;
	}
}
