package com.taikang.log.log;

import com.taikang.log.model.SysLog;
import org.springframework.stereotype.Service;

/**
 * @description:
 * @author: itw_caorq
 * @create: 2020-05-20 16:08
 **/
@Service
public class SysLogServiceImpl implements SysLogService {

    @Override
    public Object save(SysLog sysLog) {

        return true;
    }
}
