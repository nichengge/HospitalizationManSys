package com.qut.service;

import java.util.List;

import com.qut.pojo.User;
import com.qut.pojo.UserCode;
import com.qut.util.NameOrPasswordException;

/**
 * 用户的接口
 *
 */
public interface UserService {
	/**
	 * 用户的登录
	 */
	User login(String name, String password) throws NameOrPasswordException;

	/**
	 * 用户的注册
	 */
	void register(User user);

	/**
	 * 用户的查询
	 */
	User findUserById(String id);

	/**
	 * 用户的查询
	 */
	List<User> userQuery(UserCode userCode);

	/**
	 * 用户的删除
	 */
	void userDelete(String id);

	/**
	 * 修改密码
	 */
	void updateUser(User user);

	/**
	 * 更新用户信息
	 */
	void updateUserMessage(User user);
}
