//package com.taikang.gateway.keyresolver;
//
//import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
//import org.springframework.web.server.ServerWebExchange;
//import reactor.core.publisher.Mono;
//
///**
// * @description: uri限流
// * @author: itw_caorq
// * @create: 2020-05-12 14:03
// **/
//public class UriKeyResolver  implements KeyResolver {
//
//    @Override
//    public Mono<String> resolve(ServerWebExchange exchange) {
//        return Mono.just(exchange.getRequest().getURI().getPath());
//    }
//
//}