package com.taikang.client.web;

import com.taikang.client.model.ClientBasic;
import com.taikang.client.service.ClientService;
import com.taikang.enums.ExceptionEnum;
import com.taikang.exception.PosException;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: 客户管理控制类
 * @author: itw_caorq
 * @create: 2020-05-15 13:24
 **/
@RestController
@RequestMapping("/client")
public class ClientController {

    @Reference
    private ClientService clientService;

    /**
    * @Description:  根据客户id获取客户基本信息
    * @Param [id]
    * @return
    * @throws
    */
    @GetMapping("/{id}")
    public ResponseEntity<ClientBasic> getClientBasicInfoById(@PathVariable("id") Integer id) {
        ClientBasic clientBasic = clientService.getClientBasicInfoById(id);
        if (clientBasic == null) {
            throw new PosException(ExceptionEnum.CLIENTBASIC_NOT_FOUND);
        }
        return ResponseEntity.ok(clientBasic);
    }

}
