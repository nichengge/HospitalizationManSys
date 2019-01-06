package com.qut.controller;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Category;
import com.qut.service.CategoryService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonDateValueProcessor;
import com.qut.util.JsonResult;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Resource(name = "categoryService")
	private CategoryService categoryService;

	@RequestMapping(value = "/categoryQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String categoryQuery() {
		List<Category> list = categoryService.categoryQuery(new Category());
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-MM-dd"));
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Category>>(list), jc);
		return json.toString();
	}

	@RequestMapping(value = "/categoryUpdate.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String categoryUpdate(HttpServletRequest request, HttpServletResponse response) {
		Integer total = BaseUtils.toInteger(request.getParameter("total"));
		for (int i = 0; i < total; i++) {
			Integer id = BaseUtils.toInteger(request.getParameter("id" + i));
			Float updatePrice = BaseUtils.toFloat(request.getParameter("updatePrice" + i));
			Category category = new Category();
			if (updatePrice != 0) {
				category.setId(id);
				category.setPrice(updatePrice);
				categoryService.categoryUpdate(category);
			}
		}
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-MM-dd"));
		JSON json = JSONSerializer.toJSON(new JsonResult<Category>(new Category()), jc);
		return json.toString();
	}
}
