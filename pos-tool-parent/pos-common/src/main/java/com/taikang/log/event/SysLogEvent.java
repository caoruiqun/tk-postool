package com.taikang.log.event;

import com.taikang.log.model.SysLog;
import org.springframework.context.ApplicationEvent;

/**
 * @description: 系统日志事件
 * @author: itw_caorq
 * @create: 2020-05-19 16:18
 **/
public class SysLogEvent extends ApplicationEvent {

    public SysLogEvent(SysLog source) {
        super(source);
    }
}
