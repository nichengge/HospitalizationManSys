package com.qut.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qut.pojo.Cost;

/**
 * 费用dao
 */
@Repository("costMapper")
public interface CostMapper {
	/**
	 * 预交费用的保存
	 * @param cost
	 */
	void costAdd(Cost cost);

	/**
	 * 预交费用查询
	 * @param cost
	 * @return
	 */
	List<Map<String, Object>> costQuery(Map<String, Object> map);

	/**
	 * 药品费用
	 * @param map
	 * @return
	 */
	Map<String, Object> drugsCostQuery(Map<String, Object> map);

	/**
	 * 退药费用
	 * @param map
	 * @return
	 */
	Map<String, Object> drugWithdrawal(Map<String, Object> map);

	/**
	 * 退药费用
	 * @param map
	 * @return
	 */
	Map<String, Object> costQueryTotal(Map<String, Object> map);

	/**
	 * 床位费用
	 */
	List<Map<String, Object>> bedCodeQuery(Map<String, Object> map);

	/**
	 * 退药药品的数量
	 */
	Integer drugscountQuery(@Param("patientId") String patientId, @Param("drugId") String drugId);

}
