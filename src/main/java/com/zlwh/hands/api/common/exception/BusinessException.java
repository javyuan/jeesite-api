/**
 * 
 */
package com.zlwh.hands.api.common.exception;

/**
 * 
 * @author yuanjifeng
 */
public class BusinessException extends Exception {

	private static final long serialVersionUID = 8386945553265545493L;
	
	private String code;

	public BusinessException() {
		super();
	}

	public BusinessException(String code, String message) {
		super(message);
		this.code = code;
	}

	public BusinessException(String code, String message, Throwable cause) {
		super(message, cause);
		this.code = code;
	}

	public String getCode() {
		return code;
	}
}
