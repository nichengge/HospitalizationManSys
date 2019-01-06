package com.qut.pojo;

import java.io.Serializable;
/**
 * 药品库存表
 * @author minchao
 *
 */
public class Stock implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String drugsId;
	private String drugsName;
	private Float price;
	private Integer account;
	public Stock(){
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDrugsId() {
		return drugsId;
	}

	public void setDrugsId(String drugsId) {
		this.drugsId = drugsId;
	}

	public String getDrugsName() {
		return drugsName;
	}

	public void setDrugsName(String drugsName) {
		this.drugsName = drugsName;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getAccount() {
		return account;
	}

	public void setAccount(Integer account) {
		this.account = account;
	}
	
	@Override
	public String toString() {
		return "Stock [id=" + id + ", drugsId=" + drugsId + ", drugsName=" + drugsName + ", price=" + price
				+ ", account=" + account + "]";
	}

}
