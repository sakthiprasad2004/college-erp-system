-- =========================
-- College ERP Database Schema
-- =========================

-- Create Database
CREATE DATABASE IF NOT EXISTS college_erp;
USE college_erp;

-- =========================
-- USERS (Authentication)
-- =========================
CREATE TABLE IF NOT EXISTS users (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(20) NOT NULL
);

-- =========================
-- STUDENT
-- =========================
CREATE TABLE IF NOT EXISTS student (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  roll_no VARCHAR(50) UNIQUE,
  user_id BIGINT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =========================
-- FACULTY
-- =========================
CREATE TABLE IF NOT EXISTS faculty (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  user_id BIGINT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =========================
-- PARENT
-- =========================
CREATE TABLE IF NOT EXISTS parent (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  user_id BIGINT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- =========================
-- STUDENT ↔ PARENT MAPPING
-- =========================
CREATE TABLE IF NOT EXISTS student_parent (
  student_id BIGINT,
  parent_id BIGINT,
  PRIMARY KEY (student_id, parent_id),
  FOREIGN KEY (student_id) REFERENCES student(id),
  FOREIGN KEY (parent_id) REFERENCES parent(id)
);

-- =========================
-- COURSE
-- =========================
CREATE TABLE IF NOT EXISTS course (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  faculty_id BIGINT,
  FOREIGN KEY (faculty_id) REFERENCES faculty(id)
);

-- =========================
-- ATTENDANCE
-- =========================
CREATE TABLE IF NOT EXISTS attendance (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  student_id BIGINT,
  course_id BIGINT,
  date DATE,
  present BOOLEAN,
  FOREIGN KEY (student_id) REFERENCES student(id),
  FOREIGN KEY (course_id) REFERENCES course(id)
);

-- =========================
-- INTERNAL MARKS
-- =========================
CREATE TABLE IF NOT EXISTS internal_marks (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  student_id BIGINT,
  course_id BIGINT,
  test1 INT,
  test2 INT,
  assignment INT,
  total INT,
  FOREIGN KEY (student_id) REFERENCES student(id),
  FOREIGN KEY (course_id) REFERENCES course(id)
);
