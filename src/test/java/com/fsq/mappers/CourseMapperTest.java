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
 * Created by FuShengqi on 2017/10/15.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class CourseMapperTest {

    @Autowired
    private CourseMapper courseMapper;

    @Test
    public void selectTest(){
        Course course = courseMapper.getCourseByNo("ZH12345");
        p(course);
    }

    @Test
    public void selectAllTest(){
        List<Course> courses = courseMapper.getAllCourse();
        p(JSON.toJSONString(courses));
    }

    @Test
    public void countTest(){
        System.out.println(courseMapper.count());
    }

    @Test
    public void insertTest(){
        Course course = new Course();
        course.setNo("ZH12345");
        course.setName("数据结构");
        course.setCapacity(80);
        course.setCredit(4);
        course.setTime("1-1周,周一1,2节,周一1,2节");
        course.setClassPlace("博学北楼A101");

        courseMapper.insertCourse(course);
    }

    @Test
    public void updateTest(){
        Course course = courseMapper.getCourseByNo("ZH12345");
        course.setType("专业核心课");

        courseMapper.updateCourse(course);
    }

    @Test
    public void deleteTest(){
        courseMapper.deleteCourseByNo("ZH12345");
    }

    public void p(Object object){
        System.out.println(JSON.toJSONString(object));
    }

}
