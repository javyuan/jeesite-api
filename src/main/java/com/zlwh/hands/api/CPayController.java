package com.zlwh.hands.api;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.utils.Exceptions;
import com.zlwh.hands.api.common.ApiResponse;
import com.zlwh.hands.api.common.BaseController;
import com.zlwh.hands.api.common.alipay.AlipayCore;
import com.zlwh.hands.api.common.alipay.AlipayNotify;
import com.zlwh.hands.api.common.alipay.Configuration;
import com.zlwh.hands.api.common.alipay.RSA;
import com.zlwh.hands.api.domain.PayDomain;
/**
 * 
 * 支付流程： 
 * 1、客户端调用服务端getAlipayParams方法获得支付宝请求参数 
 * 2、客户端拿到参数调用支付宝
 * 3、支付宝回调服务端修改订单状态
 * 
 */
@Controller
@RequestMapping(value = "/api/1.0/pay/")
public class CPayController extends BaseController {

	/**
	 * 
	 * 创建订单
	 * 
	 */
	@RequestMapping("createOrder")
	@ResponseBody
	public ApiResponse createOrder(PayDomain domain) {
		try{
			// TODO 校验商品是否存在

			// TODO 生成订单信息
			
			return ApiResponse.successMessage("成功",null);
		}catch(Exception e){
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}

	/**
	 * 创建支付宝请求参数
	 * @param PayDomain
	 * @return ApiResponse
	 */
	@RequestMapping("getAlipayParams")
	@ResponseBody
	public ApiResponse getAlipayParams(PayDomain domain) {
		try{
			// 拼装订单信息
			String orderInfoStr = AlipayCore.createLinkString(createAlipayParam(BeanUtils.describe(domain)));
			// 签名处理
			String sign = RSA.sign(orderInfoStr, Configuration.private_key, "utf-8");
			// 仅需对sign 做URL编码
			sign = URLEncoder.encode(sign, "UTF-8");
			//完整的符合支付宝参数规范的订单信息
			String payInfo = orderInfoStr + "&sign=\"" + sign + "\"&" + "sign_type=\"RSA\"";
			return ApiResponse.successMessage("成功", payInfo);
		}catch(Exception e){
			logger.error(""+e);
			return ApiResponse.failMessage("系统错误");
		}
	}

	/**
	 * 
	 * 支付宝点对点回调
	 * 
	 */
	@RequestMapping(value = "/AliPayServerCallback")
	@ResponseBody
	public String AliPayCallback(HttpServletRequest request) throws UnsupportedEncodingException {
		logger.info("AliPayCallback start ...");
		try {
			// 进行支付宝验证
			Map<String, String> params = new HashMap<String, String>();
			Map requestParams = request.getParameterMap();
			for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				}
				// 乱码解l决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
				params.put(name, valueStr);
			}
			// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			// 商户订单号
			for (String key : params.keySet()) {
				logger.info("key= " + key + "  and  value= " + params.get(key));
			}
			// 订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
			// 交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");
			// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			if (AlipayNotify.verify(params)) {
				if (trade_status.equals("TRADE_SUCCESS")) {
					// TODO 修改订单状态
					return "success";
				} else {
					logger.error("trade_status not success ...");
				}
			} else {
				logger.error("verify not success ...");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Exceptions.getStackTraceAsString(e));
		}
		return "error";
	}

	/**
	 * 
	 * 拼接支付宝参数
	 * 
	 */
	private Map<String, String> createAlipayParam(Map orderInfo) {
		Map<String, String> resultMap = new HashMap<String, String>();
		// 签约合作者身份ID
		resultMap.put("partner", "\"" + Configuration.PARTNER + "\"");
		// 签约卖家支付宝账号
		resultMap.put("seller_id", "\"" + Configuration.SELLER + "\"");
		// 商户网站唯一订单号
		resultMap.put("out_trade_no", "\"" + orderInfo.get("") + "\"");
		// 商品名称
		resultMap.put("subject", "\"" + orderInfo.get("") + "\"");
		// 商品详情
		resultMap.put("body", "\"" + orderInfo.get("") + "\"");
		// 商品金额
		resultMap.put("total_fee", "\"" + orderInfo.get("") + "\"");
		// 服务器异步通知页面路径
		resultMap.put("notify_url", "\"" + Configuration.NOTIFY_URL + "\"");
		// 服务接口名称， 固定值
		resultMap.put("service", "\"" + Configuration.SERVICE + "\"");
		// 支付类型， 固定值
		resultMap.put("payment_type", "\"1\"");
		// 参数编码， 固定值
		resultMap.put("_input_charset", "\"utf-8\"");
		// 设置未付款交易的超时时间
		// 默认30分钟，一旦超时，该笔交易就会自动被关闭。
		// 取值范围：1m～15d。
		// m-分钟，h-小时，d-天，1c-当天（无论交易何时创建，都在0点关闭）。
		// 该参数数值不接受小数点，如1.5h，可转换为90m。
		resultMap.put("it_b_pay", "\"30m\"");
		return resultMap;
	}

}