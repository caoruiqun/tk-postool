package com.taikang.test.common;

/**
 * @description: 返回类
 * @author: itw_caorq
 * @create: 2020-04-24 14:24
 **/
public class ReturnVo<T> {
    public static final Integer OK = 0;
    public static final Integer ERROR = -100;

    private Integer code;
    private String message;
    private T data;


    public ReturnVo() {
        super();
    }


//    public ReturnVo(Integer code, String message) {
//        super();
//        this.code = code;
//        this.message = message;
//    }

    public ReturnVo(String message,Integer code) {
        super();
        this.code = code;
        this.message = message;
    }


    public ReturnVo(Integer code, String message, T data) {
        super();
        this.code = code;
        this.message = message;
        this.data = data;
    }


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

}
