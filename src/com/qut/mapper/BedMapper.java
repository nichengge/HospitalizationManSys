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
	 */
	List<Bed> bedQuery(Bed bed);

	/**
	 * 更改床位状态
	 */
	void bedUpdate(Bed bed);

	/**
	 * 查询房间是否已满
	 */
	Integer bedStateQuery(Bed bed);

	// 统计房间入住人数
	Integer countwardpatient(Bed bed);
}
