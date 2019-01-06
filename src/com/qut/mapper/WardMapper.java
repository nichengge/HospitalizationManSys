package com.qut.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qut.pojo.Bed;
import com.qut.pojo.Patient;
import com.qut.pojo.Ward;
/**
 * 病房dao
 */
@Repository("wardMapper")
public interface WardMapper {
	/**
	 * 病房的添加
	 * @param ward
	 */
	void wardSave(Ward ward);	
	/**
	 * 增加床位
	 * @param bed
	 */
	void bedSave(Bed bed);
	/**
	 * 病房的查询
	 * @param wardId
	 * @return
	 */
	Ward wardQueryById(@Param("wardId") Integer wardId);
	/**
	 * 
	 * @param ward
	 * @return
	 */
	List<Ward> wardQuery(Ward ward);
	/**
	 * 更改病房状态
	 * @param wardNo
	 */
	void wardUpdate(Ward ward);
	/**
	 * 记录换床信息
	 * @param patient
	 */
	void logWard(Patient patient);
	/**
	 * 科室查询
	 * @param departNo
	 * @return
	 */
	List<Map<String, Object>> departQuery(@Param("departNo") Integer departNo);
	/**
	 * 每个科室的病床总数
	 * @param departNo
	 * @return
	 */
	List<Map<String, Object>> bedTotal(@Param("departNo") Integer departNo);
	/**
	 * 每个科室被使用的数量
	 * @param departNo
	 * @return
	 */
	List<Map<String, Object>> bedWy(@Param("departNo") Integer departNo);
	
}
