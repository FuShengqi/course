package com.fsq.service;

import com.fsq.entity.Student;
import com.fsq.mappers.StudentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by FuShengqi on 2017/10/12.
 */

@Service
public class StudentService {

    @Resource
    private StudentMapper studentMapper;

    public boolean login(String no, String password){
        Student student = studentMapper.getStudentByNo(no);
        if(student != null && student.getPassword().equals(password)){
            return true;
        } else {
            return false;
        }
    }

    public Student getStudentByNo(String no){
        return studentMapper.getStudentByNo(no);
    }

    public boolean changePassword(String no, String oldPasswd, String newPasswd){
        Student student = studentMapper.getStudentByNo(no);
        if(!student.getPassword().equals(oldPasswd)){
            return false;
        } else {
            student.setPassword(newPasswd);
            studentMapper.updateStudent(student);
            return true;
        }
    }

    public void update(Student student){
        studentMapper.updateStudent(student);
    }

    public void deleteStudentByNo(String no){
        studentMapper.deleteStudentByNo(no);
    }

}
