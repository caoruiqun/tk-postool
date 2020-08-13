//package com.taikang.gateway.keyresolver;
//
//import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
//import org.springframework.web.server.ServerWebExchange;
//import reactor.core.publisher.Mono;
//
///**
// * @description: IP限流 redis
// * @author: itw_caorq
// * @create: 2020-05-12 14:02
// **/
//public class HostAddrKeyResolver implements KeyResolver {
//
//    @Override
//    public Mono<String> resolve(ServerWebExchange exchange) {
//        return Mono.just(exchange.getRequest().getRemoteAddress().getAddress().getHostAddress());
//    }
//
//}