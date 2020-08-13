package com.taikang.gateway;

import com.alibaba.cloud.sentinel.gateway.ConfigConstants;
import com.alibaba.csp.sentinel.config.SentinelConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: 统一网关微服务启动类
 * @author: itw_caorq
 * @create: 2020-04-27 16:07
 **/
@SpringBootApplication
@EnableDiscoveryClient
@RefreshScope
//@EnableFeignClients
public class PosApiGateway {

    public static void main(String[] args) {

//        System.setProperty(SentinelConfig.APP_TYPE, ConfigConstants.APP_TYPE_SCG_GATEWAY);
        SpringApplication.run(PosApiGateway.class, args);
    }

    //测试获取外部配置
    @RestController
    @RefreshScope
    static class TestController {

        @Value("${test.name}")
        private String testName;

        @GetMapping("/test")
        public String hello() {
            return testName;
        }

    }


//    @Bean
//    @Primary
//    public HostAddrKeyResolver hostAddrKeyResolver() {
//        return new HostAddrKeyResolver();
//    }
//
//    @Bean
//    public UriKeyResolver uriKeyResolver() {
//        return new UriKeyResolver();
//    }
//
//    @Bean
//    KeyResolver userKeyResolver() {
//        return exchange -> Mono.just(exchange.getRequest().getQueryParams().getFirst("user"));
//    }

}
