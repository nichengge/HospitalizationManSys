package com.qut.service;

import java.util.List;

import com.qut.pojo.Category;

public interface CategoryService {
	/**
	 * 查询病房类型
	 * 
	 * @param category
	 */
	List<Category> categoryQuery(Category category);

	/**
	 * 更新病房类型的价格
	 * 
	 * @param category
	 */
	void categoryUpdate(Category category);
}
