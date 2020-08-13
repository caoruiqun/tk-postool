//package com.taikang.test.service;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * @description:
// * @author: itw_caorq
// * @create: 2020-05-07 18:53
// **/
//@RestController
//public class LocalProviderController {
//
////    @Value("${server.port}")
////    private String port;
//
//    @GetMapping(value = "/test/{message}")
//    public String test(@PathVariable String message) {
//        return "Hello Nacos Discovery " + message + " i am from port " + "--> local";
//    }
//}