package com.taikang.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @description: 产品微服务-服务层启动类
 * @author: itw_caorq
 * @create: 2020-04-27 16:07
 **/
@SpringBootApplication
@EnableDiscoveryClient
public class PosProductService {

    public static void main(String[] args) {
        SpringApplication.run(PosProductService.class, args);
    }

}
