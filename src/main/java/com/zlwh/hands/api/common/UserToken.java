package com.zlwh.hands.api.common;

import java.io.Serializable;

public class UserToken implements Serializable{

	private static final long serialVersionUID = -2910636802113452789L;
	private String userId;
	private String sessionId;
	private String userType;
	private String loginName;
	private Long loginTime;
	
	public UserToken(String userId,String sessionId,String userType,String loginName,Long loginTime) {
		this.userId = userId;
		this.sessionId = sessionId;
		this.userType = userType;
		this.loginName = loginName;
		this.loginTime = loginTime;
	}
	
	public UserToken(String userId,String userType) {
		this(userId,null,userType,null,null);
	}
	
	public UserToken(String userId,String sessionId,String userType,Long loginTime) {
		this(userId,sessionId,userType,null,loginTime);
	}

	public String getUserId() {
		return userId;
	}

	public String getSessionId() {
		return sessionId;
	}

	public String getUserType() {
		return userType;
	}

	public String getLoginName() {
		return loginName;
	}

	public Long getLoginTime() {
		return loginTime;
	}
}
