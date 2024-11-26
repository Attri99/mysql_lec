USE db_company;

/* CROSS JOIN */
-- 조인 조건이 없는 조인 방식, CROSS JOIN 키워드 사용
-- 조인 조건이 잘못 작성된 경우에도 CROSS JOIN을 수행

-- 1. 모든 사원의 부서번호, 부서명, 사원번호, 사원명 조회하기
SELECT d.dept_id, e.dept_id, dept_name, emp_id, emp_name
FROM tbl_department d CROSS JOIN tbl_employee e;

/* INNER JOIN */
-- 두 테이블이 모두 가지고 있는 데이터를 조회할 때 사용.
-- 반드시 올바른 조인 조건을 작성해야 함.

-- 테이블 작성
-- FROM "Drive Table" JOIN "Driven Table"
-- 1 : M 관계를 유지하면서 FROM에 PK를 가지고 있는 Table을 적어준다.
-- "Drive Table" : 조인을 주동으로 하는 테이블. 관계 상 PK를 가진 테이블을 사용 (행 : ROW 적은 테이블 사용)
-- ON 절에서도 "Drive Table"의 칼럼을 먼저 작성


-- 2. 모든 사원의 부서번호, 부서명, 사원 번호, 사원명 조회하기
SELECT d.dept_id, e.dept_id, dept_name, emp_id, emp_name
FROM tbl_department d INNER JOIN tbl_employee e
    ON d.dept_id = e.dept_id;
    
-- 3. 대구에 근무하는 사원 조회하기
SELECT emp_id, e.dept_id, emp_name, position, gender, hire_date
 From tbl_department d INNER JOIN tbl_employee e
 ON d.dept_id = e.dept_id
Where location = '대구';

-- 4. 지역별 근무하는 사원 수 조회하기
SELECT location, COUNT(*)
FROM tbl_department d INNER JOIN tbl_employee e
ON d.dept_id = e.dept_id
GROUP BY location;

-- 5. (db_menu 스키마) 메뉴 코드, 메뉴명, 가격, 카테고리 이름, 주문가능여부 조회하기
USE db_practice;

SELECT menu_code, menu_name, menu_price, category_name, orderable_status
FROM tbl_category c INNER JOIN tbl_menu m
ON c.category_code = m.category_code;

/* OUTER JOIN */
-- 어느 한 테이블만 가지고 있는 데이터를 조회할 때 사용.
-- LEFT [OUTER] JOIN : 첫번째 테이블(왼쪽에 있음)의 모든 데이터는 항상 조회되는 방식
-- RIGHT [OUTER] JOIN : 두 번째 테이블(오른쪽에 있음)의 모든 데이터는 항상 조회되는 방식

-- 6. 부서별 사원 수 조회하기. 근무 중인 사원이 없으면 0을 표시. 
USE db_company;
SELECT dept_name, COUNT(emp_id) -- emp_id는 모든 사원이 가지고 있는 NOT NULL 이므로 COUNT 칼럼으로 지정한다.
    FROM tbl_department d LEFT JOIN tbl_employee e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, dept_name;

-- 7. (db_practice 스키마) 메뉴 이름, 모든 카테고리 이름 조회하기
USE db_practice;
SELECT menu_name, category_name
    FROM tbl_category c LEFT JOIN tbl_menu m
    ON c.category_code = m.category_code;
    
/* Self JOIN */    
-- 테이블 하나를 대상으로 행과 행 사이 관계를 찾는 조인

-- 8. 카테고리 이름, 상위 카테고리 이름 조회하기.

SELECT a.category_name AS 카테고리, b.category_name AS 상위카테고리
    FROM tbl_category a INNER JOIN tbl_category b
    ON a.ref_category_code = b.category_code
WHERE a.ref_category_code IS NOT NULL;




