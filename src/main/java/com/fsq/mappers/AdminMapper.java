package com.fsq.mappers;

import com.fsq.entity.Admin;
import org.springframework.stereotype.Component;

/**
 * Created by FuShengqi on 2017/10/13.
 */

@Component
public interface AdminMapper {

    Admin getAdminByNo(String no);

    void insertAdmin(Admin admin);

    void updateAdminByNo(Admin admin);

}
