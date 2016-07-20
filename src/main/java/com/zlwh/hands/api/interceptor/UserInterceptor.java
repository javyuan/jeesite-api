package com.zlwh.hands.api.interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.zlwh.hands.admin.modules.user.entity.CSession;
import com.zlwh.hands.admin.modules.user.service.CSessionService;
import com.zlwh.hands.admin.modules.user.service.CUserService;
import com.zlwh.hands.api.common.ApiResponse;
import com.zlwh.hands.api.common.Constants;
import com.zlwh.hands.api.common.UserToken;
import com.zlwh.hands.api.common.annotation.RequiredLogin;
import com.zlwh.hands.api.common.utils.TokenUtils;

/**
 * 登录状态校验拦截器
 * @author yuanjifeng
 * @version 2016-6-6
 */
public class UserInterceptor implements HandlerInterceptor {

	private static final long SESSION_EXPIRE = Long.MAX_VALUE * 1000;
	
	/**
	 * 只有2种情况可以访问资源
	 * 1、匿名用户访问匿名资源
	 * 2、登录用户访问所有资源
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String token = request.getParameter("token");
		if (StringUtils.isEmpty(token)) {
			write(response,Constants.ERRORCODE_INVALID_TOKEN,"token不能为空");
			return false;
		}
		UserToken ut = TokenUtils.decryptToken(token);
		if (ut == null) {
			write(response,Constants.ERRORCODE_INVALID_TOKEN,"token错误");
			return false;
		}
		// 保存解密后的token
		TokenUtils.saveTokenToSession(ut);
//		setRemoteIp(request, handler);
		// 如果访问的资源被@RequiredLogin标注，表示必须是登录用户才可以访问。
		if (isRequiredLogin(handler)) {
			// 匿名用户
			if (Constants.USER_TYPE_GUEST.equals(ut.getUserType())) {
				write(response,Constants.ERRORCODE_NOT_LOGIN,"用户未登录");
				return false;
			}else {
			// 登录用户
				// 判断用户是否被冻结
				CUserService userService = SpringContextHolder.getBean(CUserService.class);
				if (userService.isLock(ut.getUserId())) {
					write(response,Constants.ERRORCODE_USER_LOCKED,"用户被冻结");
					return false;
				}
				// 判断用户session是否失效
				CSessionService sessionService = SpringContextHolder.getBean(CSessionService.class);
				CSession session = sessionService.get(ut.getSessionId());
				if (Constants.SESSION_STATUS_KICKOUT.equals(session.getStatus())) {
					write(response,Constants.ERRORCODE_SESSION_KICKOUT,"帐号在另一台设备登录");
					return false;
				}else if (Constants.SESSION_STATUS_LOGOUT.equals(session.getStatus())) {
					write(response,Constants.ERRORCODE_SESSION_LOGOUT,"用户已退出，请重新登录");
					return false;
				}else if (Constants.SESSION_STATUS_EXPIRE.equals(session.getStatus())) {
					write(response,Constants.ERRORCODE_SESSION_EXPIRE,"登录失效，请重新登录");
					return false;
				}else if(Constants.SESSION_STATUS_LOGIN.equals(session.getStatus())){
					if(ut.getLoginTime() + SESSION_EXPIRE > System.currentTimeMillis()){
						write(response,Constants.ERRORCODE_SESSION_EXPIRE,"登录失效，请重新登录");
						return false;
					}
					// 允许访问
					return true;
				}
			}
		}else {
			// 允许访问
			return true;
		}
		return false;
	}

//	private void setRemoteIp(HttpServletRequest request, Object handler) {
//		if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
//			HandlerMethod handlerMethod=(HandlerMethod) handler;
//			MethodParameter[] methodParameter = handlerMethod.getMethodParameters();
//			for (int i = 0; i < methodParameter.length; i++) {
//				Method method = methodParameter[i].getMethod();
//				Class[] types = method.getParameterTypes();
//				for (Class c : types) {
//					Reflections.invokeSetter(c, "remoteIP", request.getRemoteAddr());
//				}
//			}
//		}
//	}

	private boolean isRequiredLogin(Object handler) {
		if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
			HandlerMethod handlerMethod=(HandlerMethod) handler;
			Object obj = handlerMethod.getMethodAnnotation(RequiredLogin.class);
			if (obj != null) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 返回JSON格式错误信息
	 */
	private void write(HttpServletResponse response, String code, String msg) throws IOException{
		PrintWriter writer = response.getWriter();
		writer.print(JsonMapper.toJsonString(ApiResponse.failMessage(code, msg)));
		writer.flush();
	}
}
