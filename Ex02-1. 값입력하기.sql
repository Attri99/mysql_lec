USE db_practice;

-- DELETE FROM tbl_category WHERE category_code >1;
AlTER TABLE tbl_category AUTO_INCREMENT = 1;
INSERT INTO tbl_category VALUES (null, '면류', null);
INSERT INTO tbl_category VALUES (null, '밥', null);
INSERT INTO tbl_category VALUES (null, '분식', null);

AlTER TABLE tbl_menu AUTO_INCREMENT = 1;

INSERT INTO tbl_menu VALUES (null, '라면', 5500, 'O', 1);
INSERT INTO tbl_menu VALUES (null, '떡볶이', 4000, 'O', 3);
INSERT INTO tbl_menu VALUES (null, '김치볶음밥', 8000, 'O', 2);
INSERT INTO tbl_menu VALUES (null, '콩국수', 9000, 'X', 1);
