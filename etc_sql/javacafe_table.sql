SELECT *
FROM   tab;

SELECT *
FROM   all_users;

--CREATE USER javacafe identified BY javacafe;
--grant CONNECT, RESOURCE TO javacafe;

drop TABLE members purge;
CREATE TABLE members(user_no VARCHAR2(20)
                    ,password VARCHAR2(20)
                    ,NAME VARCHAR2(50)
                    ,email VARCHAR2(50)
                    ,phone VARCHAR2(20)
                    ,address1 VARCHAR2(50)
                    ,address2 VARCHAR2(50)
                    ,birth DATE
                    ,reg_date DATE
                    ,out_date DATE
                    ,grade VARCHAR2(10));

INSERT INTO members
VALUES
    ('user1'
    ,'user1'
    ,'name1'
    ,'email'
    ,'phone1'
    ,'address1'
    ,'address2'
    ,'2011-01-01'
    ,SYSDATE
    ,SYSDATE
    ,'A');

INSERT INTO members
    SELECT 'admin'
          ,'admin'
          ,m.name
          ,m.email
          ,m.phone
          ,m.address1
          ,m.address2
          ,m.birth
          ,SYSDATE
          ,SYSDATE
          ,'R'
    FROM   members m;

UPDATE members
SET    password = 'test'
WHERE  user_no = 'user1';

SELECT *
FROM   members;

drop TABLE goods purge;
CREATE TABLE goods(prod_no VARCHAR2(10)
                  ,prod_name VARCHAR2(50)
                  ,prod_content VARCHAR2(100)
                  ,onhand_qty NUMBER
                  ,prod_price NUMBER
                  ,off_price NUMBER
                  ,prod_category VARCHAR2(10)
                  ,useyn VARCHAR2(10)
                  ,prod_image VARCHAR2(300));

SELECT *
FROM   goods;

drop TABLE category purge;
CREATE TABLE category(category_id VARCHAR2(10)
                     ,category_name VARCHAR2(50)
                     ,category_desc VARCHAR2(300));

SELECT *
FROM   category
ORDER  BY 1;

DELETE FROM category
WHERE  category_id IS NULL
OR     category_id LIKE 'TEST%';

drop TABLE purge;
CREATE TABLE boards(bbsnum NUMBER
                   ,title VARCHAR2(500)
                   ,contents VARCHAR2(1000)
                   ,REF NUMBER
                   ,user_no VARCHAR2(100)
                   ,reg_date DATE
                   ,readcount NUMBER
                   ,re_step NUMBER
                   ,password_yn VARCHAR2(10)
                   ,prod_no VARCHAR2(20));

CREATE sequence boards_seq;
