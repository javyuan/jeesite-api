package com.zlwh.hands.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zlwh.hands.admin.modules.basis.entity.CArticle;
import com.zlwh.hands.admin.modules.basis.service.CArticleService;
import com.zlwh.hands.api.common.BaseController;
import com.zlwh.hands.api.domain.ArticleDomain;

@Controller
@RequestMapping(value = "/api/1.0/H5")
public class H5Controller extends BaseController {

	@Autowired
	CArticleService articleService;
	
	@RequestMapping(value = "aboutus")
	public String aboutus(ArticleDomain domain, Model model) {
		CArticle article = new CArticle();
		article.setType(CArticle.TYPE_GUAN_YU_WO_MEN);
		article = articleService.get(article);
		model.addAttribute(article);
		return "mobile/modules/article/aboutus";
	}
	@RequestMapping(value = "copyright")
	public String copyright(ArticleDomain domain, Model model) {
		CArticle article = new CArticle();
		article.setType(CArticle.TYPE_BAN_QUAN_XIE_YI);
		article = articleService.get(article);
		model.addAttribute(article);
		return "mobile/modules/article/copyright";
	}

}