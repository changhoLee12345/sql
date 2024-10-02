SELECT *
FROM   tab;

CREATE TABLE cart(no NUMBER primary key
                 ,product_nm VARCHAR2(50)
                 ,price NUMBER
                 ,qty NUMBER);

INSERT INTO cart
VALUES
    (1
    ,'코드 스프링'
    ,45000
    ,3);
INSERT INTO cart
VALUES
    (2
    ,'혼자 자바'
    ,35000
    ,1);

COMMIT;

SELECT *
FROM   tbl_cart;
SELECT *
FROM   tbl_cart
ORDER  BY 1;

CREATE TABLE tbl_cart(no NUMBER primary key
                     ,product_nm VARCHAR2(50)
                     ,price NUMBER
                     ,qty NUMBER);
INSERT INTO tbl_cart
VALUES
    (1
    ,'과테말라 안티구아'
    ,1200
    ,2);
INSERT INTO tbl_cart
VALUES
    (2
    ,'케냐 오크라톡신'
    ,1500
    ,2);
INSERT INTO tbl_cart
VALUES
    (3
    ,'코스타리카 따라주'
    ,1800
    ,2);
INSERT INTO tbl_cart
VALUES
    (4
    ,'니카라구아 더치핸드드립'
    ,2200
    ,2);
INSERT INTO tbl_cart
VALUES
    (5
    ,'브라질산토스'
    ,3200
    ,2);
INSERT INTO tbl_cart
VALUES
    (6
    ,'에티오피아 예가체프'
    ,3300
    ,2);
-----------------------------------------------------------------------------------------------------


drop TABLE prod_info purge;
CREATE TABLE prod_info(prod_code CHAR(4) primary key
                      ,prod_name VARCHAR2(100) NOT NULL
                      ,prod_desc VARCHAR2(500)
                      ,rct_price   NUMBER DEFAULT 1000
                      ,sale_price  NUMBER DEFAULT 2000
                      ,safe_qty    NUMBER DEFAULT 5
                      ,create_date DATE DEFAULT SYSDATE
                      ,update_date DATE DEFAULT SYSDATE);
INSERT INTO prod_info
    (prod_code
    ,prod_name
    ,prod_desc)
VALUES
    ('P001'
    ,'노트북1'
    ,'좋은노트북입니다.1');

SELECT *
FROM   prod_info;

CREATE TABLE in_out_txn(txn_id NUMBER primary key
                       ,prod_code CHAR(4) NOT NULL
                       ,qty NUMBER NOT NULL
                       ,txn_date  DATE DEFAULT SYSDATE);
CREATE sequence txn_seq;

INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P001'
    ,10
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P001'
    ,-5
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P001'
    ,-3
    ,SYSDATE);

INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P011'
    ,9
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P011'
    ,-5
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P012'
    ,9
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P012'
    ,-5
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P013'
    ,9
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P013'
    ,-5
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P015'
    ,9
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P015'
    ,-5
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P016'
    ,9
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P016'
    ,-5
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P017'
    ,9
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P017'
    ,-5
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P018'
    ,9
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P018'
    ,-5
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P019'
    ,9
    ,SYSDATE);
INSERT INTO in_out_txn
VALUES
    (txn_seq.nextval
    ,'P019'
    ,-5
    ,SYSDATE);
SELECT *
FROM   in_out_txn;

SELECT *
FROM   (SELECT ROWNUM rn
              ,prod_code
              ,qty
        FROM   (SELECT prod_code
                      ,SUM(qty) qty
                FROM   in_out_txn
                GROUP  BY prod_code
                --having sum(qty) > 0
                ORDER  BY prod_code) a
        WHERE  ROWNUM <= 10) b
WHERE  rn > 5;

SELECT COUNT(*)
FROM   (SELECT prod_code
        FROM   in_out_txn
        GROUP  BY prod_code
        HAVING SUM(qty) > 0);

SELECT *
FROM   prod_info
ORDER  BY 1;
