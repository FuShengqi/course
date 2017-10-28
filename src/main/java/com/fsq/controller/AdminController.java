package com.fsq.controller;

import com.fsq.entity.*;
import com.fsq.mappers.NotifyMapper;
import com.fsq.service.*;
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
    private AdminService adminService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private SCService scService;

    @Autowired
    private NotifyMapper notifyMapper;

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
        course.setResidualCapacity(capacity);
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

    @RequestMapping("reset_passwd.html")
    public ModelAndView resetPasswd(){
        return new ModelAndView("reset_passwd");
    }

    @RequestMapping("reset_passwd")
    @ResponseBody
    public String resetPasswd(HttpServletRequest request, HttpServletResponse response){
        String oldPasswd = request.getParameter("oldPasswd");
        String newPasswd = request.getParameter("newPasswd");
        String ano = request.getParameter("ano");

        if(adminService.resetPasswd(oldPasswd, newPasswd, ano)){
            return "1";
        } else {
            return "0";
        }
    }

    @RequestMapping("teacher_manage.html")
    public ModelAndView teacherManage(){
        return new ModelAndView("teacher_manage");
    }

    @RequestMapping("teacher_info")
    @ResponseBody
    public List<Teacher> teacherInfoJson(){
        List<Teacher> teachers = teacherService.getAllTeachers();
        return teachers;
    }


    @RequestMapping("edit_teacher")
    public ModelAndView editTeacher(HttpServletRequest request, HttpServletResponse response){
        String tno = request.getParameter("no");
        Teacher teacher = teacherService.getTeacherByNo(tno);

        ModelAndView mav = new ModelAndView("edit_teacher");
        mav.addObject("teacher", teacher);
        return mav;
    }


    @RequestMapping("update_teacher")
    @ResponseBody
    public String updateTeacher(HttpServletRequest request){
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String dept = request.getParameter("dept");
        String password = request.getParameter("password");

        Teacher teacher = teacherService.getTeacherByNo(no);
        teacher.setName(name);
        teacher.setGender(gender);
        teacher.setAge(Integer.parseInt(age));
        teacher.setDept(dept);
        teacher.setPassword(password);

        teacherService.updateTeacher(teacher);

        return "1";

    }

    @RequestMapping("delete_teacher")
    @ResponseBody
    public String deleteTeacher(HttpServletRequest request){
        String tno = request.getParameter("tno");
        teacherService.deleteTeacherByNo(tno);
        return "1";
    }

    @RequestMapping("student_manage.html")
    public ModelAndView studentManage(){
        return new ModelAndView("student_manage");
    }

    @RequestMapping("search_student")
    @ResponseBody
    public Student search(HttpServletRequest request){
        String sno = request.getParameter("sno");
        Student student = studentService.getStudentByNo(sno);
        if(student != null){
            return student;
        } else {
            Student student1 = new Student();
            student1.setNo("0");
            return student1;
        }
    }

    @RequestMapping("edit_student")
    public ModelAndView editStudent(HttpServletRequest request){
        String sno = request.getParameter("sno");
        ModelAndView mav = new ModelAndView("edit_student");
        Student student = studentService.getStudentByNo(sno);
        mav.addObject("student", student);
        return mav;
    }

    @RequestMapping("update_student")
    @ResponseBody
    public String updateStudent(HttpServletRequest request){
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String major = request.getParameter("major");
        String password = request.getParameter("password");
        String clazz = request.getParameter("clazz");

        System.out.print(major+"/n");

        Student student = new Student();
        student.setNo(no);
        student.setName(name);
        student.setGender(gender);
        student.setAge(Integer.parseInt(age));
        student.setMajor(major);
        student.setPassword(password);
        student.setClazz(clazz);

        studentService.update(student);

        return "1";
    }

    @RequestMapping("delete_student")
    @ResponseBody
    public String deleteStudent(String sno){
        studentService.deleteStudentByNo(sno);
        return "1";
    }

    /*向特定的学生导入课程*/
    @RequestMapping("add_course")
    public ModelAndView addCourse(String sno){
        Student student = studentService.getStudentByNo(sno);
        ModelAndView mav = new ModelAndView("add_course");
        mav.addObject("student", student);
        return mav;
    }

    @RequestMapping("insert_sc")
    @ResponseBody
    public String insertSC(String sno, String cno, String tno){
        StuCos sc = new StuCos();
        sc.setStuNo(sno);
        sc.setCosNo(cno);
        sc.setTechNo(tno);

        scService.insert(sc);
        return "1";
    }

    @RequestMapping("add_notification")
    @ResponseBody
    public String addNotification(HttpServletRequest request, HttpServletResponse response){
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String receiver = request.getParameter("receiver");
        String publisher = request.getParameter("publisher");
        String time = request.getParameter("time");

        Notify notify = new Notify();
        notify.setTitle(title);
        notify.setContent(content);
        notify.setPublisher(publisher);
        notify.setReceiver(Integer.parseInt(receiver));
        notify.setTime(time);

        notifyMapper.insert(notify);

        return "1";
    }

    @RequestMapping("all_notifications.html")
    public ModelAndView allNotifications(){
        List<Notify> notifyList = notifyMapper.getAllNotifications();
        ModelAndView mav = new ModelAndView("an");
        mav.addObject("notifyList", notifyList);
        return mav;
    }

    @RequestMapping("edit_notification")
    public ModelAndView editNotification(){
        return new ModelAndView("edit_notification");
    }

    @RequestMapping("show_detail")
    public ModelAndView showDetail(String id){
        int idd = Integer.parseInt(id);
        Notify notify = notifyMapper.getNotifyById(idd);

        ModelAndView mav = new ModelAndView("notify_detaila");
        mav.addObject("notify", notify);
        return mav;
    }

    public void p(String string){
        System.out.println(string);
    }

    public void p(int i){
        System.out.println(i);
    }

}
