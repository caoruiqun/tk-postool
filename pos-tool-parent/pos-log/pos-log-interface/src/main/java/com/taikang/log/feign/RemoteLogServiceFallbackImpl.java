package com.taikang.log.feign;

import com.taikang.log.model.SysLog;
import com.taikang.log.vo.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class RemoteLogServiceFallbackImpl implements RemoteLogService {

    private static final Logger log = LoggerFactory.getLogger(RemoteLogServiceFallbackImpl.class);

    private Throwable cause;

    public Throwable getCause() {
        return cause;
    }

    public void setCause(Throwable cause) {
        this.cause = cause;
    }

//    /**
//     * 保存日志
//     *
//     * @param sysLog 日志实体
//     * @param from   内部调用标志
//     * @return succes、false
//     */
//    @Override
//    public R<Boolean> saveLog(SysLog sysLog, String from) {
//        log.error("feign 插入日志失败", cause);
//        return null;
//    }

    @Override
    public R<Boolean> saveLog(SysLog sysLog) {
        log.error("feign 插入日志失败", cause);
        return null;
    }

}