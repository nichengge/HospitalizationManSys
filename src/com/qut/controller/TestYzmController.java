package com.qut.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.qut.util.Log4jLogsDetial;
import com.qut.util.CheckCodeGen;
import com.qut.util.ImageYzmUtils;

@Controller
public class TestYzmController {
	Logger log = Logger.getLogger(Log4jLogsDetial.class);

	@RequestMapping("test01")
	protected void doPost(HttpServletRequest reqeust, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/jpeg");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		ImageYzmUtils instance = new ImageYzmUtils();
		Cookie cookie = new Cookie("scaptcha", instance.getCode());
		cookie.setMaxAge(1800);
		response.addCookie(cookie);
		instance.write(response.getOutputStream());
		log.info("验证码测试类");
	}

	@RequestMapping("image")
	@ResponseBody
	public void validateCodeImg(HttpServletRequest request, HttpServletResponse response) {
		CheckCodeGen code = new CheckCodeGen();
		code.getRandcode(request, response);
		log.info("得到随机数");
	}

}
