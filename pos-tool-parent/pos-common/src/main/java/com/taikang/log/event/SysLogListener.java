package com.taikang.log.event;

import com.taikang.log.feign.RemoteLogService;
import com.taikang.log.model.SysLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 * @description: 异步监听日志事件
 * @author: itw_caorq
 * @create: 2020-05-19 16:19
 **/
public class SysLogListener {

    private static final Logger logger = LoggerFactory.getLogger(SysLogListener.class);

//    private final RemoteLogService remoteLogService;
    private RemoteLogService remoteLogService;

    @Async
    @Order
    @EventListener(SysLogEvent.class)
    public void saveSysLog(SysLogEvent event) {
        SysLog sysLog = (SysLog) event.getSource();
        logger.info("日志信息...，系统准备入库日志信息");
        //todo insert logs into mysql ...
        remoteLogService.saveLog(sysLog);
    }

    public SysLogListener(RemoteLogService remoteLogService) {
        this.remoteLogService = remoteLogService;
    }

    public void setRemoteLogService(RemoteLogService remoteLogService) {
        this.remoteLogService = remoteLogService;
    }

    public RemoteLogService getRemoteLogService() {
        return remoteLogService;
    }
}
