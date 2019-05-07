package com.qut.pojo;

import java.io.Serializable;

/*
 * 床号表封装类
 */
public class Bed implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer bedNo;
	private Integer wardNo;
	private Integer state;

	public Bed() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBedNo() {
		return bedNo;
	}

	public void setBedNo(Integer bedNo) {
		this.bedNo = bedNo;
	}

	public Integer getWardNo() {
		return wardNo;
	}

	public void setWardNo(Integer wardNo) {
		this.wardNo = wardNo;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Bed [id=" + id + ", wardNo=" + wardNo + ", bedNo=" + bedNo + ", state=" + state + "]";
	}

}
