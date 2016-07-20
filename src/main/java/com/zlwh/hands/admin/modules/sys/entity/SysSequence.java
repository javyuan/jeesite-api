/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 数据库序列Entity
 * @author yuanjifeng
 * @version 2016-06-07
 */
public class SysSequence extends DataEntity<SysSequence> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// name
	private String currentValue;		// current_value
	private String increment;		// increment
	
	public SysSequence() {
		super();
	}

	public SysSequence(String id){
		super(id);
	}

	@Length(min=1, max=128, message="name长度必须介于 1 和 128 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=11, message="current_value长度必须介于 1 和 11 之间")
	public String getCurrentValue() {
		return currentValue;
	}

	public void setCurrentValue(String currentValue) {
		this.currentValue = currentValue;
	}
	
	@Length(min=1, max=11, message="increment长度必须介于 1 和 11 之间")
	public String getIncrement() {
		return increment;
	}

	public void setIncrement(String increment) {
		this.increment = increment;
	}
	
}