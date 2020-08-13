package com.taikang.exception;

import com.taikang.enums.ExceptionEnum;

/**
 * @description:
 * @author: CaoRuiqun
 * @create: 2020-04-24 15:10
 **/
public class PosException extends RuntimeException {

    private ExceptionEnum exceptionEnum;

    public PosException() {
    }

    public PosException(ExceptionEnum exceptionEnum) {
        this.exceptionEnum = exceptionEnum;
    }

    public ExceptionEnum getExceptionEnum() {
        return exceptionEnum;
    }
}
