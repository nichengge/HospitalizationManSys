package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 预交费用表
 * @author minchao
 */
public class Cost implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String patientId;
	private Float account;
	private String type;
	private String userId;
	private Date costTime;

	public Cost() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public Float getAccount() {
		return account;
	}

	public void setAccount(Float account) {
		this.account = account;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getCostTime() {
		return costTime;
	}

	public void setCostTime(Date costTime) {
		this.costTime = costTime;
	}

	@Override
	public String toString() {
		return "Cost [id=" + id + ", patientId=" + patientId + ", account=" + account + ", type=" + type + ", userId="
				+ userId + ", costTime=" + costTime + "]";
	}
}
