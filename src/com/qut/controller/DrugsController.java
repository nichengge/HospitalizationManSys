package com.qut.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qut.pojo.Drugs;
import com.qut.pojo.DrugsCode;
import com.qut.pojo.Grant;
import com.qut.pojo.Stock;
import com.qut.pojo.WithdrawalDrug;
import com.qut.pojo.grantDrugs;
import com.qut.service.DrugsService;
import com.qut.service.grantDrugsService;
import com.qut.util.BaseUtils;
import com.qut.util.JsonDateValueProcessor;
import com.qut.util.JsonResult;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/drugs")
public class DrugsController {
	@Resource(name = "drugsService")
	private DrugsService drugsService;
	@Resource(name = "grantDrugsService")
	private grantDrugsService grantdrugsService;

	@RequestMapping(value = "/drugsSave.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String drugsSave(HttpServletRequest request) throws ParseException {
		Drugs drugs = new Drugs();
		String drugsId = request.getParameter("drugsId");
		drugs.setDrugsid(drugsId);
		String name = request.getParameter("drugsName");
		drugs.setName(name);
		String creatTime = request.getParameter("inTime");
		drugs.setCreateTime(BaseUtils.toDate(creatTime));
		String manufacturer = request.getParameter("manufacturer");
		drugs.setManufacturer(manufacturer);
		Integer addNum = Integer.parseInt(request.getParameter("num"));
		drugs.setAddNum(addNum);
		Float price = Float.parseFloat(request.getParameter("price"));
		drugs.setPrice(price);
		String productionTime = request.getParameter("productionTime");
		drugs.setProduction_time(BaseUtils.toDate(productionTime));
		String supply = request.getParameter("supply");
		drugs.setSupply(supply);
		// 判断是否有空
		String years = request.getParameter("year");
		String days = request.getParameter("day");
		String mouths = request.getParameter("mouth");
		drugs.setValidityYear(BaseUtils.toIntegers(years));
		drugs.setValidityDay(BaseUtils.toIntegers(days));
		drugs.setValidityMouth(BaseUtils.toIntegers(mouths));

		// 根据保质期的年 月 日来计算出准确的到期日
		// 计算天数
		Integer addDays = drugs.getValidityYear() * 365 + drugs.getValidityMouth() * 30 + drugs.getValidityDay();
		// 得到到期日
		Date newDate = BaseUtils.toAddDate(drugs.getProduction_time(), addDays);
		drugs.setVilidityTime(newDate);
		// 执行增加操作
		drugsService.DrugsSave(drugs);
		// 增加其库存数量,判断库存中是否有这种药品
		Integer state = drugsService.drugsStockQueryById(drugs.getDrugsid());
		if (state == 1) {
			// 执行更新
			drugsService.drugsStockAdd(drugs);
		} else if (state == 0) {
			// 执行插入
			drugsService.drugsStockSave(drugs);
		}
		JSON json = JSONSerializer.toJSON(new JsonResult<Drugs>(drugs));
		return json.toString();
	}

	@RequestMapping(value = "/drugsFind.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String drugsFind(HttpServletRequest request) throws ParseException {
		DrugsCode drugsCode = new DrugsCode();
		String id = BaseUtils.toString(request.getParameter("drugsId"));
		String name = BaseUtils.toString(request.getParameter("drugsName"));
		if (!(id == null || "".equals(id))) {
			drugsCode.setId(id);
		}
		if (!(name == null || "".equals(name))) {
			drugsCode.setName(name);
		}
		drugsCode.setRkStart(BaseUtils.toDate(request.getParameter("rkStartTime")));
		drugsCode.setRkEnd(BaseUtils.toDate(request.getParameter("rkEndTime")));
		drugsCode.setBzStart(BaseUtils.toDate(request.getParameter("bzStartTime")));
		drugsCode.setBzEnd(BaseUtils.toDate(request.getParameter("bzEndTime")));
		List<Drugs> list = drugsService.drugsFind(drugsCode);
		JsonConfig jc = new JsonConfig();
		jc.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor("yyyy-MM-dd"));
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Drugs>>(list), jc);
		return json.toString();
	}

	@RequestMapping(value = "/stockQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String stockQuery(HttpServletRequest request) {
		String drugId = BaseUtils.toString(request.getParameter("drugsId"));
		String name = BaseUtils.toString(request.getParameter("drugsName"));
		DrugsCode drugsCode = new DrugsCode();
		drugsCode.setId(drugId);
		drugsCode.setName(name);
		List<Stock> list = drugsService.stockQuery(drugsCode);
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Stock>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/grantAdd.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String grantAdd(HttpServletRequest request) throws UnsupportedEncodingException {
		Grant grant = new Grant();
		grant.setDrugId(BaseUtils.toString(request.getParameter("drugsId")));
		grant.setDrugName(BaseUtils.toString(request.getParameter("drugsName")));
		grant.setDrugPrice(BaseUtils.toFloat(request.getParameter("price")));
		grant.setDrugCount(BaseUtils.toInteger(request.getParameter("num")));
		grant.setPatientId(BaseUtils.toString(request.getParameter("patientId")));
		grant.setPatientName(BaseUtils.toString(request.getParameter("patientName")));
		grant.setGrantUserId(BaseUtils.getUser(request).getId());
		grant.setGrantUserName(BaseUtils.getUser(request).getName());
		// 存入发放表grantDrug
		drugsService.grantAdd(grant);
		// 减少库存的量
		drugsService.stockUpdate(grant);
		JSON json = JSONSerializer.toJSON(new JsonResult<Grant>(grant));
		return json.toString();
	}

	@RequestMapping(value = "/grantQuery.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String grantQuery(@Param("patientId") String patientId) {
		List<Stock> list = drugsService.grantQuery(patientId);
		JSON json = JSONSerializer.toJSON(new JsonResult<List<Stock>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/grantDrugsFindByPatienId.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String grantDrugsFindByPatienId(HttpServletRequest request) throws ParseException {
		String patientId = BaseUtils.toString(request.getParameter("patientId"));
		List<grantDrugs> list = grantdrugsService.grantDrugsFindByPatienId(patientId);
		System.out.println("返回结果:" + list);
		JSON json = JSONSerializer.toJSON(new JsonResult<List<grantDrugs>>(list));
		return json.toString();
	}

	@RequestMapping(value = "/DrugWithdrawal.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public void DrugWithdrawal(@Param("patientId") String patientId, @Param("patientName") String patientName,
			@Param("count") Integer count, @Param("drugsId") String drugsId, @Param("reason") String reason,
			HttpServletRequest request) {
		WithdrawalDrug withdrawalDrug = new WithdrawalDrug();
		withdrawalDrug.setPatientId(patientId);
		withdrawalDrug.setPatientName(patientName);
		withdrawalDrug.setCount(count);
		withdrawalDrug.setReason(reason);
		withdrawalDrug.setDrugsId(drugsId);
		String userId = null;
		String userName = null;
		try {
			userId = BaseUtils.getUser(request).getId();
			userName = BaseUtils.getUser(request).getName();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		withdrawalDrug.setUserId(userId);
		withdrawalDrug.setUserName(userName);
		// 存入退药表中
		drugsService.DrugWithdrawal(withdrawalDrug);

		// 增加库存
		Grant grant = new Grant();
		grant.setDrugId(drugsId);
		grant.setDrugCount(-count);
		drugsService.stockUpdate(grant);
	}

}
