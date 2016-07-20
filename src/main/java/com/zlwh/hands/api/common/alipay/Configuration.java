/**   
* @Title: Configuration.java    
* @Package com.zlwh.hands.api.common    
* @Description: TODO(用一句话描述该文件做什么)    
* @author 刘斐   
* @date 2016年6月21日 下午5:57:03    
* @version V1.0   
*/
package com.zlwh.hands.api.common.alipay;

public class Configuration {
	//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
    // 商户收款账号
    public static final String SELLER = "";
	// 合作身份者ID，以2088开头由16位纯数字组成的字符串
	public static String PARTNER = "";
	// 商户的私钥
	public static String private_key = "+jC8trS2bcWzFWl6C1J17xgaNIGJdU7VrfKg/QKx/xb8QLxkks03jdLOpQkIqPejJOvzXIEh2ZQJEpGwRpodwzGvz6Y7W+BH6XhLSMX4CuzUSoUfIYzvrVezvF9AgMBAAECgYEAhJ2X9HKRkJI6tA3shafU+6k7fo+dTTIhqq63EfiewvHhJqGAcQcgHmOwoCiuBep7y9c+N9LIVfuOsFa57Q70f300arRk5Ydr5cdCFMP3cyrkYvsPp8pDCA7V1t+fGPGjLWFZLuz3U168mEluELVncll+WMXWzVA2MwSUODFWHMECQQDq32wsTh/j74nMmzxLTIbmo0aUquP/4JSe1gFWyNybSpPgGs3oVJnLJX96rIrgv8TGzHfKcOj8+NNmoPognv1VAkEA1ayImv7KutixSkgzSa26//3hkhGeuP9u7FQJU6IsJlcnQ7BCwoZnpzJvDJds4o+3NpGVARiX/W3CpzHSWrvjiQJBAJLaqZc2Lehl8KIW+ecW7U4uDsaL500pDaQWqPWrV4xdYAKCn/ZBV3vWcVOxqJAIN7AZTlksqfDqX7vOsTZOUpUCQQCJ+MSkwM2LZQzl2EU12DadwgP72+DPuDCZ7ZGwLVGw2CoEbTZOgZdAwTIvwT+P9Bjr5Yl/ka/i9xLv/x3DdPtxAkApTOFYOZh5V1ksQNEmeX423O90ko4kt7rr7Y+yLgXFOmp0l6an7VOwxU/p0uoyy7G/lo0MZTVxWVqCB3dwI3qc";
	
	// 支付宝的公钥，无需修改该值
	public static String ali_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj"
			+ "/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiF"
			+ "Ynkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrF"
			+ "XfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";
	
	//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	

	// 调试用，创建TXT日志文件夹路径
	public static String log_path = "D:\\";

	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";
	
	// 签名方式 不需修改
	public static String sign_type = "RSA";
	// 服务接口名称， 固定值
	public static String SERVICE = "mobile.securitypay.pay";
	// 支付宝回调服务器地址
	public static String NOTIFY_URL = "";
}
