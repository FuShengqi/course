package com.fsq.service;

import com.fsq.entity.Course;
import com.fsq.mappers.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/15.
 */

@Service
public class CourseService {

    @Autowired
    private CourseMapper courseMapper;

    public Course getCourseByNo(String no){
        return courseMapper.getCourseByNo(no);
    }

    public List<Course> getAllCourse(){
        return courseMapper.getAllCourse();
    }

    public void insertCourse(Course course){
        courseMapper.insertCourse(course);
    }

    public void updateCourse(Course course){
        courseMapper.updateCourse(course);
    }

    public void deleteCourseByNo(String no){
        courseMapper.deleteCourseByNo(no);
    }

    public int count(){
        return courseMapper.count();
    }

}
