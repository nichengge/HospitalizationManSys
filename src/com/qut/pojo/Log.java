package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 日志系统pojo
 */
public class Log implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String type;
	private Date startTime;
	private Date endTime;
	private String detial;
	private String create_time;
	
	public Log() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getDetial() {
		return detial;
	}

	public void setDetial(String detial) {
		this.detial = detial;
	}

	@Override
	public String toString() {
		return "Logs [id=" + id + ", create_time=" + create_time + ", type=" + type + ", detial" + detial + "]";
	}
}
