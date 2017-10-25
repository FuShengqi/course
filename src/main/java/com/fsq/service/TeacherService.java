package com.fsq.service;

import com.fsq.entity.Teacher;
import com.fsq.mappers.TeacherMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@Service
public class TeacherService {

    @Resource
    private TeacherMapper teacherMapper;

    public boolean login(String no, String password){
        Teacher teacher = teacherMapper.getTeacherByNo(no);
        if(teacher != null && teacher.getPassword().equals(password)){
            return true;
        } else {
            return false;
        }
    }

    public Teacher getTeacherByNo(String no){
        return teacherMapper.getTeacherByNo(no);
    }

    public boolean changePasswd(String tno, String oldPasswd, String newPasswd){
        Teacher teacher = teacherMapper.getTeacherByNo(tno);

        if(teacher.getPassword().equals(oldPasswd)){
            teacher.setPassword(newPasswd);
            teacherMapper.updateTeacher(teacher);
            return true;
        } else {
            return false;
        }
    }

}
