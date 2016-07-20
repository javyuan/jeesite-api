/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.zlwh.hands.admin.modules.user.entity.CSession;
import com.zlwh.hands.admin.modules.user.dao.CSessionDao;

/**
 * 客户端会话Service
 * @author yuanjifeng
 * @version 2016-05-30
 */
@Service
@Transactional(readOnly = true)
public class CSessionService extends CrudService<CSessionDao, CSession> {

	public CSession get(String id) {
		return super.get(id);
	}
	
	public List<CSession> findList(CSession cSession) {
		return super.findList(cSession);
	}
	
	public Page<CSession> findPage(Page<CSession> page, CSession cSession) {
		return super.findPage(page, cSession);
	}
	
	@Transactional(readOnly = false)
	public void save(CSession cSession) {
		super.save(cSession);
	}
	
	@Transactional(readOnly = false)
	public void delete(CSession cSession) {
		super.delete(cSession);
	}
	
}