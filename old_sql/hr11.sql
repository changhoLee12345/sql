SELECT *
FROM   tab;

SELECT *
FROM   emp
ORDER  BY 1 DESC;

INSERT INTO emp
    SELECT employees_seq.nextval
          ,first_name
          ,last_name
          ,email
          ,phone_number
          ,hire_date
          ,job_id
          ,salary
          ,commission_pct
          ,manager_id
          ,department_id
    FROM   employees;

SELECT *
FROM   (SELECT ROWNUM rn, a.*
        FROM   (SELECT *
                FROM   employees
                ORDER  BY 1) a) b
WHERE  b.rn >= 1
AND    b.rn <= 10;

SELECT *
FROM   emp;

SELECT *
FROM   fileboard;

CREATE TABLE comments(id NUMBER
                     ,NAME VARCHAR2(100)
                     ,contents VARCHAR2(300));

CREATE TABLE id_repository(VALUE NUMBER
                          ,NAME VARCHAR2(30));

drop TABLE fileboard purge;
CREATE TABLE fileboard(num NUMBER primary key
                      ,author VARCHAR2(100)
                      ,title VARCHAR2(300)
                      ,filename1 VARCHAR2(100)
                      ,filename2 VARCHAR2(100)
                      ,filename3 VARCHAR2(100)
                      ,DAY DATE);
SELECT *
FROM   fileboard;

CREATE TABLE product_item(product_code VARCHAR2(10) primary key
                         ,product_name VARCHAR2(300)
                         ,product_desc VARCHAR2(2000)
                         ,product_image VARCHAR2(300)
                         ,product_price NUMBER
                         ,like_it NUMBER(2
                                ,1)
                         ,sale_price NUMBER);

SELECT *
FROM   product_item
ORDER  BY 1;

UPDATE product_item
SET    product_desc = '<img alt="" src="/javaScript/Upload/bakery4.PNG" style="height:393px; width:284px" />'
WHERE  product_code = 'P111113';

SELECT *
FROM   product_item;

CREATE TABLE goods(prod_code VARCHAR2(10) primary key
                  ,prod_name VARCHAR2(100)
                  ,prod_desc VARCHAR2(1000)
                  ,prod_image VARCHAR2(100)
                  ,prod_price NUMBER
                  ,sale_price NUMBER
                  ,like_it NUMBER(3
                         ,1));
INSERT INTO goods
VALUES
    ('p001'
    ,'생딸기연유브레드'
    ,'향긋한 겨울 생딸기를 듬뿍 올리고 달콤한 연유와 딸기시럽으로 마무리한 허니브레드'
    ,'bakery1.PNG'
    ,5000
    ,4000
    ,4.0);
INSERT INTO goods
VALUES
    ('p002'
    ,'생딸기 와플'
    ,'향긋한 겨울 생딸기를 올리고 아이스볼과 플로팅크림으로 풍미를 증가 시킨 벨지움 와플'
    ,'bakery2.PNG'
    ,6000
    ,5000
    ,4.5);
INSERT INTO goods
VALUES
    ('p003'
    ,'생딸기 크로플'
    ,'버터의 풍미가 가득 느껴지는 크로플 두장에 라운드볼, 휘핑, 그리고 향긋한 겨울 생딸기로 조화를 더한 딸기시즌 한전 디저트'
    ,'bakery3.PNG'
    ,7000
    ,6000
    ,3.0);
INSERT INTO goods
VALUES
    ('p004'
    ,'토피넛 크로플'
    ,'플레인 크로플과 토피넛베이스, 아몬드 브리틀과 아몬드슬라이스, 아이스크림이 올라간 크로플을 추가하여 취향에 따라 즐길수 있는 플레이팅 크로플'
    ,'bakery4.PNG'
    ,8000
    ,7000
    ,3.5);
SELECT *
FROM   goods;
