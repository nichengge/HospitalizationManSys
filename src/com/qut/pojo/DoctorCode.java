package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 医生封装类
 */
public class DoctorCode implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private Date startTime;
	private Date endTime;
	private Integer title;
	private Integer department;
	private Integer state;

	public DoctorCode() {
	}

	public String getName() {
		return name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getTitle() {
		return title;
	}

	public void setTitle(Integer title) {
		this.title = title;
	}

	public Integer getDepartment() {
		return department;
	}

	public void setDepartment(Integer department) {
		this.department = department;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}
