/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.basis.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 短信验证码Entity
 * @author yuanjifeng
 * @version 2016-07-15
 */
public class CTelsms extends DataEntity<CTelsms> {
	
	private static final long serialVersionUID = 1L;
	private String phone;		// phone
	private String type;		// 0:注册1:找回密码
	private String code;		// code
	private String userId;			// user_id
	
	public CTelsms() {
		super();
	}

	public CTelsms(String id){
		super(id);
	}

	@Length(min=0, max=15, message="phone长度必须介于 0 和 15 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=1, message="0:注册1:找回密码长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=10, message="code长度必须介于 0 和 10 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}