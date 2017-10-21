package com.fsq.mappers;

import com.fsq.entity.Course;
import com.fsq.entity.StuCos;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/19.
 */

@Component
public interface StuCosMapper {

    StuCos getSCBySnoAndCno(String sno, String cno);

    List<String> getCourseNoBySno(String sno);

    List<String> getSnoByCno(String cno);

    void insert(StuCos stuCos);

    void deleteSC(String sno, String cno);

}
