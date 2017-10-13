package com.fsq.mappers;

import com.alibaba.fastjson.JSON;
import com.fsq.entity.Admin;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class AdminMapperTest {

    @Resource
    private AdminMapper adminMapper;

    @Test
    public void selectTest(){
        Admin admin = adminMapper.getAdminByNo("00001");
        System.out.println(JSON.toJSONString(admin));
    }

    @Test
    public void insertTest(){
        Admin admin = new Admin();
        admin.setNo("00001");
        admin.setPassword("123456");
        admin.setName("admin");
        adminMapper.insertAdmin(admin);
    }

}
