package com.fsq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by FuShengqi on 2017/10/12.
 */

@Controller
public class UserController {

    @RequestMapping("/")
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("errors", null);
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
    }



}
