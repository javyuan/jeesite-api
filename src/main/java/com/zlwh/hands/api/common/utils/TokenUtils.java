package com.zlwh.hands.api.common.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thinkgem.jeesite.common.security.Cryptos;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.zlwh.hands.api.common.Constants;
import com.zlwh.hands.api.common.UserToken;

/**
 * 
 * UserToken工具类
 * 
 * 用户第一次访问时创建Token，该用户被标识为匿名用户
 * 用户登录时生成新的Token，该用户被标识为登录用户
 * 
 * @author yuanjifeng
 *
 */
public class TokenUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(TokenUtils.class);
	
	private static final String ENCRYPT_KEY = "59FF4BEDF5155319CE6F39815653C60A";
	private static final String SEPARATE = ":";
	private static final String SESSION_KEY = "CUSERTOKEN";

	/**
	 * 加密Token
	 * ${userId}:${sessionId}:${userType}:${loginName}:${loginTime}
	 * 
	 */
	public static String encryptToken(UserToken ut) {
		if (StringUtils.isEmpty(ut.getUserId()) || StringUtils.isEmpty(ut.getUserType())) {
			logger.error("userId:"+ut.getUserId()+",userType:"+ut.getUserType());
			return null;
		}
		StringBuilder tokenStr = new StringBuilder();
		tokenStr.append(ut.getUserId());
		tokenStr.append(SEPARATE);
		tokenStr.append(ut.getSessionId() == null ? "":ut.getSessionId());
		tokenStr.append(SEPARATE);
		tokenStr.append(ut.getUserType());
		tokenStr.append(SEPARATE);
		tokenStr.append(ut.getLoginName() == null ? "":ut.getLoginName());
		tokenStr.append(SEPARATE);
		tokenStr.append(ut.getLoginTime() == null ? "":ut.getLoginTime());
		logger.info("original token string :"+tokenStr);
		return Cryptos.aesEncrypt(tokenStr.toString(), ENCRYPT_KEY);
	}
	
	/**
	 * 解密Token
	 */
	public static UserToken decryptToken(String encrypt) {
		if (encrypt == null) {
			return null;
		}
		String[] tmpArray = null;
		try {
			String tokenStr = Cryptos.aesDecrypt(encrypt, ENCRYPT_KEY);
			tmpArray = tokenStr.split(SEPARATE);
		} catch (Exception e) {
			return null;
		}
		String userType = tmpArray[2];
		if (Constants.USER_TYPE_GUEST.equals(userType)) {
			return new UserToken(tmpArray[0], tmpArray[2]);
		}
		if (Constants.USER_TYPE_THIRDPARTY.equals(userType)) {
			return new UserToken(tmpArray[0], tmpArray[1], tmpArray[2], Long.parseLong(tmpArray[4]));
		}
		if (Constants.USER_TYPE_USER.equals(userType)) {
			return new UserToken(tmpArray[0], tmpArray[1], tmpArray[2], tmpArray[3], Long.parseLong(tmpArray[4]));
		}
		return null;
	}
	
	/**
	 * 获取Token
	 */
	public static UserToken getCurrentToken(){
		Session session = TokenUtils.getSession();
		return (UserToken)session.getAttribute(SESSION_KEY);
	}
	
	/**
	 * 保存Token
	 */
	public static void saveTokenToSession(UserToken token){
		Session session = TokenUtils.getSession();
		session.setAttribute(SESSION_KEY, token);
	}
	
	/**
	 * 获取Shiro管理的Session
	 * @return
	 */
	private static Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			return subject.getSession(true);
		}catch (InvalidSessionException e){
		}
		return null;
	}
}
