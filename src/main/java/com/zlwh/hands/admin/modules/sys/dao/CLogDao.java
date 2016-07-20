/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.zlwh.hands.admin.modules.sys.entity.CLog;

/**
 * 客户端日志DAO接口
 * @author yuanjifeng
 * @version 2016-06-07
 */
@MyBatisDao
public interface CLogDao extends CrudDao<CLog> {
	
}