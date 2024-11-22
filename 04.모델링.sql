

DROP DATABASE IF EXISTS db_company;

CREATE DATABASE IF NOT EXISTS db_company;

USE db_company;

DROP TABLE IF EXISTS tbl_proj_emp;
DROP TABLE IF EXISTS tbl_employee;
DROP TABLE IF EXISTS tbl_department;
DROP TABLE IF EXISTS tbl_project;

CREATE TABLE IF NOT EXISTS tbl_department
(
dept_id INT NOT NULL AUTO_INCREMENT COMMENT '부서아이디',
dept_name VARCHAR(30) COMMENT '부서명',
location VARCHAR(50) COMMENT '위치',
CONSTRAINT pk_dept PRIMARY KEY(dept_id)
) ENGINE = INNODB COMMENT '부서 테이블';

CREATE TABLE IF NOT EXISTS tbl_employee
(
    emp_id  INT NOT NULL AUTO_INCREMENT COMMENT '사원아이디',
    dept_id INT COMMENT '부서아이디',
    emp_name VARCHAR(15) COMMENT '사원명',
    position CHAR(10) COMMENT '직급',
    gender CHAR(1) COMMENT '성별',
    hire_date DATE COMMENT '입사날짜',
    salary INT COMMENT '연봉',
    CONSTRAINT pk_emp PRIMARY KEY(emp_id),
    CONSTRAINT fk_dept_emp FOREIGN KEY(dept_id) REFERENCES tbl_department(dept_id)
) ENGINE=INNODB COMMENT '사원 테이블';

CREATE TABLE IF NOT EXISTS tbl_project
(
proj_id INT NOT NULL AUTO_INCREMENT COMMENT '프로젝트아이디',
proj_name VARCHAR(30) COMMENT '프로젝트명',
begin_date DATE COMMENT '시작일자',
end_date DATE COMMENT '종료일자',
CONSTRAINT pk_proj PRIMARY KEY(proj_id)
) ENGINE=INNODB COMMENT '프로젝트 테이블'; 

CREATE TABLE IF NOT EXISTS tbl_proj_emp
(
reg_id INT NOT NULL AUTO_INCREMENT COMMENT '등록아이디',
emp_id INT COMMENT '사원아이디',
proj_id INT COMMENT '프로젝트아이디',
state INT NOT NULL COMMENT '진행상태',
CONSTRAINT pk_proj_emp PRIMARY KEY(reg_id),
CONSTRAINT fk_emp_projemp FOREIGN KEY (emp_id) REFERENCES tbl_employee(emp_id),
CONSTRAINT fk_proj_projemp FOREIGN KEY (proj_id) REFERENCES tbl_project(proj_id)
) ENGINE =INNODB COMMENT '프로젝트 사원 테이블';





