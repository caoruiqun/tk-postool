package com.taikang.log.annotation;

import java.lang.annotation.*;

/**
 * @description: 操作日志注解
 * @author: itw_caorq
 * @create: 2020-05-15 16:07
 **/
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {

    /**
     * 描述
     *
     * @return {String}
     */
    String value();
}