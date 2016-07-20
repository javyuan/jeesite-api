package com.zlwh.hands.api;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.security.Cryptos;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.Exceptions;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.zlwh.hands.admin.modules.basis.entity.CTelsms;
import com.zlwh.hands.admin.modules.basis.service.CTelsmsService;
import com.zlwh.hands.admin.modules.user.entity.CUser;
import com.zlwh.hands.admin.modules.user.service.CSessionService;
import com.zlwh.hands.admin.modules.user.service.CUserService;
import com.zlwh.hands.api.common.ApiResponse;
import com.zlwh.hands.api.common.BaseController;
import com.zlwh.hands.api.common.Constants;
import com.zlwh.hands.api.common.UserToken;
import com.zlwh.hands.api.common.annotation.RequiredLogin;
import com.zlwh.hands.api.common.exception.BusinessException;
import com.zlwh.hands.api.common.utils.TelUtil;
import com.zlwh.hands.api.common.utils.TokenUtils;
import com.zlwh.hands.api.domain.UserDomain;

@Controller
@RequestMapping(value = "api/1.0/user/")
public class CLoginController extends BaseController{
	
	@Autowired
	CUserService userService;
	@Autowired
	CTelsmsService cTelsmsService;
	@Autowired
	CSessionService sessionService;
	
	// 验证码超时时间
	private static final Long EXPIRE = 60 * 1000L;
	
	
	/**
	 * 获取UserToken
	 * 请求URL示例：http://localhost:8080/hands/api/1.0/user/getToken?sign=xxxxxxxxxxxxxxxxxxxxx
	 * sign = AES(PARAM_KEY + ":" + DEVICE_ID + ":" + TIMESTAMP)
	 * 防止该接口被恶意调用数据库频繁插入C_USER表
	 */
	@RequestMapping(value="getToken")
	@ResponseBody
	public ApiResponse getToken(UserDomain domain){
		if (checkSign(domain)) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_PARAM, "参数验证失败");
		}
		String encryptToken = userService.getGuestToken();
		return ApiResponse.successMessage("成功", encryptToken);
	}
	
	private boolean checkSign(UserDomain domain) {
		// sign已经使用过，返回错误
		if (CacheUtils.get("paramCache", domain.getSign()) != null) {
			return true;
		}
		String key = Global.getConfig("PARAM_KEY");
		String desSign = Cryptos.aesDecrypt(domain.getSign(),key);
		// sign解密失败，返回错误
		if (StringUtils.isEmpty(desSign)) {
			return true;
		}
		String[] array = desSign.split(":");
		// sign解密成功，但加密KEY不一致，返回错误
		if (!key.equals(array[0])) {
			return true;
		}
		// sign解密成功，但超时，返回错误(cache中的有效时间为10分钟，同一个sign超过10分钟会走到此逻辑)
		long requestTime = Long.parseLong(array[2]);
		if (System.currentTimeMillis() - requestTime > 10 * 60 * 1000) {
			return true;
		}
		// sign校验成功，放入缓存
		CacheUtils.put("paramCache", domain.getSign(), domain.getSign());
		return false;
	}

	/**
	 * 发送验证码
	 * 请求URL示例：http://localhost:8080/hands/api/1.0/user/sendSMS?mobile=185xxxxxxxx&sign=xxxxxxxxxxxxxxx
	 * sign的生成方式：MD5(${PARAM_KEY} + ${mobile})
	 * 目的：防止短信接口被恶意调用
	 * @param string
	 * @return
	 */
	@RequestMapping(value="sendSMS")
	@ResponseBody
	public ApiResponse sendSMS(String mobile, String sign) {
		if (checkExpire(mobile)){
			return ApiResponse.failMessage(Constants.ERRORCODE_AUTHENTICODE_TOO_FREQUENTLY, EXPIRE / 1000 + "秒内禁止重复发送短信");
		}
		if (checkMobile(mobile)) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_PHONE_NUM, "手机号码不合法");
		}
		if (checkSign(mobile, sign)) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_PARAM, "参数不合法");
		}
		try {
			String code = String.valueOf((int) (Math.random() * 10000));
			String zero = "";
			for (int i = 4; i > code.length(); i--) {
				zero = "0" + zero;
			}
			code = zero + code;
			if (TelUtil.sendSMS(mobile, code)) {
				CTelsms telsmsBean = new CTelsms();
				telsmsBean.setPhone(mobile);
				telsmsBean.setCode(code);
				cTelsmsService.save(telsmsBean);
				return ApiResponse.successMessage("成功", null);
			}else{
				return ApiResponse.failMessage("发送失败");
			}
		} catch (Exception e) {
			logger.error(Exceptions.getStackTraceAsString(e));
			return ApiResponse.failMessage("发送失败");
		}
	}

	/**
	 * 注册
	 * @param domain
	 * @return
	 */
	@RequestMapping(value="register")
	@ResponseBody
	public ApiResponse register(UserDomain domain, HttpServletRequest request) {
		if (checkMobile(domain.getUserName())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_PHONE_NUM, "手机号码不合法");
		}
		if (checkUserName(domain.getUserName())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_USER_EXIST, "帐号已存在");
		}
		if (checkPassword(domain.getPassword())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_SIMPLE_PASSWORD, "简单密码");
		}
		if (!cTelsmsService.validateCode(domain.getUserName(), domain.getCode())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_AUTHENTICODE, "验证码不正确");
		}
		if (checkDeviceType(domain.getDeviceType())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_DEVICE_TYPE, "设备类型错误");
		}
		try {
			domain.setRemoteIP(StringUtils.getRemoteAddr(request));
			String encryptToken = userService.registerUser(domain);//注册并登录
			return ApiResponse.successMessage("成功", encryptToken);
		} catch (Exception e) {
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}

	/**
	 * 登录
	 * @param domain
	 * @return
	 */
	@RequestMapping(value="login")
	@ResponseBody
	public ApiResponse login(UserDomain domain) {
		if (StringUtils.isAnyEmpty(domain.getUserName(), domain.getPassword())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_USERNAME_PASSWORD, "用户名或密码不能为空");
		}
		if (checkDeviceType(domain.getDeviceType())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_DEVICE_TYPE, "设备类型错误");
		}
		try {
			String encryptToken = userService.doLogin(domain);
			return ApiResponse.successMessage("成功", encryptToken);
		} catch (BusinessException e){
			return ApiResponse.failMessage(e.getCode(), e.getMessage());
		} catch (Exception e) {
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}

	/**
	 * 第三方登录
	 * 
	 * 客户端实现第三方认证逻辑，服务端拿到认证结果并进行保存
	 * 请求示例：http://localhost:8080/hands/api/1.0/user/thirdpartyLogin?thirdpartyId=xxxxxxxx&sign=xxxxxxxxxxxxxxx
	 * sign的生成方式：MD5(${PARAM_KEY} + ${ThirdpartyId})
	 * 防止被恶意登录
	 * @param domain
	 * @return
	 */
	@RequestMapping(value="thirdpartyLogin")
	@ResponseBody
	public ApiResponse thirdpartyLogin(UserDomain domain) {
		if (checkDeviceType(domain.getDeviceType())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_DEVICE_TYPE, "设备类型错误");
		}
		if (checkThirdpartyId(domain.getThirdpartyId())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_PARAM, "第三方ID不能为空");
		}
		if (checkSign(domain.getThirdpartyId(),domain.getSign())) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_PARAM, "Sign不合法");
		}
		try {
			String encryptToken = userService.thirdPartyLogin(domain);
			return ApiResponse.successMessage("成功", encryptToken);
		} catch (BusinessException e){
			return ApiResponse.failMessage(e.getCode(), e.getMessage());
		} catch (Exception e) {
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}

	/**
	 * 登出
	 * @param userToken
	 * @return
	 */
	@RequestMapping(value="logout")
	@ResponseBody
	@RequiredLogin
	public ApiResponse logout(UserDomain domain) {
		try{
			userService.doLogout(domain);
			return ApiResponse.successMessage("成功",null);
		} catch (Exception e) {
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}

	
	/**
	 * 修改手机号
	 * @param domain
	 * @return
	 */
	@RequestMapping(value="modifyPhone")
	@ResponseBody
	@RequiredLogin
	public ApiResponse modifyPhone(String phone, String code){
		if (!cTelsmsService.validateCode(phone, code)) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_AUTHENTICODE, "验证码不正确");
		}
		try {
			UserToken ut = TokenUtils.getCurrentToken();
			CUser user = userService.get(ut.getUserId());
			user.setLoginName(phone);
			user.setPhone(phone);
			userService.save(user);
			return ApiResponse.successMessage("成功",null);
		} catch (Exception e) {
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}
	
	/**
	 * 修改密码
	 * @param domain
	 * @return
	 */
	@RequestMapping(value="modifyPassword")
	@ResponseBody
	@RequiredLogin
	public ApiResponse modifyPassword(String newPassword){
		if (checkPassword(newPassword)) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_PARAM, "简单密码");
		}
		try {
			UserToken ut = TokenUtils.getCurrentToken();
			CUser user = new CUser(ut.getUserId());
			user.setPassword(new Md5Hash(newPassword).toHex().toUpperCase());
			userService.save(user);
			return ApiResponse.successMessage("成功",null);
		} catch (Exception e) {
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}
	
	/**
	 * 重置密码
	 * @param domain
	 * @return
	 */
	@RequestMapping(value="resetPassword")
	@ResponseBody
	public ApiResponse resetPassword(String phone, String code, String newPassword){
		if (checkPassword(newPassword)) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_PARAM, "简单密码");
		}
		if (!cTelsmsService.validateCode(phone, code)) {
			return ApiResponse.failMessage(Constants.ERRORCODE_INVALID_AUTHENTICODE, "验证码不正确");
		}
		try {
			CUser userBean = new CUser();
			userBean.setLoginName(phone);
			List<CUser> list = userService.findList(userBean);
			userBean = list.get(0);
			userBean.setPassword(new Md5Hash(newPassword).toHex().toUpperCase());
			userService.save(userBean);
			return ApiResponse.successMessage("成功",null);
		} catch (Exception e) {
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}
	
	private boolean checkThirdpartyId(String thirdpartyId) {
		if (StringUtils.isEmpty(thirdpartyId)) {
			return true;
		}
		return false;
	}
	
	private boolean checkSign(String data, String sign) {
		if (StringUtils.isEmpty(sign)) {
			return true;
		}
		if (!new Md5Hash(data,Global.getConfig("PARAM_KEY")).toHex().equalsIgnoreCase(sign)) {
			return true;
		}
		return false;
	}
	
	private boolean checkDeviceType(String deviceType) {
		if (StringUtils.isBlank(deviceType)
				|| StringUtils.inString(deviceType, Constants.DEVICE_TYPE_ANDROID, Constants.DEVICE_TYPE_ANDROID_PAD, Constants.DEVICE_TYPE_ANDROID_WATCH, Constants.DEVICE_TYPE_IPAD, Constants.DEVICE_TYPE_IPHONE, Constants.DEVICE_TYPE_IWATCH)) {
			return false;
		}
		return true;
	}
	
	private boolean checkPassword(String password) {
		if (StringUtils.isBlank(password)) {
			return true;
		}
		return false;
	}
	
	private boolean checkUserName(String userName) {
		if (StringUtils.isBlank(userName)) {
			return true;
		}
		CUser userBean = new CUser();
		userBean.setLoginName(userName);
		List<CUser> list = userService.findList(userBean);
		if (list.size() > 0) {
			return true;
		}
		return false;
	}
	
	private boolean checkExpire(String mobile) {
		if (StringUtils.isBlank(mobile)) {
			return true;
		}
		CTelsms telsmsBean = new CTelsms();
		telsmsBean.setPhone(mobile);
		telsmsBean.setDelFlag(CTelsms.DEL_FLAG_NORMAL);
		List<CTelsms> list = cTelsmsService.findList(telsmsBean);
		if (list != null && list.size() > 0) {
			Long lastSendDate = list.get(0).getCreateDate().getTime();
			if (new Date().getTime() - lastSendDate < EXPIRE) {
				return true;
			}
		}
		return false;
	}

	private boolean checkMobile(String mobile) {
		if (StringUtils.isBlank(mobile) || mobile.length() != 11 || TelUtil.TELNUM.indexOf(mobile.substring(0, 3)) == -1) {
			return true;
		}
		return false;
	}
}