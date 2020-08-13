package com.taikang.client.service;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;

/**
 * @description:
 * @author: itw_caorq
 * @create: 2020-04-30 16:40
 **/
@Service
@RefreshScope
public class ConsumerServiceImpl implements ConsumerService {

    /**
     * 测试服务提供者的配置文件
     */
    @Value("${test.name}")
    private String testName;

    @Value("${dubbo.protocol.port}")
    private String port;

    /**
     * 测试服务注册与调用
     * @return
     */
    @Override
    public String service() {
        System.out.println(port);
        return "Consumer invoke "+testName+" 端口："+port;
    }

}
