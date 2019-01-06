package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 病房调价表
 * @author minchao
 */
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer type;
	private String name;
	private Float price;
	private Date updateTime;

	public Category() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", type=" + type + ", name=" + name + ", price=" + price + ", updateTime="
				+ updateTime + "]";
	}

}
