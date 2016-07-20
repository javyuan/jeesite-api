/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.basis.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.zlwh.hands.admin.modules.basis.dao.CTelsmsDao;
import com.zlwh.hands.admin.modules.basis.entity.CTelsms;

/**
 * 短信验证码Service
 * @author yuanjifeng
 * @version 2016-07-15
 */
@Service
@Transactional(readOnly = true)
public class CTelsmsService extends CrudService<CTelsmsDao, CTelsms> {

	public CTelsms get(String id) {
		return super.get(id);
	}
	
	public List<CTelsms> findList(CTelsms cTelsms) {
		return super.findList(cTelsms);
	}
	
	public Page<CTelsms> findPage(Page<CTelsms> page, CTelsms cTelsms) {
		return super.findPage(page, cTelsms);
	}
	
	@Transactional(readOnly = false)
	public void save(CTelsms cTelsms) {
		super.save(cTelsms);
	}
	
	@Transactional(readOnly = false)
	public void delete(CTelsms cTelsms) {
		super.delete(cTelsms);
	}

	/**
	 * 校验手机验证码
	 * @param mobile 手机号
	 * @param code 验证码
	 * @return true 校验成功
	 */
	@Transactional(readOnly = false)
	public boolean validateCode(String mobile, String code) {
		if (StringUtils.isAnyBlank(mobile,code)) {
			return false;
		}
		CTelsms telsmsBean = new CTelsms();
		telsmsBean.setPhone(mobile);
		telsmsBean.setCode(code);
		telsmsBean.setDelFlag(CTelsms.DEL_FLAG_NORMAL);
		List<CTelsms> list = this.findList(telsmsBean);
		if (list == null || list.size() == 0) {
			return false;
		}
		this.delete(list.get(0));
		return true;
	}
	
	
}