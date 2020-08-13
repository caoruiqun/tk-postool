package com.taikang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @description: 客户管理微服务-应用层启动类
 * @author: itw_caorq
 * @create: 2020-04-28 16:07
 **/
@SpringBootApplication
@EnableDiscoveryClient
public class PosClientWeb {

    public static void main(String[] args) {
        SpringApplication.run(PosClientWeb.class, args);
    }

}
