package com.qut.pojo;

import java.io.Serializable;
/**
 * 	下拉列表
 * @author minchao
 *
 */
public class Common implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer value;
	private String name;

	private Common() {

	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
