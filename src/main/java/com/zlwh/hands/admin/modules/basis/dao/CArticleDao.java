/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.basis.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.zlwh.hands.admin.modules.basis.entity.CArticle;

/**
 * 文章DAO接口
 * @author yuanjifeng
 * @version 2016-07-20
 */
@MyBatisDao
public interface CArticleDao extends CrudDao<CArticle> {
	
}