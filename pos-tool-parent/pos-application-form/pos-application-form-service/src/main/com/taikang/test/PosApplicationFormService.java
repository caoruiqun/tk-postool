package com.taikang.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @description: 投保申请单微服务-服务层启动类
 * @author: itw_caorq
 * @create: 2020-04-29 16:07
 **/
@SpringBootApplication
@EnableDiscoveryClient
public class PosApplicationFormService {

    public static void main(String[] args) {
        SpringApplication.run(PosApplicationFormService.class, args);
    }

}
