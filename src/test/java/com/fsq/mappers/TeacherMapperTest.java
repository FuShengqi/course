package com.fsq.mappers;

import com.alibaba.fastjson.JSON;
import com.fsq.entity.Teacher;
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
public class TeacherMapperTest {

    @Resource
    private TeacherMapper teacherMapper;

    @Test
    public void selectTest(){
        Teacher teacher = teacherMapper.getTeacherByNo("10001");
        print(teacher);
    }

    @Test
    public void insertTest(){
        Teacher teacher = new Teacher();
        teacher.setNo("10005");
        teacher.setPassword("123456");
        teacher.setName("方贤勇");
        teacher.setSex(false);

        teacherMapper.insertTeacher(teacher);
    }

    @Test
    public void updateTest(){
        Teacher teacher = teacherMapper.getTeacherByNo("10001");
        teacher.setDept("计算机科学与技术");
        teacherMapper.updateTeacher(teacher);
    }

    @Test
    public void deleteTest(){
        teacherMapper.deleteTeacherById("10001");
    }

    @Test
    public void countTest(){
        System.out.println(teacherMapper.count());
    }

    public void print(Object object){
        System.out.println(JSON.toJSONString(object));
    }

}
