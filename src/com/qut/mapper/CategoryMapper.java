package com.qut.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.qut.pojo.Category;

@Repository("categoryMapper")
public interface CategoryMapper {
	/**
	 * 病房类型的查询
	 * @param category
	 * @return
	 */
	List<Category> categoryQuery(Category category);
	/**
	 * 更新病房类型的价格
	 * @param category
	 */
	void categoryUpdate(Category category);
}
