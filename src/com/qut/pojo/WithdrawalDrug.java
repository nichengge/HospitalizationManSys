package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 病人退药封装类
 * @author minchao
 *
 */
public class WithdrawalDrug implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String patientId;
	private String patientName;
	private Integer count;
	private String userName;
	private String userId;
	private String drugsId;
	private Date entiyTime;
	private String reason;
	
	public  WithdrawalDrug(){
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDrugsId() {
		return drugsId;
	}

	public void setDrugsId(String drugsId) {
		this.drugsId = drugsId;
	}

	public Date getEntiyTime() {
		return entiyTime;
	}

	public void setEntiyTime(Date entiyTime) {
		this.entiyTime = entiyTime;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Override
	public String toString() {
		return "WithdrawalDrug [id=" + id + ", patientId=" + patientId + ", patientName=" + patientName + ", count="
				+ count + ", userName=" + userName + ", userId=" + userId + ", drugsId=" + drugsId + ", entiyTime="
				+ entiyTime + ", reason=" + reason + "]";
	}
}
