CREATE DATABASE course_db DEFAULT CHARACTER SET = utf8;

-- 学生表
CREATE TABLE t_student(
  id INT NOT NULL AUTO_INCREMENT,
  no CHAR(20) PRIMARY KEY,
  name CHAR(20),
  sex BOOL,
  birthday DATE,
  major CHAR(20),
  credit_passed INT,
  credit_not_passed INT,
  gpa FLOAT,
  home_address CHAR(50)
);

-- 教师表
CREATE TABLE t_teacher(
  id INT NOT NULL AUTO_INCREMENT,
  no CHAR(20) PRIMARY KEY,
  name char(20),
  sex BOOL,
  major char(20)
);

-- 管理员表
CREATE TABLE t_admin(
  id INT NOT NULL AUTO_INCREMENT,
  no CHAR(20) PRIMARY KEY,
  name CHAR(20)
);

-- 课程表
CREATE TABLE t_course(
  id INT NOT NULL AUTO_INCREMENT,
  no CHAR(20),
  name CHAR(20),
  creadit INT,
  type INT,
  tech_no CHAR(20),
  start_time DATE,
  end_time DATE,
  class_place char(32),
  FOREIGN KEY (tech_no) REFERENCES t_teacher(no)
);

-- 选课表
CREATE TABLE t_sc (
  id INT NOT NULL AUTO_INCREMENT,
  cos_no CHAR(20),
  stu_no CHAR(20),
  grade INT,
  FOREIGN KEY (cos_no) REFERENCES t_course(no),
  FOREIGN KEY (stu_no) REFERENCES t_student(no)
);