package com.fsq.controller;

import com.fsq.entity.Course;
import com.fsq.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String dept = request.getParameter("dept");
        String teacher = request.getParameter("teacher");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        int credit = Integer.parseInt(request.getParameter("credit"));
        String time = request.getParameter("time");
        String classPlace = request.getParameter("classPlace");

        p("no = " + no);
        p("name = " + name);
        p("type = " + type);
        p("dept = " + dept);
        p("teacher = " + teacher);
        p("capacity = " + capacity);
        p("credit = " + credit);
        p("time = " + time);
        p("classPlace = " + classPlace);

        Course course = new Course();
        course.setNo(no);
        course.setName(name);
        course.setType(type);
        course.setTechNo(teacher);
        course.setCapacity(capacity);
        course.setCredit(credit);
        course.setTime(time);
        course.setClassPlace(classPlace);

        courseService.insertCourse(course);


        return "success";
    }

    @RequestMapping("all_course_a.html")
    public void allCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/all_course_a.jsp").forward(request, response);
    }

    public void p(String string){
        System.out.println(string);
    }

    public void p(int i){
        System.out.println(i);
    }

}
