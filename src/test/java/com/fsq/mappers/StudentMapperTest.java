package com.fsq.mappers;

import com.alibaba.fastjson.JSON;
import com.fsq.entity.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by FuShengqi on 2017/10/12.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class StudentMapperTest {

    @Resource
    private StudentMapper studentMapper;

    @Test
    public void selectTest(){
        Student student = studentMapper.getStudentByNo("E11414051");
        print(student);
    }

    @Test
    public void insertTest(){
        Student student = new Student();
        student.setAge(20);
        student.setName("xiaoming");
        student.setNo("E11414051");

        studentMapper.insertStudent(student);
    }

    @Test
    public void updateTest(){
        Student student = studentMapper.getStudentByNo("E11414051");
        student.setName("xiaohua");
        studentMapper.updateStudent(student);
    }

    @Test
    public void deleteTest(){
        studentMapper.deleteStudentByNo("E11414051");
    }

    @Test
    public void countTest(){
        print(studentMapper.count());
    }

    public void print(Object object){
        System.out.println(JSON.toJSONString(object));
    }


}
