/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.user.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 客户端用户Entity
 * @author yuanjifeng
 * @version 2016-05-26
 */
public class CUser extends DataEntity<CUser> {
	
	private static final long serialVersionUID = 1L;
	private String loginName;		// 登录名
	private String deviceType;      // 设备类型
	private String deviceId;		// 设备ID
	private String openId;		    // 第三方ID
	private String realName;		// 用户名
	private String nickName;		// 昵称
	private String imageUrl;		// 用户头像url
	private String sex;				// 默认男性
	private String phone;			// 手机号码
	private String password;		// 密码
	private String jf; 				// 积分
	private String status;			// 启用?
	private String userType;		// 用户分类
	
	public CUser() {
		super();
	}

	public CUser(String id){
		super(id);
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJf() {
		return jf;
	}

	public void setJf(String jf) {
		this.jf = jf;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}