package com.fsq.mappers;

import com.fsq.entity.Student;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/12.
 */

@Component
public interface StudentMapper {

    Student getStudentByNo(String no);

    List<Student> getStudentByName(String name);

    void insertStudent(Student student);

    void updateStudent(Student student);

    void deleteStudentByNo(String no);

    Integer count();

}
