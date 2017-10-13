package com.fsq.service;

import com.fsq.entity.Admin;
import com.fsq.mappers.AdminMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@Service
public class AdminService {

    @Resource
    private AdminMapper adminMapper;

    public boolean login(String no, String password){
        Admin admin = adminMapper.getAdminByNo(no);
        if(admin != null && admin.getPassword().equals(password)){
            return true;
        } else {
            return false;
        }
    }

    public Admin getAdminByNo(String no){
        return adminMapper.getAdminByNo(no);
    }

}
