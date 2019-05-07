package com.qut.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.qut.pojo.grantDrugs;

/**
 * 药品派发Dao
 * 
 */
@Repository("grantDrugsMapper")
public interface grantDrugsMapper {
	// 根据患者住院号查询药品派发
	List<grantDrugs> grantDrugsFindByPatienId(@Param("patientId") String patientId);
}
