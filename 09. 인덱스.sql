USE db_company;


/* 클러스터 인덱스 : PK에 부여된 인덱스 */

-- 1. 인덱스 태우기 
SELECT dept_id, dept_name, location
    FROM tbl_department
    WHERE dept_id = 1; -- 인덱스가 설정된 칼럼으로 조회
    
-- 2. (인덱스 안 태우기) 부서명이 '영업부'인 부서 조회하기
SELECT dept_id, dept_name, location
    FROM tbl_department
    WHERE dept_name = '영업부';
    
-- 3. 부서번호가 1 이삳ㅇ인 부서 조회하기
SELECT dept_id, dept_name, location
    FROM tbl_department
    WHERE dept_id >= 1; -- 인덱스의 범위 조건은 검색 엔진이 Index Range Scan 또는 Full Table Scan 중 선택해서 동작한다. 