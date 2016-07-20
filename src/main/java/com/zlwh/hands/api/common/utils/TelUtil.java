package com.zlwh.hands.api.common.utils;

import java.io.UnsupportedEncodingException;

public class TelUtil {
	// 验证码发送地址
	private static final String SMSURLSTR = "http://sdk.entinfo.cn:8061/webservice.asmx/mdsmssend";
	private static final String SN = "SDK-BBX-010-19809";
	private static final String SMSPWD = "7EFB4E32E0F72348087BF9144FC8585D";
	public static final String TELNUM = "139,138,137,136,135,134,147,188,187,184,183,182,178,159,158,157,152,151,150,186,185,176,145,156,155,132,131,130,189,181,180,177,153,133,189,133";
	/**
	 * @param mobilePhone
	 * @param code
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static boolean sendSMS(String mobilePhone, String code) {
		try {
			String content = ",为您的注册码，请您在一分钟内完成注册。如非本人操作，请忽略。【大手小手动起来】";
			String contentAuthCode = String.valueOf(code);
			String contentResult = java.net.URLEncoder.encode(contentAuthCode + content, "utf-8");
			String param = "sn=" + SN + "&pwd=" + SMSPWD + "&mobile=" + mobilePhone
					+ "&content=" + contentResult + "&ext=1&stime=&rrid=&msgfmt=";
			HttpUtils.sendGet(SMSURLSTR, param);
			return true;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static void main(String[] args) throws UnsupportedEncodingException {
//		BigDecimal a1 = new BigDecimal("8817010393021010");
//		BigDecimal a2 = new BigDecimal("1"); 
		System.out.println(TelUtil.sendSMS("18501364095","1314"));
//		System.out.println(TelAuthUtil.sendSMS("18611140788",1314));
//		String code = (int)(Math.random()*10)+""+(int)(Math.random()*10)+(int)(Math.random()*10)+(int)(Math.random()*10);
//		System.out.println(code);
	}
}
