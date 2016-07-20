/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.zlwh.hands.admin.modules.user.entity.CSession;
import com.zlwh.hands.admin.modules.user.entity.CUser;
import com.zlwh.hands.admin.modules.user.service.CSessionService;
import com.zlwh.hands.admin.modules.user.service.CUserService;
import com.zlwh.hands.api.common.Constants;

/**
 * 用户管理Controller
 * @author yuanjifeng
 * @version 2016-05-26
 */
@Controller
@RequestMapping(value = "${adminPath}/user/cUser")
public class CUserController2 extends BaseController {

	@Autowired
	private CUserService cUserService;
	
	@Autowired
	CSessionService sessionService;
	
	@ModelAttribute
	public CUser get(@RequestParam(required=false) String id) {
		CUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = cUserService.get(id);
		}
		if (entity == null){
			entity = new CUser();
		}
		return entity;
	}
	
	@RequiresPermissions("user:cUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(CUser cUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CUser> page = cUserService.findPage(new Page<CUser>(request, response), cUser); 
		model.addAttribute("page", page);
		model.addAttribute("cUser", cUser);
		return "modules/user/cUserList";
	}

	@RequiresPermissions("user:cUser:view")
	@RequestMapping(value = "form")
	public String form(CUser cUser, Model model) {
		model.addAttribute("cUser", cUser);
		return "modules/user/cUserForm";
	}

	@RequiresPermissions("user:cUser:edit")
	@RequestMapping(value = "lock")
	public String lock(CUser cUser, RedirectAttributes redirectAttributes, Model model) {
		cUser.setStatus(Constants.USER_STATUS_LOCK);
		cUserService.save(cUser);
		// 强制退出
		CSession sessionBean = new CSession();
		sessionBean.setUserId(cUser.getId());
		sessionBean.setStatus(Constants.SESSION_STATUS_LOGIN);
		List<CSession> sessionList = sessionService.findList(sessionBean);
		for (int i = 0; i < sessionList.size(); i++) {
			CSession s = sessionList.get(i);
			s.setStatus(Constants.SESSION_STATUS_LOGOUT);
			sessionService.save(s);
		}
		addMessage(redirectAttributes, "操作成功");
		return "redirect:"+Global.getAdminPath()+"/user/cUser/list?userType=1";
	}
	
	@RequiresPermissions("user:cUser:edit")
	@RequestMapping(value = "unlock")
	public String unlock(CUser cUser, RedirectAttributes redirectAttributes, Model model) {
		cUser.setStatus(Constants.USER_STATUS_NORMAL);
		cUserService.save(cUser);
		addMessage(redirectAttributes, "操作成功");
		return "redirect:"+Global.getAdminPath()+"/user/cUser/list?userType=1";
	}
	
	@RequiresPermissions("user:cUser:edit")
	@RequestMapping(value = "initPwd")
	@ResponseBody
	public String initPwd(CUser cUser) {
		String pwd = new Md5Hash("123456").toHex().toUpperCase();
		cUser.setPassword(pwd);
		cUserService.save(cUser);
		return pwd;
	}
	
	@RequiresPermissions("user:cUser:edit")
	@RequestMapping(value = "save")
	public String save(CUser cUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, cUser)){
			return form(cUser, model);
		}
		cUserService.save(cUser);
		addMessage(redirectAttributes, "保存成功");
		return "redirect:"+Global.getAdminPath()+"/user/cUser/list?userType=1";
	}
	
	@RequiresPermissions("user:cUser:edit")
	@RequestMapping(value = "delete")
	public String delete(CUser cUser, RedirectAttributes redirectAttributes) {
		cUserService.delete(cUser);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/user/cUser/list?userType=1";
	}

}