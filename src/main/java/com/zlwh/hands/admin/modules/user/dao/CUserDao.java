/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.user.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.zlwh.hands.admin.modules.user.entity.CUser;

/**
 * 客户端用户DAO接口
 * @author yuanjifeng
 * @version 2016-05-26
 */
@MyBatisDao
public interface CUserDao extends CrudDao<CUser> {

	int getInterestCount(String userId);

}