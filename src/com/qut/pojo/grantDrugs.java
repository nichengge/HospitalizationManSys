package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 药品派发表封装类
 *
 */
public class grantDrugs implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String drugId;
	private String drugName;
	private Float drugPrice;
	private Integer drugCount;
	private String patientName;
	private String patientId;
	private String grantUserId;
	private String grantUserName;
	private String grantTime;

	public grantDrugs() {

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

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
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

	public String getGrantTime() {
		return grantTime;
	}

	public void setGrantTime(String grantTime) {
		this.grantTime = grantTime;
	}

	@Override
	public String toString() {
		return "grantDrugs [id=" + id + ", drugId=" + drugId + ", drugName=" + drugName + ", drugPrice=" + drugPrice
				+ ", drugCount=" + drugCount + ", patientName= " + patientName + ", patientId= " + patientId
				+ ", grantUserId= " + grantUserId + ", grantUserName= " + grantUserName + ", grantTime" + grantTime
				+ "]";
	}

}
