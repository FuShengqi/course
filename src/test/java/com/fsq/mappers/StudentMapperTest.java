package com.fsq.mappers;

import com.alibaba.fastjson.JSON;
import com.fsq.entity.Course;
import com.fsq.entity.Student;
import com.fsq.service.CourseService;
import com.fsq.service.SCService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by FuShengqi on 2017/10/12.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class StudentMapperTest {

    @Resource
    private StudentMapper studentMapper;

    @Resource
    private CourseService courseService;

    @Resource
    private SCService scService;

    @Test
    public void selectTest(){
        Student student = studentMapper.getStudentByNo("E11414051");
        print(student);
    }

    @Test
    public void insertTest(){
        Student student = new Student();
        student.setAge(20);
        student.setNo("E11414053");
        student.setPassword("123456");
        student.setMajor("计算机科学与技术");
        student.setClazz("14计科二班");
        student.setSex(false);
        student.setName("李华");

        studentMapper.insertStudent(student);
    }

    @Test
    public void updateTest(){
        Student student = studentMapper.getStudentByNo("E11414051");
        student.setName("小明");
        student.setMajor("计算机科学与技术");
        student.setClazz("14计科一班");
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

    @Test
    public void courseNotSelectedJson(){
        List<Course> allCourses = courseService.getAllCourse();
        for(Course course:allCourses){
            System.out.println(course.getNo());
        }
        print("------");
        List<String> sCnos = scService.getCourseNoBySno("E11414051");
        print(sCnos);

        List<Course> result = new ArrayList<Course>();
        for(String cno : sCnos){
            if(allCourses.contains(courseService.getCourseByNo(cno))){
                Course course = courseService.getCourseByNo(cno);
                course.setStatus("未选");
                result.add(course);
            }
        }

        print(result);
    }

    @Test
    public void justatest(){
        int s = 91;
        System.out.println((float) s /10);
    }

    public void print(Object object){
        System.out.println(JSON.toJSONString(object));
    }


}
