package com.fsq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@Controller
public class StudentController {

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

}
