USE db_company;

-- 1. 부서 테이블의 모든 데이터 조회하기

SELECT * -- * :  모든 칼럼을 의미한다. 실무에서는 사용 금지. (성능 이슈) */
FROM tbl_department;

-- 2. 부서 테이블에서 위치 조회하기

SELECT location
    FROM tbl_department;

-- 3. 부서 테이블에서 위치의 중복을 제거하고 조회하기
SELECT DISTINCT location -- 중복 제거 : DISTINCT
    FROM tbl_department;
    
-- 4. 칼럼에 별명 지정하기
SELECT 
    dept_id AS '부서 번호',
    dept_name AS '부서명',
    location AS '부서 위치'
    FROM tbl_department;
    
-- 5. 오너 명시(데이터베이스, 테이블)
SELECT 
    tbl_department.dept_id,
    tbl_department.dept_name,
    tbl_department.location
FROM 
    db_company.tbl_department; 
-- 6. 테이블에 지명 지정하기
SELECT 
        d.dept_id
        ,d.dept_name
        ,d.location
FROM 
    tbl_department d;
-- 7, 대구에 있는 부서 조회하기
SELECT dept_id, dept_name,location
FROM tbl_department
WHERE location = '대구';

-- 8. 부서번호가 1이고 연봉이 3000000 이상인 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date
FROM tbl_employee    
WHERE dept_id = 1 AND salary >= 3000000; -- 논리 연산자(AND, OR, NOT)

-- 9. 연봉이 300000~ 500000 사이인 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date
FROM tbl_employee
WHERE salary >= 3000000 AND salary <= 5000000;

-- 10. 직급이 '과장', '부장'인 사람 조회하기
SELECT emp_id, dept_id,emp_name, position, gender, hire_date
FROM tbl_employee
WHERE position = '과장' OR position ='부장';

-- 11. 직급이 '과장', '부장'이 아닌 사람 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date
FROM tbl_employee
WHERE position NOT IN ('과장', '부장'); -- position<>

-- 12. 사원명이 '한'으로 시작하는 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date
FROM tbl_employee
WHERE emp_name LIKE '한%'; -- % : 와일드 카드(만능 문자: 글자 수에 상관 없이 사용가능)
                           -- LIKE 연산자 : 와일드 카드 전용 연산자

-- 13. 사원명에 '민'을 포함하는 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date
FROM tbl_employee
WHERE emp_name LIKE CONCAT('%', '민', '%');

-- 14. (db_menu 스키마) 상위카테고릐코드가 없는 카테고리 조회하기
USE db_practice;
SELECT category_code,  category_name, ref_category_code
FROM db_practice.tbl_category
WHERE ref_category_code IS NULL;

-- 15. (db_menu 스키마) 상위 카테고리 코드가 있는 카테고리 조회하기 
SELECT category_code,  category_name, ref_category_code
FROM tbl_category
WHERE ref_category_code IS NOT NULL;

/* GROUP BY ~ HAVING ~ */
USE db_company;
SELECT emp_name
    FROM tbl_employee
    GROUP BY position;

-- 16. 직급별로 그룹화하여 연봉의 평균 조회하기 
SELECT position, AVG(salary) -- GROUP BY 절에 명시한 칼럼만 조회
FROM tbl_employee 
GROUP BY position; -- 직급별로 그룹화 작업

-- 17. 부서별로 사원 수 조회하기(어느 한 칼럼이라도 값을 가지고 있으면 카운트에 포함한다.)
SELECT dept_id, COUNT(*) AS 사원수
FROM tbl_employee
GROUP BY dept_id;

-- 18. 직급별 연봉의 평균이 5000000 이상인 직급 조회하기
SELECT position, AVG(salary)
    FROM tbl_employee
    GROUP BY position
    HAVING AVG(salary) >= 5000000; -- HAVING 절에서 통계 함수를 이용한 조건식을 사용할 수 있다.
 
-- 사용 불가능한 쿼리문 
SELECT position, AVG(salary)
    FROM tbl_employee
    WHERE AVG(salary) >= 5000000 -- 통계 함수는 WHERE 절에 
    GROUP BY position;
    
-- 19. 직급별 사원 수 구하기. 직급이 '과장'인 직급만 조회하기
SELECT position, COUNT(*)
    FROM tbl_employee
    WHERE position = '과장' -- '과장' 데이터로 sampling 데이터를 줄여서 그룹화 성능을 올릴 수 있다.
    GROUP BY position;
        
SELECT position, COUNT(*)
        FROM tbl_employee   -- sampling 데이터가 10000개
        GROUP BY position -- sampling 데이터 전체를 대상으로 그룹
        HAVING position = '과장';
        
/* ORDER BY 절 */

-- 20. 사원명 순으로 사원 조회하기


-- 21. 직급의 오름차순, 동일 직급은 고용일의 내림차순 정리
SELECT emp_id, dept_id, position, gender, hire_date
FROM tbl_employee
ORDER BY position, hire_date DESC; -- position ASC, hire date DESC

/* LIMIT */
-- 일반적 패턴 : 원하는 기준으로 정렬한 뒤 일부만 조회

-- 22. 가장 먼저 입사한 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date
    FROM tbl_employee
    ORDER BY hire_date
   LIMIT 0, 1; -- 첫 번째 행(0)부터 1개 행 조회. LIMIT 1;

-- 23. 급여가 2~3번째로 높은 사원 조회하기.
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
 FROM tbl_employee
 ORDER BY salary DESC
 LIMIT 1, 2; -- 2행(1)부터 2개 행 조회.