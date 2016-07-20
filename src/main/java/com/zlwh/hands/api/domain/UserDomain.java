package com.zlwh.hands.api.domain;

import com.zlwh.hands.api.domain.base.BaseDomain;

public class UserDomain extends BaseDomain{
	private String userName;		//用户名（手机号）
	private String password;		//密码
	private String code;			//验证码
	private String deviceType;		//设备类型
	private String thirdpartyId;	//第三方登录ID
	private String sign;			//签名字符串
	
	public String getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getThirdpartyId() {
		return thirdpartyId;
	}
	public void setThirdpartyId(String thirdpartyId) {
		this.thirdpartyId = thirdpartyId;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
}
