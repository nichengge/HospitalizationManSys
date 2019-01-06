package com.qut.pojo;

import java.io.Serializable;

/**
 * 参数表
 * @author minchao
 */
public class Parameter implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String code;
	private String name;
	private Integer value;

	public Parameter() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "Parameter [id=" + id + ", code=" + code + ", name=" + name + ", value=" + value + "]";
	}
}
