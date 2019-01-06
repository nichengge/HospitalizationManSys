package com.qut.service.impl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.qut.mapper.CostMapper;
import com.qut.pojo.Cost;
import com.qut.service.CostService;
import com.qut.util.BaseUtils;

@Service("costService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class CostServiceImpl implements CostService {
	@Resource(name = "costMapper")
	private CostMapper costMapper;

	@Override
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public void costAdd(Cost cost) {
		costMapper.costAdd(cost);

	}

	@Override
	public List<Map<String, Object>> costQuery(Map<String, Object> map) {

		return costMapper.costQuery(map);
	}

	@Override
	public List<Map<String, Object>> costTotal(String patientId) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		// 预交费用
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("patientId", patientId);
		Map<String, Object> yjcost = costMapper.costQueryTotal(map1);
		if (yjcost != null) {
			yjcost.put("type", "预交费用");
			list.add(yjcost);
		}
		// 药品费用
		Map<String, Object> drugsCost = costMapper.drugsCostQuery(map1);
		if (drugsCost != null) {
			drugsCost.put("type", "领药费用");
			list.add(drugsCost);
		}

		// 退药费用
		Map<String, Object> withdrawalCost = costMapper.drugWithdrawal(map1);
		if (withdrawalCost != null) {
			withdrawalCost.put("type", "退药费用");
			list.add(withdrawalCost);
		}

		// 床位费用
		List<Map<String, Object>> list2 = costMapper.bedCodeQuery(map1);
		Map<String, Object> mp = new HashMap<String, Object>();
		mp.put("updateTime", new Timestamp(System.currentTimeMillis()));
		mp.put("price", 0);
		list2.add(mp);
		Float total = 0f;

		if (list2 != null) {
			for (int i = 0; i < list2.size() - 1; i++) {
				Date date1;
				try {
					date1 = BaseUtils.toDate(list2.get(i + 1).get("updateTime").toString());
					Date date2 = BaseUtils.toDate(list2.get(i).get("updateTime").toString());
					long days = (date1.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000);
					int day = (int) days;
					total = total + day * Float.parseFloat(list2.get(i).get("price").toString());
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			Map<String, Object> map3 = new HashMap<String, Object>();
			map3.put("patientId", patientId);
			map3.put("account", total);
			map3.put("type", "床位费");
			list.add(map3);
		}
		return list;
	}

	@Override
	public Integer drugscountQuery(String patientId, String drugId) {

		return costMapper.drugscountQuery(patientId, drugId);
	}

}
