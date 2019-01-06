package com.qut.service;

import java.util.List;

import com.qut.pojo.Doctor;
import com.qut.pojo.DoctorCode;

public interface DoctorService {
	/**
	 * 医生信息的保存
	 * 
	 * @param doctor
	 */
	void doctorSave(Doctor doctor);

	/**
	 * 医生信息的查询
	 * 
	 * @param doctorCode
	 * @return
	 */
	List<Doctor> doctorQuery(DoctorCode doctorCode);

	/**
	 * 删除医生信息
	 * 
	 * @param id
	 */
	void doctorDelete(Integer id);

	/**
	 * 更新医生信息
	 * 
	 * @param doctor
	 */
	void updateDoctorMessage(Doctor doctor);
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	Doctor doctorById(Integer id);
}
