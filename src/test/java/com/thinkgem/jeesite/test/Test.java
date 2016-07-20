package com.thinkgem.jeesite.test;

import java.util.Date;

import com.thinkgem.jeesite.common.security.Cryptos;

public class Test {

	public static void main(String[] args) {
		String en = Cryptos.aesEncrypt("59FF4BEDF5155319CE6F39815653C60A:0123456789:"+new Date().getTime(),"59FF4BEDF5155319CE6F39815653C60A");
		System.out.println(en);
//		String de = Cryptos.aesDecrypt("b8162545b1d675150c1ed7beb04a87291059468c08263d36212ae208f24cbe38b2355b334d4b5e651dd06c19f8f1bd6963d129b0c4223ea9d71dee341943175b","59FF4BEDF5155319CE6F39815653C60A");
//		System.out.println(de);
		//System.out.println(TokenUtils.encryptToken(new UserToken(IdGen.uuid(),Constants.USER_TYPE_GUEST)));
	}
	
}
