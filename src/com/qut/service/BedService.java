package com.qut.service;

import java.util.List;

import com.qut.pojo.Bed;

public interface BedService {
//床位查询
	List<Bed> bedQuery(Bed bed);	
	
//更改床位状态
	void bedUpdate(Bed bed);
	
//查询房间是否已满
	Integer bedStateQuery(Bed bed);
	
//查询指定房间号的入住人数，比如房间号=001且床位状态=1
	Integer countwardpatient(Bed bed);
}
