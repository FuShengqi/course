package com.fsq.mappers;

import com.fsq.entity.Notify;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by FuShengqi on 2017/10/28.
 */

@Component
public interface NotifyMapper {

    void insert(Notify notify);

    List<Notify> getStudentNotify();

    List<Notify> getTeacherNotify();

    List<Notify> getAllNotifications();

    Notify getNotifyById(int id);

}
