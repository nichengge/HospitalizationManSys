package com.qut.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.qut.pojo.Category;

@Repository("categoryMapper")
public interface CategoryMapper {
	/**
	 * 病房类型的查询
	 */
	List<Category> categoryQuery(Category category);

	/**
	 * 更新病房类型的价格
	 */
	void categoryUpdate(Category category);
}
