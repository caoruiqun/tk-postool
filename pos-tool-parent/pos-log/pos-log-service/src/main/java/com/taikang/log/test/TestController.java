package com.taikang.log.test;

import com.taikang.log.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:
 * @author: itw_caorq
 * @create: 2020-05-20 16:13
 **/
@RestController
public class TestController {

    @SysLog("新增客户")
    @GetMapping("/test/{name}")
    public String get(@PathVariable("name") String name) {
        return name;
    }

}
