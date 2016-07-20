package com.zlwh.hands.api.common.utils;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.zlwh.hands.admin.modules.sys.service.SysSequenceService;

/**
 * 序列工具类
 * @author yuanjifeng
 *
 */
public class SequenceUtils {

	/**
	 * 获取默认序列的当前值
	 */
	public static String getCurrentVal(){
		SysSequenceService service = SpringContextHolder.getBean(SysSequenceService.class);
		return service.getCurrentVal();
	}
	/**
	 * 获取指定序列的当前值
	 */
	public static String getCurrentVal(String key){
		SysSequenceService service = SpringContextHolder.getBean(SysSequenceService.class);
		return service.getCurrentVal(key);
	}
	/**
	 * 获取默认序列的下一个值
	 */
	public static String getNextVal(){
		SysSequenceService service = SpringContextHolder.getBean(SysSequenceService.class);
		return service.getNextVal();
	}
	/**
	 * 获取指定序列的下一个值
	 */
	public static String getNextVal(String key){
		SysSequenceService service = SpringContextHolder.getBean(SysSequenceService.class);
		return service.getNextVal(key);
	}
}
