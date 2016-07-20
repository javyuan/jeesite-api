/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.user.service;

import java.util.Date;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.zlwh.hands.admin.modules.user.dao.CUserDao;
import com.zlwh.hands.admin.modules.user.entity.CSession;
import com.zlwh.hands.admin.modules.user.entity.CUser;
import com.zlwh.hands.api.common.Constants;
import com.zlwh.hands.api.common.UserToken;
import com.zlwh.hands.api.common.exception.BusinessException;
import com.zlwh.hands.api.common.utils.TokenUtils;
import com.zlwh.hands.api.domain.UserDomain;

/**
 * 客户端用户Service
 * @author yuanjifeng
 * @version 2016-05-26
 */
@Service
@Transactional(readOnly = true)
public class CUserService extends CrudService<CUserDao, CUser> {
	
	@Autowired
	CSessionService sessionService;
	
	public CUser get(String id) {
		return super.get(new CUser(id));
	}
	
	public List<CUser> findList(CUser cUser) {
		return super.findList(cUser);
	}
	
	public Page<CUser> findPage(Page<CUser> page, CUser cUser) {
		return super.findPage(page, cUser);
	}
	
	@Transactional(readOnly = false)
	public void save(CUser cUser) {
		super.save(cUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(CUser cUser) {
		super.delete(cUser);
	}
	
	/**
	 * 查询用户是否被冻结
	 * @param userId
	 * @return
	 */
	public boolean isLock(String userId){
		CUser user = this.get(userId);
		return Constants.USER_STATUS_LOCK.equals(user.getStatus());
	}
	
	// 用户登录
	@Transactional(readOnly = false)
	public String doLogin(UserDomain domain) throws BusinessException {
		CUser userBean = new CUser();
		userBean.setLoginName(domain.getUserName());
		userBean.setPassword(new Md5Hash(domain.getPassword()).toHex());
		List<CUser> userList = findList(userBean);
		if (userList == null || userList.size() == 0) {
			throw new BusinessException(Constants.ERRORCODE_INVALID_USERNAME_PASSWORD,"用户名或密码不正确");
		}
		if (userList.get(0).getStatus().equals(Constants.USER_STATUS_LOCK)) {
			throw new BusinessException(Constants.ERRORCODE_USER_LOCKED,"用户被冻结");
		}
		String currentSessionId = doSessioon(domain, userList.get(0).getId());
		// 创建Token
		String token = TokenUtils.encryptToken(new UserToken(userList.get(0).getId(), currentSessionId, userList.get(0).getUserType(), userList.get(0).getLoginName(), System.currentTimeMillis()));
		return token;
	}
	
	/**
	 * 创建Session
	 * @param domain
	 * @param userId
	 * @return
	 */
	@Transactional(readOnly = false)
	private String doSessioon(UserDomain domain, String userId){
		// 创建session
		String currentSessionId = IdGen.uuid();
		CSession sessionBean = new CSession();
		sessionBean.setUserId(userId);
		sessionBean.setId(currentSessionId);
		sessionBean.setIsNewRecord(true);
		sessionBean.setDeviceType(domain.getDeviceType());
		sessionBean.setLoginIp(domain.getRemoteIP());
		sessionBean.setLoginDate(new Date());
		sessionBean.setStatus(Constants.SESSION_STATUS_LOGIN);
		sessionService.save(sessionBean);
		// 同一种设备类型只允许一个用户登录
		sessionBean = new CSession();
		sessionBean.setUserId(userId);
		sessionBean.setDeviceType(domain.getDeviceType());
		sessionBean.setStatus(Constants.SESSION_STATUS_LOGIN);
		List<CSession> sessionList = sessionService.findList(sessionBean);
		if (sessionList.size() > 1) {
			for (int i = 0; i < sessionList.size(); i++) {
				CSession s = sessionList.get(i);
				if (currentSessionId.equals(s.getId())) {
					continue;
				}
				s.setStatus(Constants.SESSION_STATUS_KICKOUT);
				sessionService.save(s);
			}
		}
		return currentSessionId;
	}
	
	// 注册新用户（且登录）
	@Transactional(readOnly = false)
	public String registerUser(UserDomain domain) {
		CUser userBean = new CUser();
		userBean.setId(IdGen.uuid());
		userBean.setIsNewRecord(true);
		if (Constants.USER_TYPE_GUEST.equals(TokenUtils.getCurrentToken().getUserType())) {
			userBean.setId(TokenUtils.getCurrentToken().getUserId());
			userBean.setIsNewRecord(false);
		}
		userBean.setLoginName(domain.getUserName());
		userBean.setPassword(new Md5Hash(domain.getPassword()).toHex().toUpperCase());
		userBean.setDeviceType(domain.getDeviceType());
		userBean.setUserType(Constants.USER_TYPE_USER);
		userBean.setPhone(domain.getUserName());
		userBean.setNickName("会员");
		this.save(userBean);
		String sessionId = doSessioon(domain, userBean.getId());
		return TokenUtils.encryptToken(new UserToken(userBean.getId(), sessionId, userBean.getUserType(), userBean.getLoginName(), System.currentTimeMillis()));
	}
	
	/**
	 * 第三方登录
	 * @throws BusinessException 
	 */
	@Transactional(readOnly = false)
	public String thirdPartyLogin(UserDomain domain) throws BusinessException {
		String sessionId = "";
		CUser userBean = new CUser();
		userBean.setOpenId(domain.getThirdpartyId());
		userBean.setDelFlag(CUser.DEL_FLAG_NORMAL);
		List<CUser> userList = this.findList(userBean);
		//新帐号
		if (userList == null || userList.size() < 1) {
			if (Constants.USER_TYPE_GUEST.equals(TokenUtils.getCurrentToken().getUserType())) {
				userBean.setId(TokenUtils.getCurrentToken().getUserId());
				userBean.setIsNewRecord(false);
			}else{
				userBean.setId(IdGen.uuid());
				userBean.setIsNewRecord(true);
			}
			userBean.setUserType(Constants.USER_TYPE_THIRDPARTY);
			userBean.setDeviceType(domain.getDeviceType());
			userBean.setNickName("会员");
			this.save(userBean);
			sessionId = doSessioon(domain, userBean.getId());
			return TokenUtils.encryptToken(new UserToken(userBean.getId(), sessionId, userBean.getUserType(), System.currentTimeMillis()));
		}else{
		//老账号
			if (userList.get(0).getStatus().equals(Constants.USER_STATUS_LOCK)) {
				throw new BusinessException(Constants.ERRORCODE_USER_LOCKED,"用户被冻结");
			}
			sessionId = doSessioon(domain, userList.get(0).getId());
			return TokenUtils.encryptToken(new UserToken(userList.get(0).getId(), sessionId, userList.get(0).getUserType(), System.currentTimeMillis()));
		}
	}

	/**
	 * 生成匿名访客Token
	 * @return
	 */
	@Transactional(readOnly = false)
	public String getGuestToken() {
		CUser userBean = new CUser();
		userBean.setIsNewRecord(true);
		String userId = IdGen.uuid();
		userBean.setId(userId);
		userBean.setUserType(Constants.USER_TYPE_GUEST);
		userBean.setNickName("访客");
		this.save(userBean);
		return TokenUtils.encryptToken(new UserToken(userId, null, Constants.USER_TYPE_GUEST, null, null));
	}

	/**
	 * 退出
	 * @param domain
	 */
	@Transactional(readOnly = false)
	public void doLogout(UserDomain domain) {
		UserToken ut = TokenUtils.getCurrentToken();
		if (Constants.USER_TYPE_THIRDPARTY.equals(ut.getUserType()) || Constants.USER_TYPE_USER.equals(ut.getUserType())) {
			CSession sessionBean = new CSession();
			sessionBean = sessionService.get(ut.getSessionId());
			if (sessionBean != null) {
				sessionBean.setStatus(Constants.SESSION_STATUS_LOGOUT);
				sessionBean.setLogoutDate(new Date());
				sessionService.save(sessionBean);
			}
		}
	}
}