package com.qut.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	public MD5() {

	}

	public String to_md5(String pwd) {
		StringBuffer sb = new StringBuffer();// 密文
		String strsb = new String();// 字符串密文
		try {
			// 加密对象，指定加密方式
			MessageDigest md5 = MessageDigest.getInstance("md5");
			// 准备要加密的数据
			byte[] b = pwd.getBytes();
			// 加密
			byte[] digest = md5.digest(b);
			// 十六进制的字符
			char[] chars = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E',
					'F' };

			// 处理成十六进制的字符串(通常)
			for (byte bb : digest) {
				sb.append(chars[(bb >> 4) & 15]);
				sb.append(chars[bb & 15]);
			}
			// 打印加密后的字符串
			System.out.println(sb);
			// 转换成String
			strsb = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return strsb;
	}
}
