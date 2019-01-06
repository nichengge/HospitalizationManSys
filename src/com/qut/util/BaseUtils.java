package com.qut.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.qut.pojo.User;

public class BaseUtils {
	/**
	 * 将字符串转换为date类型
	 */
	public static Date toDate(String time) throws ParseException {
		if (!(time == null || "".equals(time))) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date worktime = (java.util.Date) sdf.parse(time);
			java.util.Date utilDate = worktime;
			Date sqlDate = new Date(utilDate.getTime());
			return sqlDate;
		}
		return null;
	}

	/**
	 * 字符串转换为date类型YYYY-MM-dd HH:mm:ss
	 */
	public static Timestamp toDates(String time) throws ParseException {
		java.util.Date worktime = null;
		if (!(time == null || "".equals(time))) {
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
			sdf.setLenient(false);
			worktime = sdf.parse(time);
			return new Timestamp(worktime.getTime());
		}
		return null;
	}

	/**
	 * 将字符串转换为Integer,为空时返回null
	 */
	public static Integer toInteger(String string) {
		if (!(string == null || "".equals(string))) {
			Integer str = Integer.parseInt(string);
			return str;
		}
		return null;
	}

	/**
	 * 将字符串转换为Integer,为空时返回0
	 */
	public static Integer toIntegers(String string) {
		if (!(string == null || "".equals(string))) {
			Integer str = Integer.parseInt(string);
			return str;
		}
		return 0;
	}

	/**
	 * 字符串转浮点型
	 */
	public static Float toFloat(String string) {
		if (!(string == null || "".equals(string))) {
			Float str = Float.parseFloat(string);
			return str;
		}
		return 0.00f;
	}

	/**
	 * 为一个date增加天数后的日期
	 */
	@SuppressWarnings("static-access")
	public static Date toAddDate(Date date, Integer days) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(calendar.DATE, +days);
		// calendar的time转成java.util.Date格式日期
		java.util.Date utilDate = (java.util.Date) calendar.getTime();
		utilDate = (java.util.Date) calendar.getTime();
		// java.util.Date日期转换成转成java.sql.Date格式
		Date newDate = new Date(utilDate.getTime());
		return newDate;
	}

	/**
	 * 对字符串进行处理
	 */
	public static String toString(String str) {
		if (!(str == null || "".equals(str))) {
			return str.trim();
		}
		return null;
	}

	/**
	 * 得到当前用户信息
	 */
	public static User getUser(HttpServletRequest request) throws UnsupportedEncodingException {
		// 解析Cookie中的用户信息
		User user = new User();
		Cookie cookie[] = request.getCookies();
		if (cookie != null) {
			for (Cookie cookie2 : cookie) {
				if (cookie2.getName().equals("user")) {
					String value = cookie2.getValue();
					value = URLDecoder.decode(value, "utf-8");
					String[] userInfo = value.split("#");
					user.setId(userInfo[0]);
					user.setName(userInfo[1]);
				}
			}
		}
		return user;
	}

}
