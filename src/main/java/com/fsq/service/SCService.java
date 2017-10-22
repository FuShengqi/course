package com.fsq.service;

import com.fsq.entity.Course;
import com.fsq.entity.StuCos;
import com.fsq.mappers.StuCosMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/19.
 */

@Service
public class SCService {

    @Autowired
    private StuCosMapper stuCosMapper;

    public StuCos getSCBySnoAndCno(String sno, String cno){
        return stuCosMapper.getSCBySnoAndCno(sno, cno);
    }

    public List<String> getCourseNoBySno(String sno){
        return stuCosMapper.getCourseNoBySno(sno);
    }

    public List<String> getSnoByCno(String cno){
        return stuCosMapper.getSnoByCno(cno);
    }

    public void insert(StuCos stuCos){
        stuCosMapper.insert(stuCos);
    }

    public void importScore(String stuNo, String cosNo, float grade){
        stuCosMapper.updateGrade(stuNo, cosNo, grade);
    }

    public void deleteSc(String sno, String cno){
        stuCosMapper.deleteSC(sno, cno);
    }

}
