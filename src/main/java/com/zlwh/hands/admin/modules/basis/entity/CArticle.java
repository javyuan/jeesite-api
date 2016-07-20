/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zlwh.hands.admin.modules.basis.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 文章Entity
 * @author yuanjifeng
 * @version 2016-07-20
 */
public class CArticle extends DataEntity<CArticle> {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TYPE_GUAN_YU_WO_MEN = "0";
	public static final String TYPE_BAN_QUAN_XIE_YI = "1";
	
	private String type;		// type
	private String title;		// title
	private String imageUrl;		// image_url
	private String content;		// content
	private String subTitle;		// sub_title
	
	public CArticle() {
		super();
	}

	public CArticle(String id){
		super(id);
	}

	@Length(min=0, max=1, message="type长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=255, message="title长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=500, message="image_url长度必须介于 0 和 500 之间")
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	@Length(min=0, max=5000, message="content长度必须介于 0 和 5000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=255, message="sub_title长度必须介于 0 和 255 之间")
	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	
}