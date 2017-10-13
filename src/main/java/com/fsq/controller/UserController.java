package com.fsq.controller;

import com.fsq.entity.Student;
import com.fsq.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * Created by FuShengqi on 2017/10/12.
 */

@Controller
public class UserController {

    @Autowired
    private StudentService studentService;

    /*登录页*/
    @RequestMapping("/")
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("errors", null);
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
    }

    @RequestMapping(value = "index.html", method = RequestMethod.POST)
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        String password = request.getParameter("password");
        String type = request.getParameter("radio");

        System.out.println(no + " " + password + " " + type);

        if(type.equals("1") && studentService.login(no, password)){
            Student student = studentService.getStudentByNo(no);
            Cookie cookieName = new Cookie("sname", URLEncoder.encode(student.getName(), "UTF-8"));
            Cookie cookieNo = new Cookie("sno", no);

            response.addCookie(cookieName);
            response.addCookie(cookieNo);

            request.getRequestDispatcher("/WEB-INF/jsp/index_stu.jsp").forward(request, response);
        }
    }

}
