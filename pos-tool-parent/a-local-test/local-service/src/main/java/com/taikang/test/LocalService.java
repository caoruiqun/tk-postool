package com.taikang.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @description: 登录微服务启动类
 * @author: itw_caorq
 * @create: 2020-04-27 16:07
 **/
@SpringBootApplication
@EnableDiscoveryClient
public class LocalService {

    public static void main(String[] args) {
        SpringApplication.run(LocalService.class, args);
    }

}
