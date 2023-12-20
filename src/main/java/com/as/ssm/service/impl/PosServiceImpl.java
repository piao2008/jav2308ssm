package com.as.ssm.service.impl;

import com.as.ssm.dao.PosMapper;
import com.as.ssm.domain.Pos;
import com.as.ssm.service.PosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/1
 **/

@Service
public class PosServiceImpl implements PosService {
    @Autowired
    private PosMapper posMapper;
    @Override
    public List<Pos> list() {
        return this.posMapper.select();
    }
}
