package com.zlwh.hands.api.common;

/**
 * 统一返回体
 * 
 * @author yuanjifeng
 *
 */
public class ApiResponse {

	public static final String SUCCESS = "0";
	public static final String FAIL = "-1";

	private String code = FAIL;
	private String message = null;
	private Object data = null;

	private ApiResponse(){}

	private ApiResponse(String code, String message, Object data) {
		this.code = code;
		this.message = message;
		this.data = data;
	}

	private ApiResponse(String code, String message) {
		this(code, message, null);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public static ApiResponse failMessage(String message) {
		return new ApiResponse(FAIL, message);
	}

	public static ApiResponse failMessage(String code, String message) {
		return new ApiResponse(code, message);
	}

	public static ApiResponse successMessage(String message, Object data) {
		return new ApiResponse(SUCCESS, message, data);
	}
}
