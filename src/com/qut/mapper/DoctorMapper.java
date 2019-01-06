package com.qut.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qut.pojo.Doctor;
import com.qut.pojo.DoctorCode;
/**
 * 医生dao
 */
@Repository("doctorMapper")
public interface DoctorMapper {
	/**
	 * 医生信息的保存
	 * @param doctor
	 */
	void doctorSave(Doctor doctor);
	/**
	 * 医生信息的查询
	 * @param doctorCode
	 * @return
	 */
	List<Doctor> doctorQuery(DoctorCode doctorCode);
	/**
	 * 删除医生信息
	 * @param id
	 */
	void doctorDelete(@Param("id") Integer id);
	/**
	 * 更新医生信息
	 * @param doctor
	 */
	void updateDoctorMessage(Doctor doctor);
	/**
	 * 医生查询
	 */
	Doctor doctorById(@Param("id") Integer id);
}
