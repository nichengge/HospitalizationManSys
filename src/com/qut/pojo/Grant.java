package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 退药处理表
 */
public class Grant implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String drugId;
	private String drugName;
	private Float drugPrice;
	private Integer drugCount;
	private String patientId;
	private String patientName;
	private String grantUserId;
	private String grantUserName;
	private Date grantTime;

	public Grant() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDrugId() {
		return drugId;
	}

	public void setDrugId(String drugId) {
		this.drugId = drugId;
	}

	public String getDrugName() {
		return drugName;
	}

	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}

	public Float getDrugPrice() {
		return drugPrice;
	}

	public void setDrugPrice(Float drugPrice) {
		this.drugPrice = drugPrice;
	}

	public Integer getDrugCount() {
		return drugCount;
	}

	public void setDrugCount(Integer drugCount) {
		this.drugCount = drugCount;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getGrantUserId() {
		return grantUserId;
	}

	public void setGrantUserId(String grantUserId) {
		this.grantUserId = grantUserId;
	}

	public String getGrantUserName() {
		return grantUserName;
	}

	public void setGrantUserName(String grantUserName) {
		this.grantUserName = grantUserName;
	}

	public Date getGrantTime() {
		return grantTime;
	}

	public void setGrantTime(Date grantTime) {
		this.grantTime = grantTime;
	}

	@Override
	public String toString() {
		return "Grant [id=" + id + ", drugId=" + drugId + ", drugName=" + drugName + ", drugPrice=" + drugPrice
				+ ", drugCount=" + drugCount + ", patientId=" + patientId + ", patientName=" + patientName
				+ ", grantUserId=" + grantUserId + ", grantUserName=" + grantUserName + ", grantTime=" + grantTime
				+ "]";
	}
}
