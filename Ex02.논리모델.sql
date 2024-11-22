DROP database if EXISTS db_practice;

CREATE database if NOT EXISTS db_practice;

USE db_practice;

DROP TABLE IF EXISTS tbl_order_menu;
DROP TABLE IF EXISTS tbl_payment_order;
DROP TABLE IF EXISTS tbl_menu;
DROP TABLE IF EXISTS tbl_order;
DROP TABLE IF EXISTS tbl_category;
DROP TABLE IF EXISTS tbl_payment;

CREATE TABLE IF NOT EXISTS tbl_payment
(
payment_code INT NOT NULL AUTO_INCREMENT COMMENT '결제코드',
payment_date VARCHAR(8) NOT NULL COMMENT '결제일',
payment_time VARCHAR(8) NOT NULL COMMENT '결제시간',
payment_price INT NOT NULL COMMENT '결제금액',
payment_type VARCHAR(8) NOT NULL COMMENT '결제구분',
CONSTRAINT pk_pay PRIMARY KEY(payment_code)
) ENGINE = INNODB COMMENT '결제';

CREATE TABLE IF NOT EXISTS tbl_category
(
category_code INT NOT NULL AUTO_INCREMENT COMMENT '카테고리코드',
category_name VARCHAR(30) NOT NULL COMMENT '카테고리명',
ref_category_code INT COMMENT '상위카테고리코드',
CONSTRAINT pk_category PRIMARY KEY(category_code),
CONSTRAINT fk_ref_category FOREIGN KEY(ref_category_code) REFERENCES tbl_category(category_code)
) ENGINE = INNODB COMMENT '카테고리';

CREATE TABLE IF NOT EXISTS tbl_menu
(
 menu_code INT NOT NULL AUTO_INCREMENT COMMENT '메뉴코드',
 menu_name VARCHAR(30) NOT NULL COMMENT '메뉴명',
 menu_price INT NOT NULL COMMENT '메뉴가격',
 orderable_status CHAR(1) NOT NULL COMMENT '주문가능상태',
 category_code INT NOT NULL COMMENT '카테고리코드',
 CONSTRAINT pk_menu PRIMARY KEY(menu_code),
 CONSTRAINT fk_category_code FOREIGN KEY (category_code) REFERENCES tbl_category(category_code)
)ENGINE = INNODB COMMENT '메뉴';

CREATE TABLE IF NOT EXISTS tbl_order
(
order_code INT NOT NULL AUTO_INCREMENT COMMENT '주문코드',
order_date VARCHAR(8) NOT NULL COMMENT '주문일자',
order_time VARCHAR(8) NOT NULL COMMENT '주문시간',
total_order_price INT NOT NULL COMMENT '총주문금액',
CONSTRAINT pk_order PRIMARY KEY(order_code)
) ENGINE = INNODB COMMENT '주문';

CREATE TABLE IF NOT EXISTS tbl_order_menu
(
menu_code INT NOT NULL COMMENT '메뉴코드',
order_code INT NOT NULL COMMENT '주문코드',
order_amount INT NOT NULL COMMENT '주문수량',
CONSTRAINT pk_order_menu PRIMARY KEY(menu_code, order_code),
CONSTRAINT fk_ordermenu_menu FOREIGN KEY(menu_code) REFERENCES tbl_menu(menu_code),
CONSTRAINT fk_ordermenu_order FOREIGN KEY(order_code) REFERENCES tbl_order(order_code)
) ENGINE = INNODB COMMENT '주문메뉴';

CREATE TABLE IF NOT EXISTS tbl_payment_order
(
order_code INT NOT NULL COMMENT '주문코드',
payment_code INT NOT NULL COMMENT '결제코드',
CONSTRAINT pk_payment_order PRIMARY KEY(order_code, payment_code),
CONSTRAINT fk_pay_order FOREIGN KEY(order_code) REFERENCES tbl_order_menu(order_code),
CONSTRAINT fk_pay_code FOREIGN KEY(payment_code) REFERENCES tbl_payment(payment_code)
) ENGINE = INNODB COMMENT '주문결제';