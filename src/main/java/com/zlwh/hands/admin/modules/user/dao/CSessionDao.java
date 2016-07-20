/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.user.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.zlwh.hands.admin.modules.user.entity.CSession;

/**
 * 单表生成DAO接口
 * @author yuanjifeng
 * @version 2016-05-30
 */
@MyBatisDao
public interface CSessionDao extends CrudDao<CSession> {
	
}