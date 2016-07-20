/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.zlwh.hands.admin.modules.sys.entity.SysSequence;
import com.zlwh.hands.admin.modules.sys.dao.SysSequenceDao;

/**
 * 数据库序列Service
 * @author yuanjifeng
 * @version 2016-06-07
 */
@Service
@Transactional(readOnly = true)
public class SysSequenceService extends CrudService<SysSequenceDao, SysSequence> {
	
	private static final String DEFAULT_NAME = "default";

	public SysSequence get(String id) {
		return super.get(id);
	}
	
	public List<SysSequence> findList(SysSequence sysSequence) {
		return super.findList(sysSequence);
	}
	
	public Page<SysSequence> findPage(Page<SysSequence> page, SysSequence sysSequence) {
		return super.findPage(page, sysSequence);
	}
	
	@Transactional(readOnly = false)
	public void save(SysSequence sysSequence) {
		super.save(sysSequence);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysSequence sysSequence) {
		super.delete(sysSequence);
	}

	public String getNextVal(String name) {
		SysSequence sysSequence = new SysSequence();
		sysSequence.setName(name);
		return dao.getNextVal(sysSequence);
	}
	
	public String getNextVal() {
		return getNextVal(DEFAULT_NAME);
	}
	
	public String getCurrentVal(String name){
		SysSequence sysSequence = new SysSequence();
		sysSequence.setName(name);
		return dao.getCurrentVal(sysSequence);
	}
	
	public String getCurrentVal(){
		return getCurrentVal(DEFAULT_NAME);
	}
}