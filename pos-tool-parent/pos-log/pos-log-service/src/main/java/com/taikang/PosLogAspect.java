package com.taikang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @description: rizhi微服务应用层启动类
 * @author: itw_caorq
 * @create: 2020-04-28 16:07
 **/
@SpringBootApplication
@EnableFeignClients
@EnableDiscoveryClient
public class PosLogAspect {

    public static void main(String[] args) {
        SpringApplication.run(PosLogAspect.class, args);
    }

}
