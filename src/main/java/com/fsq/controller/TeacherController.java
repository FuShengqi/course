package com.fsq.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fsq.entity.Course;
import com.fsq.entity.StuCos;
import com.fsq.entity.Student;
import com.fsq.service.CourseService;
import com.fsq.service.SCService;
import com.fsq.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@Controller
public class TeacherController {


    @Autowired
    private CourseService courseService;

    @Autowired
    private SCService scService;

    @Autowired
    private StudentService studentService;

    /*老师退出登录*/
    @RequestMapping("tlogout.html")
    public void tlogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie cookieName = new Cookie("tname", null);
        Cookie cookieNo = new Cookie("tno", null);
        cookieName.setMaxAge(0);
        cookieNo.setMaxAge(0);

        response.addCookie(cookieName);
        response.addCookie(cookieNo);

        request.setAttribute("error", null);
        response.sendRedirect("/");
    }

    @RequestMapping("my_course.html")
    public ModelAndView myCourse(){
        ModelAndView mav = new ModelAndView("my_course");
        return mav;
    }

    /*显示该老师所教授的课程，ajax请求*/
    @RequestMapping("my_course")
    @ResponseBody
    public List<Course> myCourse(HttpServletRequest request, HttpServletResponse response){
        String tno = request.getParameter("tno");
        List<Course> courses = courseService.getCourseByTno(tno);
        return courses;
    }

    /*返回选择特定课程的学生信息的html表格*/
    @RequestMapping("show_students")
    public void StudentsInJson(HttpServletRequest request, HttpServletResponse response, Writer writer) throws IOException {
        String cno = request.getParameter("cno");
        String tno = request.getParameter("tno");

        System.out.println("cno = " + cno);

        List<String> snos = scService.getSnoByCno(cno);
        List<Student> students = new ArrayList<Student>();
        for(String sno : snos){
            students.add(studentService.getStudentByNo(sno));
        }

        StringBuffer html = new StringBuffer();
        html.append("<table class=\"table table-bordered table-condensed table-striped\">");
        html.append("<tr>\n" +
                "        <th>学号</th>\n" +
                "        <th>姓名</th>\n" +
                "        <th>性别</th>\n" +
                "        <th>专业</th>\n" +
                "        <th>班级</th>\n" +
                "    </tr>\n");

        for(Student student : students){

            String sex;
            if(student.isSex()){
                sex = "女";
            } else {
                sex = "男";
            }
            html.append("<tr>\n" +
                    "        <td>" + student.getNo() + "</td>\n" +
                    "        <td>" + student.getName() + "</td>\n" +
                    "        <td>" + sex + "</td>\n" +
                    "        <td>" + student.getMajor() + "</td>\n" +
                    "        <td>" + student.getClazz() + "</td>\n" +
                    "    </tr>\n");
        }


        html.append("</table>");
        writer.write(html.toString());
    }


    @RequestMapping("import_score.html")
    public ModelAndView importScore(){
        ModelAndView mav = new ModelAndView("import_score");
        return mav;
    }


    @RequestMapping("import_score")
    @ResponseBody
    public List<Student> importScore(HttpServletRequest request){
        String cno = request.getParameter("cno");

        System.out.println("cno = " + cno);

        List<String> snos = scService.getSnoByCno(cno);
        List<Student> students = new ArrayList<Student>();
        for(String sno : snos){
            students.add(studentService.getStudentByNo(sno));
        }

        System.out.println(JSON.toJSONString(students));

        return students;
    }


    @RequestMapping("input_score")
    @ResponseBody
    public String inputScore(String scores){
        System.out.println(scores);

        JSONArray scs = JSON.parseArray(scores);
        for(int i=0; i<scs.size(); i++){
            JSONObject sc = scs.getJSONObject(i);
            System.out.print(sc.get("grade")+" "+sc.get("stuNo")+""+sc.get("cosNo"));
            String sno = (String) sc.get("stuNo");
            String cno = (String) sc.get("cosNo");
            float grade = Float.parseFloat((String) sc.get("grade"));
            scService.importScore(sno, cno, grade);
        }

        return "success";
    }

}
