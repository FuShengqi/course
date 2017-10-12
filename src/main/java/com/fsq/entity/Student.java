package com.fsq.entity;

import java.util.Date;

/**
 * Created by FuShengqi on 2017/10/12.
 */
public class Student {

    private int id;

    private String no;

    private String name;

    private boolean sex;

    private String grade;

    private String major;

    private int creditPassed;

    private int creditNotPassed;

    private float gpa;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public int getCreditPassed() {
        return creditPassed;
    }

    public void setCreditPassed(int creditPassed) {
        this.creditPassed = creditPassed;
    }

    public int getCreditNotPassed() {
        return creditNotPassed;
    }

    public void setCreditNotPassed(int creditNotPassed) {
        this.creditNotPassed = creditNotPassed;
    }

    public float getGpa() {
        return gpa;
    }

    public void setGpa(float gpa) {
        this.gpa = gpa;
    }
}
