package com.fsq.controller;

import com.alibaba.fastjson.JSON;
import com.fsq.entity.Course;
import com.fsq.entity.StuCos;
import com.fsq.service.CourseService;
import com.fsq.service.SCService;
import com.fsq.service.StudentService;
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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@Controller
public class StudentController {


    @Autowired
    private CourseService courseService;

    @Autowired
    private SCService scService;

    /*学生退出登录*/
    @RequestMapping("slogout.html")
    public void slogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie cookieName = new Cookie("sname", null);
        Cookie cookieNo = new Cookie("sno", null);
        cookieName.setMaxAge(0);
        cookieNo.setMaxAge(0);

        response.addCookie(cookieName);
        response.addCookie(cookieNo);

        request.setAttribute("error", null);
        response.sendRedirect("/");
    }

    @RequestMapping("all_course_s.html")
    public void allCourseA(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/all_course_s.jsp").forward(request, response);
    }

    @RequestMapping("all_course_s")
    @ResponseBody
    public List<Course> getAllCourseS(HttpServletRequest request, HttpServletResponse response){
        String no = request.getParameter("no");

        System.out.println(no);

        List<Course> courses = courseService.getAllCourse();
        for(Course course : courses){
            if(scService.getSCBySnoAndCno(no, course.getNo()) != null){
                course.setStatus("已选");
            } else {
                course.setStatus("未选");
            }
        }

        System.out.println(JSON.toJSONString(courses));

        return courses;
    }

    /*学生选课，前台使用ajax*/
    @RequestMapping("choose_course")
    @ResponseBody
    public String chooseCourse(HttpServletRequest request, HttpServletResponse response){
        String sno = request.getParameter("sno");
        String cno = request.getParameter("cno");

        System.out.println("sno = " + sno);
        System.out.println("cno = " + cno);

        if(scService.getSCBySnoAndCno(sno, cno) != null){
            return "error1"; //已选过该课程
        } else if(courseService.getCourseByNo(cno).getResidualCapacity() == 0){
            return "error2";    //课程容量限制
        } else {
            StuCos sc = new StuCos();
            sc.setCosNo(cno);
            sc.setStuNo(sno);

            scService.insert(sc);

            Course course = courseService.getCourseByNo(cno);
            course.setResidualCapacity(course.getResidualCapacity() - 1);
            courseService.updateCourse(course);

            return "success";
        }
    }

    /*学生查看已选择的课程*/
    @RequestMapping("course_selected.html")
    public ModelAndView courseSelected(){
        ModelAndView mav = new ModelAndView("course_selected");
        return mav;
    }

    /*前台已ajax方式请求，后台返回json格式的数据*/
    @RequestMapping("course_selected")
    @ResponseBody
    public List<Course> getCourseSelectedInJson(HttpServletRequest request, HttpServletResponse response){
        String sno = request.getParameter("no");
        List<String> cnos = scService.getCourseNoBySno(sno);
        System.out.println(JSON.toJSONString(cnos));


        List<Course> courses = new ArrayList<Course>();
        for(String cno : cnos){
            Course course = courseService.getCourseByNo(cno);
            if(course != null){
                course.setStatus("已选");
                courses.add(course);
            }
        }

        return courses;
    }

    @RequestMapping("drop_course")
    @ResponseBody
    public String dropCourse(HttpServletRequest request, HttpServletResponse response){
        String sno = request.getParameter("sno");
        String cno = request.getParameter("cno");

        Course course = courseService.getCourseByNo(cno);
        course.setResidualCapacity(course.getResidualCapacity() - 1);

        scService.deleteSc(sno, cno);
        return "success";
    }
}
