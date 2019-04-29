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
		
		/**
		 * 预缴费用计算，查询cost表的account列，以patientId分类汇总
		 * */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("patientId", patientId);
		Map<String, Object> yjcost = costMapper.costQueryTotal(map);
		if (yjcost != null) {
			yjcost.put("type", "预缴费用");
			list.add(yjcost);
		}
		
		
		/**
		 * 药物费用，查询grantdrug表的drugPrice列和drugCount列，以patientId分类汇总
		 * */
		Map<String, Object> drugsCost = costMapper.drugsCostQuery(map);
		if (drugsCost != null) {
			drugsCost.put("type", "药物费用");
			list.add(drugsCost);
		}
		
		/**
		 * 退药费用，查询withdrawal表
		 * */
		Map<String, Object> withdrawalCost = costMapper.drugWithdrawal(map);
		if (withdrawalCost != null) {
			withdrawalCost.put("type", "退药费用");
			list.add(withdrawalCost);
		}

		/**
		 * 床位费用，
		 * 由于存在住院期间内转病房的情况(如从ICU病房住了3天，从普通病房住了10天)，
		 * 各类病房价格不一样，
		 * 所以分别计算不同类型的病房的价格
		 * */
		
		/**
		 * ①根据patientID，左外连接wardUpdate表和category表，
		 * 查出入住时间和价格,存入临时列表temp_list：
		 * [{price=70.0, updateTime=2019-04-10},{price=70.0, updateTime=2019-04-10},……,……,……]
		 * 其中，price是病房的价格，updateTime是进入该类型病房的时间
		 * ②临时列表temp_list末尾追加一个临时字典temp_map：
		 * {price=0.0, updateTime=当前系统时间戳}
		 * 其中，价格为0，更新时间为当前系统时间戳，即结算的这一刻的时间(出院时间)，
		 * ③如果临时列表temp_list不空，则用i+1位置的updateTime减去i位置的updateTime：滞留时间=updateTime[i+1]-updateTime[i]
		 * 患者第一次入院的时间会写入到wardUpdate表的updateTime字段，
		 * 这个时间就是入院时间，
		 * 如果全程没有换病房，那么(最后出院时间-updateTime时间)就是在该病房滞留的时间；
		 * 如果换了一次病房，换病房的时间会以一条新纪录的形式记录到wardUpdate表的updateTime字段，
		 * 后一条updateTime减去前一条updateTime，结果就是在该类型病房的滞留时间。
		 * */
		//①
		List<Map<String, Object>> temp_list = costMapper.bedCodeQuery(map);
		
		//②
		Map<String, Object> temp_map = new HashMap<String, Object>();
		temp_map.put("updateTime", new Timestamp(System.currentTimeMillis()));
		temp_map.put("price", 0);
		temp_list.add(temp_map);//将当前时间加入到临时列表temp_list，价格标记为0:{price=0, updateTime=2019-04-15 19:52:36.015}
		
		Float SUM_price = 0f;//总床位费
		Float One_price = 0f;//单类型病房床位费
		//③
		if (temp_list != null) {
			for (int i = 0; i < temp_list.size() - 1; i++) {
				Date out_date;//离开该类型病房的时间
				Date in_date;//住进该类型病房的时间
				try {
					out_date = BaseUtils.toDate(temp_list.get(i + 1).get("updateTime").toString());
					in_date = BaseUtils.toDate(temp_list.get(i).get("updateTime").toString());
					long days = (out_date.getTime() - in_date.getTime()) / (24 * 60 * 60 * 1000);//相减以后单位是ms，所以换算成天
					int day = (int) days+1;//不足一天按一天算
					One_price = day * Float.parseFloat(temp_list.get(i).get("price").toString());
					String wardTypeName = temp_list.get(i).get("wardTypeName").toString();
					//构造字典{patientId=*, type=*, account=*}装入List
					Map<String, Object> temp_map2 = new HashMap<String, Object>();
					temp_map2.put("patientId", patientId);
					temp_map2.put("account", One_price);
					temp_map2.put("type", "床位费:"+ wardTypeName);
					list.add(temp_map2);
					SUM_price = SUM_price + One_price;
				} catch (ParseException e) {
					e.printStackTrace();
				} finally {
				}
			}
			
			//构造字典{patientId=*, type=*, account=*}装入List
			Map<String, Object> temp_map2 = new HashMap<String, Object>();
			temp_map2.put("patientId", patientId);
			temp_map2.put("account", SUM_price);
			temp_map2.put("type", "床位费(总计)");
			list.add(temp_map2);
		}
		return list;
	}

	
	@Override
	public Integer drugscountQuery(String patientId, String drugId) {

		return costMapper.drugscountQuery(patientId, drugId);
	}

}
