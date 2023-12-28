package com.as.ssm.service.impl;

import com.as.ssm.dao.MenuMapper;
import com.as.ssm.domain.Employee;
import com.as.ssm.domain.Menu;
import com.as.ssm.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 描述：
 * 创建人：飘
 * 创建时间：2023/12/12
 **/

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Autowired
    HttpSession session;

    @Override
    public List<Menu> selectByParentId(Integer parentid) {
        Employee emp=(Employee)session.getAttribute("loginEmp");
        Integer empid=emp.getEmpid();
        return this.menuMapper.selectByParentId(empid,parentid);
    }

    @Override
    public List<Menu> list(Integer parentId) {
        return this.menuMapper.select(parentId);
    }

    @Override
    public List<Menu> getByEmpId(Integer empId) {
        return this.menuMapper.selectByEmpId(empId);
    }
}
