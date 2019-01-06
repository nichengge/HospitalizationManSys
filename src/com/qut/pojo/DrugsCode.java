package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 药品的封装类
 * @author minchao
 *
 */
public class DrugsCode implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private Date rkStart;
	private Date rkEnd;
	private Date bzStart;
	private Date bzEnd;
	
	public DrugsCode(){
		
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

	public Date getRkStart() {
		return rkStart;
	}

	public void setRkStart(Date rkStart) {
		this.rkStart = rkStart;
	}

	public Date getRkEnd() {
		return rkEnd;
	}

	public void setRkEnd(Date rkEnd) {
		this.rkEnd = rkEnd;
	}

	public Date getBzStart() {
		return bzStart;
	}

	public void setBzStart(Date bzStart) {
		this.bzStart = bzStart;
	}

	public Date getBzEnd() {
		return bzEnd;
	}

	public void setBzEnd(Date bzEnd) {
		this.bzEnd = bzEnd;
	}
	
	@Override
	public String toString() {
		return "DrugsCode [id=" + id + ", name=" + name + ", rkStart=" + rkStart + ", rkEnd=" + rkEnd + ", bzStart="
				+ bzStart + ", bzEnd=" + bzEnd + "]";
	}
}
