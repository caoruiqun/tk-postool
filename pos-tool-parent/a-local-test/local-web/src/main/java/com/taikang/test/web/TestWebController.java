package com.taikang.test.web;

import com.taikang.test.service.ConsumerService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description:
 * @author: itw_caorq
 * @create: 2020-04-30 15:24
 **/
@RestController
public class TestWebController {

    @Reference
    private ConsumerService consumerService;

    @GetMapping("/test/service")
    public String service(){
        return "test" + consumerService.service();
    }
}
