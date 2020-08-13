package com.taikang.log.log;

import com.taikang.log.model.SysLog;
import com.taikang.log.vo.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:
 * @author: itw_caorq
 * @create: 2020-05-20 15:49
 **/
@RestController
public class LogController {

    @Autowired
    private SysLogService sysLogService;

    /**
     * 插入日志
     *
     * @param sysLog 日志实体
     * @return success/false
     */
    @PostMapping("/log")
    public R saveLog(@RequestBody SysLog sysLog) {
        return R.ok(sysLogService.save(sysLog));
    }

}
