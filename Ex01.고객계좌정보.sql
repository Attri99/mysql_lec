USE testdb;

DROP TABLE IF EXISTS customer_tbl CASCADE;
DROP TABLE IF EXISTS bank_tbl CASCADE;

CREATE TABLE IF NOT EXISTS bank_tbl
(
  bank_id   VARCHAR(20) NOT NULL COMMENT '계좌번호',
  bank_name VARCHAR(30) COMMENT '은행이름',
  CONSTRAINT pk_bank PRIMARY KEY(bank_id) -- 제약조건에 이름 붙여주기
) ENGINE=INNODB COMMENT '계좌 정보';

CREATE TABLE IF NOT EXISTS customer_tbl
(
    cust_id INT NOT NULL AUTO_INCREMENT COMMENT '고객ID',
    cust_name   VARCHAR(30) NOT NULL COMMENT '고객명',
    phone VARCHAR(30) UNIQUE COMMENT '전화번호',
    age SMALLINT CHECK(age BETWEEN 0 AND 100) COMMENT '나이',
    bank_id VARCHAR(20),
    CONSTRAINT pk_customer PRIMARY KEY(cust_id),
    CONSTRAINT fk_bank_customer FOREIGN KEY(bank_id) REFERENCES bank_tbl(bank_id)
) ENGINE=INNODB COMMENT '고객 정보';

