//package com.taikang.gateway.config;
//
//import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.server.ServerWebExchange;
//import reactor.core.publisher.Mono;
//
///**
// * @description: 创建 GatewayConfig 配置类
// * @author: itw_caorq
// * @create: 2020-05-11 14:52
// **/
//@Configuration
//public class GatewayConfig {
//
//    /**
//    * @Description:  创建获取限流 KEY 的 Bean
//    * @Param []
//    * @return
//    * @throws
//    */
//    @Bean
//    public KeyResolver hostAddrKeyResolver() {
//        return new KeyResolver() {
//
//            @Override
//            public Mono<String> resolve(ServerWebExchange exchange) {
//                // 获取请求的 IP
//                return Mono.just(exchange.getRequest().getRemoteAddress().getHostName());
//            }
//
//        };
//    }
//
//}