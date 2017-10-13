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

}
