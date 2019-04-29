package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String password;
	private String phone;
	private Integer describe; 
	private Date createtime; 
	
	public User(){
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getDescribe() {
		return describe;
	}

	public void setDescribe(Integer describe) {
		this.describe = describe;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Override
	public String toString() {
		return "id=" + id + ", name=" + name + ", password=" + password + ", phone=" + phone + ", describe=" + describe+",createtime"+createtime;
	}
}
