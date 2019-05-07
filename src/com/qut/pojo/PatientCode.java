package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 病人封装类
 *
 */
public class PatientCode implements Serializable {
	private static final long serialVersionUID = 1L;
	private String patientId;
	private Integer bedNo;
	private Integer departmentNo;
	private Integer wardNo;
	private Date start;
	private Date end;
	private String name;
	private Date outStart;
	private Date outEnd;
	private Integer outStatus;
	private Integer jsStatus;

	public PatientCode() {

	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public Integer getBedNo() {
		return bedNo;
	}

	public void setBedNo(Integer bedNo) {
		this.bedNo = bedNo;
	}

	public Integer getDepartmentNo() {
		return departmentNo;
	}

	public void setDepartmentNo(Integer departmentNo) {
		this.departmentNo = departmentNo;
	}

	public Integer getWardNo() {
		return wardNo;
	}

	public void setWardNo(Integer wardNo) {
		this.wardNo = wardNo;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getOutStart() {
		return outStart;
	}

	public void setOutStart(Date outStart) {
		this.outStart = outStart;
	}

	public Date getOutEnd() {
		return outEnd;
	}

	public void setOutEnd(Date outEnd) {
		this.outEnd = outEnd;
	}

	public Integer getOutStatus() {
		return outStatus;
	}

	public void setOutStatus(Integer outStatus) {
		this.outStatus = outStatus;
	}

	public Integer getJsStatus() {
		return jsStatus;
	}

	public void setJsStatus(Integer jsStatus) {
		this.jsStatus = jsStatus;
	}

	@Override
	public String toString() {
		return "PatientCode [patientId=" + patientId + ", bedNo=" + bedNo + ", departmentNo=" + departmentNo
				+ ", wardNo=" + wardNo + ", start=" + start + ", end=" + end + ", name=" + name + ", outStart="
				+ outStart + ", outEnd=" + outEnd + ", outStatus=" + outStatus + ", jsStatus=" + jsStatus + "]";
	}
}
