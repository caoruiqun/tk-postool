package com.taikang.enums;

public enum ExceptionEnum {

    SUCCESS(0,"成功！"),
    ERROR(-100,"失败！"),
    CLIENTBASIC_NOT_FOUND(1001,"客户基本信息未查到！"),
    TOKEN_MISS_ERROR(2001, "解密失败，Missing or invalid Authorization header")
    ;

    private Integer code;
    private String msg;

    ExceptionEnum() {
    }

    ExceptionEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
