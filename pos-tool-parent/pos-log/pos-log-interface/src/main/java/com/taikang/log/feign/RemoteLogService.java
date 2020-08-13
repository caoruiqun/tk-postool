package com.taikang.log.feign;

import com.taikang.log.model.SysLog;
import com.taikang.log.vo.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

//@FeignClient(contextId = "remoteLogService", value = ServiceNameConstants.UMPS_SERVICE, fallbackFactory = RemoteLogServiceFallbackFactory.class)
//public interface RemoteLogService {
//    /**
//     * 保存日志
//     *
//     * @param sysLog 日志实体
//     * @param from   内部调用标志
//     * @return succes、false
//     */
//    @PostMapping("/log")
//    R<Boolean> saveLog(@RequestBody SysLog sysLog, @RequestHeader(SecurityConstants.FROM) String from);
//}

@FeignClient(value = "pos-log", fallbackFactory = RemoteLogServiceFallbackFactory.class)
public interface RemoteLogService {

    /**
     * 保存日志
     * @param sysLog log
     * @return boolean
     */
    @PostMapping("/log")
    R<Boolean> saveLog(@RequestBody SysLog sysLog);
}