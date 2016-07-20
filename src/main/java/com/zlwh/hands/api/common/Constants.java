package com.zlwh.hands.api.common;

public class Constants {
	
	//用户类型
	public static final String USER_TYPE_GUEST = "0";
	public static final String USER_TYPE_USER = "1";
	public static final String USER_TYPE_THIRDPARTY = "2";
	
	//用户状态
	public static final String USER_STATUS_NORMAL = "0";
	public static final String USER_STATUS_LOCK = "1";
	
	//会话状态
	public static final String SESSION_STATUS_LOGIN = "0";
	public static final String SESSION_STATUS_LOGOUT = "1";
	public static final String SESSION_STATUS_KICKOUT = "2";
	public static final String SESSION_STATUS_EXPIRE = "3";
	
	//设备类型
	public static final String DEVICE_TYPE_IPHONE = "0";
	public static final String DEVICE_TYPE_IPAD = "1";
	public static final String DEVICE_TYPE_IWATCH = "2";
	public static final String DEVICE_TYPE_ANDROID = "5";
	public static final String DEVICE_TYPE_ANDROID_PAD = "6";
	public static final String DEVICE_TYPE_ANDROID_WATCH = "7";
	
	//错误码
	public static final String ERRORCODE_INVALID_PARAM = "1000";
	public static final String ERRORCODE_AUTHENTICODE_TOO_FREQUENTLY = "1001";
	public static final String ERRORCODE_INVALID_PHONE_NUM = "1002";
	public static final String ERRORCODE_USER_EXIST = "1003";
	public static final String ERRORCODE_SIMPLE_PASSWORD = "1004";
	public static final String ERRORCODE_INVALID_AUTHENTICODE = "1005";
	public static final String ERRORCODE_INVALID_DEVICE_TYPE = "1006";
	public static final String ERRORCODE_INVALID_USERNAME_PASSWORD = "1007";
	public static final String ERRORCODE_USER_LOCKED = "1008";
	public static final String ERRORCODE_INVALID_TOKEN = "1009";
	public static final String ERRORCODE_NOT_LOGIN = "1010";
	public static final String ERRORCODE_SESSION_KICKOUT = "1011";
	public static final String ERRORCODE_SESSION_LOGOUT = "1012";
	public static final String ERRORCODE_SESSION_EXPIRE = "1013";
	
}
