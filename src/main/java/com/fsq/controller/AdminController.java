package com.fsq.controller;

import com.fsq.entity.Course;
import com.fsq.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@Controller
public class AdminController {

    @Autowired
    private CourseService courseService;

    /*管理员退出登录*/
    @RequestMapping("alogout.html")
    public void alogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie cookieName = new Cookie("aname", null);
        Cookie cookieNo = new Cookie("ano", null);
        cookieName.setMaxAge(0);
        cookieNo.setMaxAge(0);

        response.addCookie(cookieName);
        response.addCookie(cookieNo);

        request.setAttribute("error", null);
        response.sendRedirect("/");
    }

    @RequestMapping("import_course.html")
    public void importCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/import_course.jsp").forward(request, response);
    }

    @RequestMapping("import_course")
    @ResponseBody
    public String importCourseAction(HttpServletRequest request, HttpServletResponse response){
        Course course = getRequestCourse(request);
        courseService.insertCourse(course);

        return "success";
    }

    @RequestMapping("update_course")
    @ResponseBody
    public String updateCourse(HttpServletRequest request, HttpServletResponse response){
        Course course = getRequestCourse(request);
        courseService.updateCourse(course);

        return "success";
    }

    @RequestMapping("all_course_a.html")
    public ModelAndView allCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*request.getRequestDispatcher("/WEB-INF/jsp/all_course_a.jsp").forward(request, response);*/
        ModelAndView allCourse = new ModelAndView("all_course_a");
        List<Course> courses = courseService.getAllCourse();
        allCourse.addObject("courses", courses);
        return allCourse;
    }

    public Course getRequestCourse(HttpServletRequest request){
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String dept = request.getParameter("dept");
        String teacher = request.getParameter("teacher");

        int capacity = Integer.parseInt(request.getParameter("capacity"));
        int credit = Integer.parseInt(request.getParameter("credit"));
        String time = request.getParameter("time");
        String classPlace = request.getParameter("classPlace");

        String startWeek = request.getParameter("startWeek");
        String endWeek = request.getParameter("endWeek");
        String time1 = request.getParameter("time1");
        String time2 = request.getParameter("time2");
        String time3 = request.getParameter("time3");

        /*p("no = " + no);
        p("name = " + name);
        p("type = " + type);
        p("dept = " + dept);
        p("teacher = " + teacher);
        p("capacity = " + capacity);
        p("credit = " + credit);
        p("time = " + time);
        p("classPlace = " + classPlace);
        p("startWeek = " + startWeek);
        p("endWeek = " + endWeek);
        p("time1 = " + time1);
        p("time2 = " + time2);
        p("time3 = " + time3);*/

        Course course = new Course();
        course.setNo(no);
        course.setName(name);
        course.setType(type);
        course.setDept(dept);
        course.setTechNo(teacher);
        course.setCapacity(capacity);
        course.setCredit(credit);
        course.setTime(time);
        course.setClassPlace(classPlace);
        course.setStartWeek(startWeek);
        course.setEndWeek(endWeek);
        course.setTime1(time1);
        course.setTime2(time2);
        course.setTime3(time3);

        return course;
    }

    public void p(String string){
        System.out.println(string);
    }

    public void p(int i){
        System.out.println(i);
    }

}
