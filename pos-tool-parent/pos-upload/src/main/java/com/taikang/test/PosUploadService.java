package com.taikang.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @description: 文件上传 启动类
 * @author: itw_caorq
 * @create: 2020-04-24 15:27
 **/
@SpringBootApplication
@EnableDiscoveryClient
public class PosUploadService {

    public static void main(String[] args) {
        SpringApplication.run(PosUploadService.class, args);
    }

}
