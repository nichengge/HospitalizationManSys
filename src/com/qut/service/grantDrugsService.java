package com.qut.service;
import java.util.List;
import com.qut.pojo.grantDrugs;

public interface grantDrugsService {
	
	/**
	 * 根据住院号查询药物派发记录
	 */
	List<grantDrugs> grantDrugsFindByPatienId(String patientId);
}
