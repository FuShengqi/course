package com.fsq.mappers;

import com.fsq.entity.Teacher;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@Component
public interface TeacherMapper {

    List<Teacher> getAllTeachers();

    Teacher getTeacherByNo(String no);

    List<Teacher> getTeacherByName(String name);

    void insertTeacher(Teacher teacher);

    void updateTeacher(Teacher teacher);

    void deleteTeacherById(String id);

    Integer count();

}
