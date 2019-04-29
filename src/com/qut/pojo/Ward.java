package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

public class Ward implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer wardNo;
	private Integer departmentNo;
	private Integer type;
	private Integer wardSpace;//额定容量
	private Integer state;
	private Date createTime;

	public Ward() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getWardNo() {
		return wardNo;
	}

	public void setWardNo(Integer wardNo) {
		this.wardNo = wardNo;
	}

	public Integer getDepartmentNo() {
		return departmentNo;
	}

	public void setDepartmentNo(Integer departmentNo) {
		this.departmentNo = departmentNo;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	public Integer getwardSpace() {
		return wardSpace;
	}

	public void setwardSpace(Integer space) {
		this.wardSpace = space;
	}
	
	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Override
	public String toString() {
		return "Ward [id=" + id + ", wardNo=" + wardNo + ", departmentNo=" + departmentNo + ", type=" + type
				+ ", state=" + state + ",space=" + wardSpace + ", createTime=" + createTime + "]";
	}

}
