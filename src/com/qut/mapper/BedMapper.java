package com.qut.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.qut.pojo.Bed;
/**
 * 病床管理
 */
@Repository("bedMapper")
public interface BedMapper {
	/**
	 * 病床查询
	 * @param bed
	 * @return
	 */
	List<Bed> bedQuery(Bed bed);
	/**
	 * 更改床位状态
	 * @param bed
	 */
	void bedUpdate(Bed bed);
	/**
	 * 查询房间是否已满	
	 * @param bed
	 * @return
	 */
	Integer bedStateQuery(Bed bed);
}
