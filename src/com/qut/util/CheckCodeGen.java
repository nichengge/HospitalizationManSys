package com.qut.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

/*验证码模块*/
public class CheckCodeGen implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final String RANDOMCODEKEY = "_CHECK_CODE";// 放到session中的key
	private Random random = new Random();
	private String randString = "23456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnprstuvwxy";// 随机产生的字符串

	private int width = 70;// 图片
	private int height = 24;// 图片
	private int lineSize = 28;// 干扰线数
	private int stringNum = 4;// 随机产生字符数量

	/**
	 * 获得字体
	 */
	private Font getFont() {
		return new Font("Fixedsys", Font.CENTER_BASELINE, 18);
	}

	/**
	 * 获得颜色
	 */
	private Color getRandColor(int fc, int bc) {
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc - 16);
		int g = fc + random.nextInt(bc - fc - 14);
		int b = fc + random.nextInt(bc - fc - 18);
		return new Color(r, g, b);
	}


	public boolean verifyCode(String codeStr, HttpServletRequest request, boolean clear) {
		if (StringUtils.isBlank(codeStr)) {
			return false;
		}
		HttpSession session = request.getSession();
		CheckCode code = (CheckCode) session.getAttribute(RANDOMCODEKEY);
		if (clear) // 清除验证
			cleanCode(session);
		if (code == null || !code.enable || StringUtils.isBlank(code.code)
				|| !code.code.equalsIgnoreCase(codeStr.trim())) {
			return false;
		}
		// 有效
		if ((System.currentTimeMillis() - code.createTime) > NumberUtils.toInt("10", 10) * 60 * 1000) {
			code.enable = false;
			return false;
		}
		return true;
	}

	/**
	 * 生成随机图片
	 */
	public String buildRandcode(HttpServletRequest request, OutputStream outStream) {
		HttpSession session = request.getSession();
		// BufferedImage类是具有缓冲区的Image�?Image类是用于描述图像信息的类
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		Graphics g = image.getGraphics();// 产生Image对象的Graphics对象,改对象可以在图像上进行各种绘制操�?
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman", Font.ROMAN_BASELINE, 25));
		g.setColor(getRandColor(110, 133));
		// 绘制干扰
		for (int i = 0; i <= lineSize; i++) {
			drowLine(g);
		}
		// 绘制随机字符
		String randomString = "";
		for (int i = 1; i <= stringNum; i++) {
			randomString = drowString(g, randomString, i);
		}
		cleanCode(session);

		// 验证
		CheckCode cc = new CheckCode();
		cc.code = randomString;
		cc.createTime = System.currentTimeMillis();
		cc.enable = true;

		session.setAttribute(RANDOMCODEKEY, cc);
		g.dispose();

		if (outStream != null) {
			try {
				ImageIO.write(image, "png", outStream);
			} catch (Exception e) {
			}
		}
		return randomString;
	}

	/**
	 * 生成随机图片
	 */
	public void getRandcode(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 设置响应的类型格式为图片格式
			response.setContentType("image/png");
			// 禁止图像缓存
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);

			buildRandcode(request, response.getOutputStream());
		} catch (IOException e) {

		}
	}

	/**
	 * 绘制字符
	 */
	private String drowString(Graphics g, String randomString, int i) {
		g.setFont(getFont());
		g.setColor(new Color(random.nextInt(101), random.nextInt(111), random.nextInt(121)));
		String rand = String.valueOf(getRandomString(random.nextInt(randString.length())));
		randomString += rand;
		g.translate(random.nextInt(3), random.nextInt(3));
		g.drawString(rand, 12 * i, 15);
		return randomString;
	}

	/**
	 * 绘制干扰
	 */
	private void drowLine(Graphics g) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		int xl = random.nextInt(13);
		int yl = random.nextInt(15);
		g.drawLine(x, y, x + xl, y + yl);
	}

	/**
	 * 清理验证
	 */
	public void cleanCode(HttpSession session) {
		session.setAttribute(RANDOMCODEKEY, "");
		session.removeAttribute(RANDOMCODEKEY);
	}

	/**
	 * 获取随机的字
	 */
	public String getRandomString(int num) {
		return String.valueOf(randString.charAt(num));
	}

	/**
	 * 获取随机的字
	 */
	class CheckCode implements Serializable {
		private static final long serialVersionUID = 1L;
		String code;
		long createTime;
		boolean enable;
	}
}