SELECT *
FROM   tab;
-----------------------------------------------------------------------
-----------------------------------------------------------------------
drop table tbl_swim_class purge;
create table tbl_swim_lecture (
 mem_id varchar2(10) not null,
 swim_code char(2) not null,
 creation_date date default sysdate
);
insert into tbl_swim_lecture values('user01', 'B1', sysdate);
insert into tbl_swim_lecture values('user02', 'B1', sysdate);
insert into tbl_swim_lecture values('user03', 'M1', sysdate);
insert into tbl_swim_lecture values('user04', 'M1', sysdate);
insert into tbl_swim_lecture values('user05', 'S1', sysdate);
insert into tbl_swim_lecture values('user06', 'S1', sysdate);

select * from tbl_swim_lecture;
select mem_id
      ,s.swim_code
      ,s.swim_name
      ,s.coach
      ,s.swim_fee
      ,sl.creation_date
from tbl_swim_lecture sl
join tbl_swim s
on sl.swim_code = s.swim_code
where s.enabled = 'Y';

create table tbl_swim (
 swim_code char(2) primary key, -- B1, B2, B3, M1, M2, M3
 swim_name varchar2(30) not null,
 coach varchar2(100) not null, -- 강사이름.
 swim_fee number not null,
 enabled char(1) default 'Y' --사용여부
);
insert into tbl_swim values('B1', '기초반1', '김강사', 10000, 'Y');
insert into tbl_swim values('M1', '중급반1', '김중급', 20000, 'Y');
insert into tbl_swim values('S1', '상급반1', '김상급', 30000, 'Y');
select * from tbl_swim;

-- tbl_auth
-----------------------------------------------------------
drop table tbl_auth purge;
create table tbl_auth (
 mem_id varchar2(10),
 auth varchar2(10) not null,
 enabled char(1) default 'Y'
);
alter table tbl_auth add constraint fk_mem_id
foreign key (mem_id) references tbl_member(mem_id);

insert into tbl_auth
values('user01', 'USER', 'Y');
insert into tbl_auth
values('user02', 'USER', 'Y');
insert into tbl_auth
values('admin', 'ADMIN', 'Y');

select *
from tbl_auth;

select *
from tbl_member;

select *
from tbl_auth a
right join tbl_member m
on a.mem_id = m.mem_id;

create table tbl_member (
 mem_id varchar2(10),
 mem_name varchar2(50) not null,
 mem_pw varchar2(100) not null,
 mem_phone varchar2(20),
 creation_date date default sysdate
);
alter table tbl_member add constraint member_pk primary key (mem_id);
alter table tbl_board add update_date date default sysdate;

insert into tbl_member (mem_id, mem_name, mem_pw, mem_phone)
values('user01', '사용자1', '0000', '010-9999-8888');
insert into tbl_member (mem_id, mem_name, mem_pw, mem_phone)
values('user02', '사용자2', '0000', '010-8888-7777');
insert into tbl_member (mem_id, mem_name, mem_pw, mem_phone)
values('admin', '관리자', '0000', '010-8888-7777');

select * from tbl_member;

select *
from tbl_member m
where not exists (select 1 
                  from tbl_auth a
                  where m.mem_id = a.mem_id);


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


drop table tbl_reply purge;

select *
from tbl_reply;

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
