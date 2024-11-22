/*
    다대다 관계
    두 엔티티 사이에 다대다 관계가 존재할 수 있다.
    예시 : 학생과 과목, 고객과 상품 등
    다대다 관계는 두 엔티티의 직접 연결이 불가능하므로, 새로운 엔티티를 추가하여 2개의 일대다 관계로 구성한다.
*/

-- 학생 - 수강신청 - 과목
USE testdb;

DROP TABLE IF EXISTS tbl_register;
DROP TABLE IF EXISTS tbl_student;
DROP TABLE IF EXISTS tbl_class;

CREATE TABLE IF NOT EXISTS tbl_student
(
stud_id CHAR(5) NOT NULL COMMENT '학번',
stud_name VARCHAR(20) NOT NULL COMMENT '성명',
age TINYINT NOT NULL COMMENT '나이'
)ENGINE=INNODB COMMENT '학생 테이블';

CREATE TABLE IF NOT EXISTS tbl_class
(
class_code CHAR  NOT NULL PRIMARY KEY COMMENT '과목코드',
class_name VARCHAR(5) NOT NULL COMMENT '과목명',
prof_name VARCHAR(5) NOT NULL COMMENT '교수명'
) ENGINE=INNODB COMMENT '과목 테이블';

CREATE TABLE IF NOT EXISTS tbl_register
(
student_id CHAR(5) NOT NULL COMMENT '학번',
class_code CHAR(1) NOT NULL COMMENT '과목코드',
CONSTRAINT pk_enroll PRIMARY KEY(stud_id, course_id),
CONSTRAINT fk_student_enroll FOREIGN KEY(stud_id) PRIMARY KEY(student_id),
CONSTRAINT fk_course_enroll FOREIGN KEY(course_id) REFERENCES
) ENGINE=INNODB COMMENT '수강신청';