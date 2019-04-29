package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 体征表
 * @author minchao
 */
public class Sign implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer signId;
	private String patientId;
	private String userId;
	private String userName;
	private Float temperature;
	private String bloodPressure;
	private Integer pulse;
	private Integer breathing;
	private Float bloodSugar;
	private Date measureTime;
	private Float vein;
	private Date createTime;
	private String remarks;
	
	public Sign(){
		
	}

	public Integer getSignId() {
		return signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Float getTemperature() {
		return temperature;
	}

	public void setTemperature(Float temperature) {
		this.temperature = temperature;
	}

	public String getBloodPressure() {
		return bloodPressure;
	}

	public void setBloodPressure(String bloodPressure) {
		this.bloodPressure = bloodPressure;
	}

	public Integer getPulse() {
		return pulse;
	}

	public void setPulse(Integer pulse) {
		this.pulse = pulse;
	}

	public Integer getBreathing() {
		return breathing;
	}

	public void setBreathing(Integer breathing) {
		this.breathing = breathing;
	}

	public Float getBloodSugar() {
		return bloodSugar;
	}

	public void setBloodSugar(Float bloodSugar) {
		this.bloodSugar = bloodSugar;
	}

	public Date getMeasureTime() {
		return measureTime;
	}

	public void setMeasureTime(Date measureTime) {
		this.measureTime = measureTime;
	}

	public Float getVein() {
		return vein;
	}

	public void setVein(Float vein) {
		this.vein = vein;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	@Override
	public String toString() {
		return "Sign [signId=" + signId + ", patientId=" + patientId + ", userId=" + userId + ", userName=" + userName
				+ ", temperature=" + temperature + ", bloodPressure=" + bloodPressure + ", pulse=" + pulse
				+ ", breathing=" + breathing + ", bloodSugar=" + bloodSugar + ", measureTime=" + measureTime + ", vein="
				+ vein + ", createTime=" + createTime + ", remarks=" + remarks + "]";
	}

}
