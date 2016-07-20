/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.basis.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.zlwh.hands.admin.modules.basis.entity.CArticle;
import com.zlwh.hands.admin.modules.basis.dao.CArticleDao;

/**
 * 单表生成Service
 * @author yuanjifeng
 * @version 2016-05-26
 */
@Service
@Transactional(readOnly = true)
public class CArticleService extends CrudService<CArticleDao, CArticle> {

	public CArticle get(String id) {
		CArticle article = new CArticle(id);
		return super.get(article);
	}
	
	public List<CArticle> findList(CArticle article) {
		return super.findList(article);
	}
	
	public Page<CArticle> findPage(Page<CArticle> page, CArticle article) {
		return super.findPage(page, article);
	}
	
	@Transactional(readOnly = false)
	public void save(CArticle article) {
		super.save(article);
	}
	
	@Transactional(readOnly = false)
	public void delete(CArticle article) {
		super.delete(article);
	}
	
}