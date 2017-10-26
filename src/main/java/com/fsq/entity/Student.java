package com.fsq.entity;

import java.util.Date;

/**
 * Created by FuShengqi on 2017/10/12.
 */
public class Student {

    private String no;

    private String password;

    private String name;

    private boolean sex;

    private String gender;

    private int age;

    private String grade;

    private String major;

    private int creditPassed;

    private int creditNotPassed;

    private float gpa;

    private String clazz;

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }
}
