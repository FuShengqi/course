package com.fsq.controller;

import com.fsq.entity.Course;
import com.fsq.service.CourseService;
import com.fsq.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.List;

/**
 * Created by FuShengqi on 2017/10/18.
 */

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("all_course")
    @ResponseBody
    public List<Course> getAllCourse(){
        System.out.println("get all course");
        return courseService.getAllCourse();
    }

    @RequestMapping("course_detail")
    public void courseDetail(HttpServletRequest request, HttpServletResponse response, Writer writer) throws IOException {
        String no = request.getParameter("no");
        Course course = courseService.getCourseByNo(no);

        StringBuffer html = new StringBuffer();
        html.append("<table class=\"table table-bordered table-condensed table-striped\">");
        html.append("<tr>\n" +
                "        <th>课程代码</th>\n" +
                "        <th>课程名称</th>\n" +
                "        <th>课程性质</th>\n" +
                "        <th>学分</th>\n" +
                "        <th>老师</th>\n" +
                "        <th>上课时间</th>\n" +
                "        <th>上课地点</th>\n" +
                "        <th>容量</th>\n" +
                "    </tr>");
        html.append("<tr>\n" +
                "        <td>" + course.getNo() + "</td>\n" +
                "        <td>" + course.getName() + "</td>\n" +
                "        <td>" + course.getType() + "</td>\n" +
                "        <td>" + course.getCredit() + "</td>\n" +
                "        <td>" + teacherService.getTeacherByNo(course.getTechNo()).getName() + "</td>\n" +
                "        <td>" + course.getTime() + "</td>\n" +
                "        <td>" + course.getClassPlace() + "</td>\n" +
                "        <td>" + course.getCapacity() + "</td>\n" +
                "    </tr>");
        html.append("</table>");
        writer.write(html.toString());

        System.out.println(course.getTechNo());
        System.out.println(teacherService.getTeacherByNo(course.getTechNo()).getName());

    }

    @RequestMapping("delete_course")
    @ResponseBody
    public String deleteCourse(String no){
        courseService.deleteCourseByNo(no);
        return "success";
    }

    /*@RequestMapping("edit_course")
    public void editCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String no = request.getParameter("no");
        Course course = courseService.getCourseByNo(no);
        request.setAttribute("course", course);
        request.getRequestDispatcher("/WEB-INF/jsp/edit_course.jsp").forward(request, response);
    }*/

    @RequestMapping("edit_course")
    public ModelAndView editCourse(HttpServletRequest request, HttpServletResponse response){
        String no = request.getParameter("no");
        Course course = courseService.getCourseByNo(no);
        ModelAndView editCourse = new ModelAndView("edit_course");
        editCourse.addObject("course", course);
        return editCourse;
    }

}
