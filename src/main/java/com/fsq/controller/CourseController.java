package com.fsq.controller;

import com.fsq.entity.Course;
import com.fsq.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/18.
 */

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("all_course")
    @ResponseBody
    public List<Course> getAllCourse(){
        System.out.println("get all course");
        return courseService.getAllCourse();
    }

}
