-- CREATE DATABASE course_db DEFAULT CHARACTER SET = utf8;

-- 学生表
CREATE TABLE t_student(
  no CHAR(20) PRIMARY KEY,
  password CHAR(20),
  name CHAR(20),
  sex BOOL,
  age INT,
  grade CHAR(20),
  major CHAR(20),
  credit_passed INT,
  credit_not_passed INT,
  gpa FLOAT,
  class CHAR(20)
);

-- 教师表
CREATE TABLE t_teacher(
  no CHAR(20) PRIMARY KEY,
  password CHAR(20),
  name char(20),
  sex BOOL,
  gender CHAR(3),
  age INT,
  dept char(20)
);

-- 管理员表
CREATE TABLE t_admin(
  no CHAR(20) PRIMARY KEY,
  password CHAR(20),
  name CHAR(20)
);

-- 课程表
CREATE TABLE t_course(
  no CHAR(20) PRIMARY KEY,
  name CHAR(20),
  credit INT,
  type CHAR(20),
  tech_no CHAR(20),
  start_week CHAR(20),
  end_week CHAR(20),
  class_place char(32),
  capacity INT,
  residual_capacity INT,
  dept CHAR(20),
  time CHAR(32),
  time1 CHAR(32),
  time2 CHAR(32),
  time3 CHAR(32),
  FOREIGN KEY (tech_no) REFERENCES t_teacher(no)
);

-- 选课表
CREATE TABLE t_sc (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cos_no CHAR(20),
  stu_no CHAR(20),
  grade INT,
  FOREIGN KEY (cos_no) REFERENCES t_course(no),
  FOREIGN KEY (stu_no) REFERENCES t_student(no)
);