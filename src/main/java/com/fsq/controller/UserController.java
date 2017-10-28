package com.fsq.controller;

import com.fsq.entity.Admin;
import com.fsq.entity.Notify;
import com.fsq.entity.Student;
import com.fsq.entity.Teacher;
import com.fsq.mappers.NotifyMapper;
import com.fsq.service.AdminService;
import com.fsq.service.StudentService;
import com.fsq.service.TeacherService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * Created by FuShengqi on 2017/10/12.
 */

@Controller
public class UserController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private NotifyMapper notifyMapper;

    private String error = null;

    /*登录页*/
    @RequestMapping("/")
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("errors", null);
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
    }

    /*登录后的首页，登录角色不同，首页也不同*/
    @RequestMapping(value = "index.html", method = RequestMethod.POST)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        String password = request.getParameter("password");
        String type = request.getParameter("radio");

        /*System.out.println(no + " " + password + " " + type);*/

        if(type.equals("1") && studentService.login(no, password)){ //学生首页
            Student student = studentService.getStudentByNo(no);
            Cookie cookieName = new Cookie("sname", URLEncoder.encode(student.getName(), "UTF-8"));
            Cookie cookieNo = new Cookie("sno", no);

            response.addCookie(cookieName);
            response.addCookie(cookieNo);

            request.setAttribute("error", null);
            request.setAttribute("student", student);
            /*request.getRequestDispatcher("/WEB-INF/jsp/index_stu.jsp").forward(request, response);*/
            ModelAndView mav= new ModelAndView("index_stu");
            List<Notify> notifyList = notifyMapper.getStudentNotify();
            mav.addObject("notifyList", notifyList);
            return mav;
        } else if(type.equals("2") && teacherService.login(no, password)){  //教师首页
            Teacher teacher = teacherService.getTeacherByNo(no);
            Cookie cookieName = new Cookie("tname", URLEncoder.encode(teacher.getName(), "UTF-8"));
            Cookie cookieNo = new Cookie("tno", teacher.getNo());

            response.addCookie(cookieName);
            response.addCookie(cookieNo);

            request.setAttribute("error", null);
            request.setAttribute("teacher", teacher);
            /*request.getRequestDispatcher("/WEB-INF/jsp/index_tech.jsp").forward(request, response);*/
            ModelAndView mav = new ModelAndView("index_tech");
            List<Notify> notifyList = notifyMapper.getTeacherNotify();
            mav.addObject("notifyList", notifyList);
            return mav;
        } else if(type.equals("3") && adminService.login(no, password)){    //管理员首页
            Admin admin = adminService.getAdminByNo(no);
            Cookie cookieName = new Cookie("aname", URLEncoder.encode(admin.getName(), "UTF-8"));
            Cookie cookieNo = new Cookie("ano", admin.getNo());

            response.addCookie(cookieName);
            response.addCookie(cookieNo);

            request.setAttribute("error", null);
            request.setAttribute("admin", admin);
            /*request.getRequestDispatcher("/WEB-INF/jsp/index_admin.jsp").forward(request, response);*/

            ModelAndView mav = new ModelAndView("index_admin");
            List<Notify> notifyList = notifyMapper.getAllNotifications();
            mav.addObject("notifyList", notifyList);
            return mav;
        } else {
            error = "error";
            request.setAttribute("error", error);
            /*request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);*/
            return new ModelAndView("login");
        }
    }

}
