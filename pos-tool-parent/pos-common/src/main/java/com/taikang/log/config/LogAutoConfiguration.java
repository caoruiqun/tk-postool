package com.taikang.log.config;

import com.taikang.log.aspect.SysLogAspect;
import com.taikang.log.event.SysLogListener;
import com.taikang.log.feign.RemoteLogService;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * 日志自动配置
 */
//@EnableAsync
//@ConditionalOnWebApplication
//@Configuration(proxyBeanMethods = false)
//public class LogAutoConfiguration {
//    private final RemoteLogService remoteLogService;
//
//    public LogAutoConfiguration(RemoteLogService remoteLogService) {
//        this.remoteLogService = remoteLogService;
//    }
//
//    @Bean
//    public SysLogListener sysLogListener() {
//        return new SysLogListener(remoteLogService);
//    }
//
//    @Bean
//    public SysLogAspect sysLogAspect() {
//        return new SysLogAspect();
//    }
//}

@EnableAsync
@ConditionalOnWebApplication
@Configuration(proxyBeanMethods = false)
public class LogAutoConfiguration {

    private final RemoteLogService remoteLogService;
//    private RemoteLogService remoteLogService;

    @Bean
    public SysLogListener sysLogListener() {
        return new SysLogListener(remoteLogService);
    }

    @Bean
    public SysLogAspect sysLogAspect() {
        return new SysLogAspect();
    }

    public LogAutoConfiguration(RemoteLogService remoteLogService) {
        this.remoteLogService = remoteLogService;
    }
}