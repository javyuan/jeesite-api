package com.zlwh.hands.api.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/**
 * 标识在Controller的方法上，用于标识该资源的访问权限。
 * @see{UserInterceptor.isRequiredLogin}
 * @author yuanjifeng
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface RequiredLogin {

}
