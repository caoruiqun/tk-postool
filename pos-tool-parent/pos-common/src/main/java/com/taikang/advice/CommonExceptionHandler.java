package com.taikang.advice;

import com.taikang.enums.ExceptionEnum;
import com.taikang.exception.PosException;
import com.taikang.vo.ExceptionResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @description:
 * @author: CaoRuiqun
 * @create: 2020-05-06 15:10
 **/
@ControllerAdvice   //该注解由spring-webmvc提供，只要引它就可以.此外该注解要起作用，必须被扫到，所以注意引用它的启动类的扫包
public class CommonExceptionHandler {

//    @ExceptionHandler(RuntimeException.class)
//    public ResponseEntity<String> handlerException(RuntimeException e) {
//        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
//    }


    @ExceptionHandler(PosException.class)
    public ResponseEntity<ExceptionResult> handlerException(PosException e) {
        ExceptionEnum em = e.getExceptionEnum();
        return ResponseEntity.status(em.getCode()).body(new ExceptionResult(em));
    }
}
