package com.taikang.client.service;

import com.taikang.client.mapper.ClientbasicMapper;
import com.taikang.client.model.ClientBasic;
import com.taikang.enums.ExceptionEnum;
import com.taikang.exception.PosException;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @description:
 * @author: itw_caorq
 * @create: 2020-05-15 13:39
 **/
@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientbasicMapper clientbasicMapper;

    /**
     * @Description:  根据客户id获取客户基本信息
     * @Param [id]
     * @return
     * @throws
     */
    @Override
    public ClientBasic getClientBasicInfoById(Integer id) {
        ClientBasic clientBasic = clientbasicMapper.selectByPrimaryKey(id);
//        if (clientBasic == null) {
//            throw new PosException(ExceptionEnum.CLIENTBASIC_NOT_FOUND);
//        }
        return clientBasic;
    }

}
