package com.taikang.log.aspect;

import com.taikang.log.annotation.SysLog;
import com.taikang.log.event.SysLogEvent;
import com.taikang.log.util.SysLogUtils;
import com.taikang.log.xx.SpringContextHolder;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @description: 操作日志使用spring event异步入库
 * @author: itw_caorq
 * @create: 2020-05-19 16:17
 **/
@Aspect
public class SysLogAspect {

    private static final Logger log = LoggerFactory.getLogger(SysLogAspect.class);

    @Around("@annotation(sysLog)")
    public Object around(ProceedingJoinPoint point, SysLog sysLog) throws Throwable {
        String strClassName = point.getTarget().getClass().getName();
        String strMethodName = point.getSignature().getName();
        log.debug("[类名]:{},[方法]:{}", strClassName, strMethodName);

        com.taikang.log.model.SysLog  logVo = SysLogUtils.getSysLog();
        logVo.setTitle(sysLog.value());
        // 发送异步日志事件
        Long startTime = System.currentTimeMillis();
        Object obj = point.proceed();
        Long endTime = System.currentTimeMillis();
        logVo.setTime(endTime - startTime);
        SpringContextHolder.publishEvent(new SysLogEvent(logVo));
        return obj;
    }

}
