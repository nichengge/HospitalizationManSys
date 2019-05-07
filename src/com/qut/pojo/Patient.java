package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 病人信息表
 */
public class Patient implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String patientId;
	private String name;
	private Integer gender;
	private Integer nation;
	private Date birth;
	private String cerificateNo;
	private String workUnit;
	private Integer maritalStatus;
	private Integer doctorId;
	private Date admissionTime;
	private String homeAddress;
	private String homePhone;
	private String contactsPhone;
	private String contacts;
	private Integer admissionStatus;
	private Integer roomNo;
	private Integer roomType;
	private Integer bedNo;
	private Integer state;
	private Integer department;
	private Integer settlementState;
	private Integer leaveState;
	private Date leaveTime;

	public Patient() {

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getNation() {
		return nation;
	}

	public void setNation(Integer nation) {
		this.nation = nation;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getCerificateNo() {
		return cerificateNo;
	}

	public void setCerificateNo(String cerificateNo) {
		this.cerificateNo = cerificateNo;
	}

	public String getWorkUnit() {
		return workUnit;
	}

	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}

	public Integer getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(Integer maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public Integer getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	public Date getAdmissionTime() {
		return admissionTime;
	}

	public void setAdmissionTime(Date admissionTime) {
		this.admissionTime = admissionTime;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public String getHomePhone() {
		return homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getContactsPhone() {
		return contactsPhone;
	}

	public void setContactsPhone(String contactsPhone) {
		this.contactsPhone = contactsPhone;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public Integer getAdmissionStatus() {
		return admissionStatus;
	}

	public void setAdmissionStatus(Integer admissionStatus) {
		this.admissionStatus = admissionStatus;
	}

	public Integer getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(Integer roomNo) {
		this.roomNo = roomNo;
	}

	public Integer getRoomType() {
		return roomType;
	}

	public void setRoomType(Integer roomType) {
		this.roomType = roomType;
	}

	public Integer getBedNo() {
		return bedNo;
	}

	public void setBedNo(Integer bedNo) {
		this.bedNo = bedNo;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getDepartment() {
		return department;
	}

	public void setDepartment(Integer department) {
		this.department = department;
	}

	public Integer getSettlementState() {
		return settlementState;
	}

	public void setSettlementState(Integer settlementState) {
		this.settlementState = settlementState;
	}

	public Integer getLeaveState() {
		return leaveState;
	}

	public void setLeaveState(Integer leaveState) {
		this.leaveState = leaveState;
	}

	public Date getLeaveTime() {
		return leaveTime;
	}

	public void setLeaveTime(Date leaveTime) {
		this.leaveTime = leaveTime;
	}

	@Override
	public String toString() {
		return "Patient [id=" + id + ", patientId=" + patientId + ", name=" + name + ", gender=" + gender + ", nation="
				+ nation + ", birth=" + birth + ", cerificateNo=" + cerificateNo + ", workUnit=" + workUnit
				+ ", maritalStatus=" + maritalStatus + ", doctorId=" + doctorId + ", admissionTime=" + admissionTime
				+ ", homeAddress=" + homeAddress + ", homePhone=" + homePhone + ", contactsPhone=" + contactsPhone
				+ ", contacts=" + contacts + ", admissionStatus=" + admissionStatus + ", roomNo=" + roomNo
				+ ", roomType=" + roomType + ", bedNo=" + bedNo + ", state=" + state + ", department=" + department
				+ ", settlementState=" + settlementState + ", leaveState=" + leaveState + ", leaveTime=" + leaveTime
				+ "]";
	}
}
