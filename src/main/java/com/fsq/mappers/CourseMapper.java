package com.fsq.mappers;

import com.fsq.entity.Course;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/15.
 */

@Component
public interface CourseMapper {

    Course getCourseByNo(String no);

    List<Course> getAllCourse();

    List<Course> getCourseByTno(String tno);

    void insertCourse(Course course);

    void updateCourse(Course course);

    void deleteCourseByNo(String no);

    Integer count();
}
