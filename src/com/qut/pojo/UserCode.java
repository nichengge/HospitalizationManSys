package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户封装类
 */
public class UserCode implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer describe;
	private String id;
	private Date startTime;
	private Date endTime;
	private String name;

	public UserCode() {

	}

	public Integer getDescribe() {
		return describe;
	}

	public void setDescribe(Integer describe) {
		this.describe = describe;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
