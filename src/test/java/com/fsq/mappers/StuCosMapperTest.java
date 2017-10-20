package com.fsq.mappers;

import com.alibaba.fastjson.JSON;
import com.fsq.entity.Course;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/20.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class StuCosMapperTest {

    @Autowired
    private StuCosMapper stuCosMapper;

    @Test
    public void getCnoBySnoTest(){
        List<String> courses = stuCosMapper.getCourseNoBySno("E11414051");
        p(courses);
    }

    public void p(Object object){
        System.out.println(JSON.toJSONString(object));
    }

}
