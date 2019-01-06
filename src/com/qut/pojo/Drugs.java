	package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 药品表
 * @author minchao
 */
public class Drugs implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String drugsid;
	private String name;
	private String manufacturer;
	private Float price;
	private Integer validityYear;
	private Integer validityDay;
	private Integer validityMouth;
	private String supply;
	private Date createTime;
	private Integer addNum;
	private Date production_time;
	private Date vilidityTime;

	public Drugs() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDrugsid() {
		return drugsid;
	}

	public void setDrugsid(String drugsid) {
		this.drugsid = drugsid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getValidityYear() {
		return validityYear;
	}

	public void setValidityYear(Integer validityYear) {
		this.validityYear = validityYear;
	}

	public Integer getValidityDay() {
		return validityDay;
	}

	public void setValidityDay(Integer validityDay) {
		this.validityDay = validityDay;
	}

	public Integer getValidityMouth() {
		return validityMouth;
	}

	public void setValidityMouth(Integer validityMouth) {
		this.validityMouth = validityMouth;
	}

	public String getSupply() {
		return supply;
	}

	public void setSupply(String supply) {
		this.supply = supply;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getAddNum() {
		return addNum;
	}

	public void setAddNum(Integer addNum) {
		this.addNum = addNum;
	}

	public Date getProduction_time() {
		return production_time;
	}

	public void setProduction_time(Date production_time) {
		this.production_time = production_time;
	}

	public Date getVilidityTime() {
		return vilidityTime;
	}

	public void setVilidityTime(Date vilidityTime) {
		this.vilidityTime = vilidityTime;
	}
	
	@Override
	public String toString() {
		return "Drugs [id=" + id + ", drugsid=" + drugsid + ", name=" + name + ", manufacturer=" + manufacturer
				+ ", price=" + price + ", validityYear=" + validityYear + ", validityDay=" + validityDay
				+ ", validityMouth=" + validityMouth + ", supply=" + supply + ", createTime=" + createTime + ", addNum="
				+ addNum + ", production_time=" + production_time + ", vilidityTime=" + vilidityTime + "]";
	}
}
