SELECT *
FROM   tab;

-------------------------------------------------------
-- spring jdbc user security --
drop TABLE users purge;
CREATE TABLE users(username VARCHAR2(50) NOT NULL primary key
                  ,password VARCHAR2(50) NOT NULL
                  ,enabled  CHAR(1) DEFAULT '1');

CREATE TABLE authorities(username VARCHAR2(50) NOT NULL
                        ,authority VARCHAR2(50) NOT NULL
                        ,CONSTRAINT fk_authorities_users foreign key(username)
                         references users(username));

CREATE UNIQUE INDEX ix_auth_username ON authorities(username, authority);

INSERT INTO users
    (username
    ,password)
VALUES
    ('user00'
    ,'pw00');
INSERT INTO users
    (username
    ,password)
VALUES
    ('member00'
    ,'pw00');
INSERT INTO users
    (username
    ,password)
VALUES
    ('admin00'
    ,'pw00');

INSERT INTO authorities
    (username
    ,authority)
VALUES
    ('user00'
    ,'ROLE_USER');
INSERT INTO authorities
    (username
    ,authority)
VALUES
    ('member00'
    ,'ROLE_MANAGER');
INSERT INTO authorities
    (username
    ,authority)
VALUES
    ('admin00'
    ,'ROLE_MANAGER');
INSERT INTO authorities
    (username
    ,authority)
VALUES
    ('admin00'
    ,'ROLE_ADMIN');

SELECT *
FROM   users;
SELECT *
FROM   authorities;

-------------------- user table 을 사용하기 ----------------------------
drop TABLE tbl_member purge;
CREATE TABLE tbl_member(userid VARCHAR2(50) NOT NULL primary key
                       ,userpw VARCHAR2(100) NOT NULL
                       ,username VARCHAR2(100) NOT NULL
                       ,regdate    DATE DEFAULT SYSDATE
                       ,updatedate DATE DEFAULT SYSDATE
                       ,enabled    CHAR(1) DEFAULT '1');

drop TABLE tbl_member_auth purge;
CREATE TABLE tbl_member_auth(userid VARCHAR2(50) NOT NULL
                            ,auth VARCHAR2(50) NOT NULL
                            ,CONSTRAINT fk_member_auth foreign key(userid)
                             references tbl_member(userid));

SELECT *
FROM   tbl_member;
SELECT *
FROM   tbl_member_auth;

SELECT mem.userid
      ,userpw
      ,username
      ,enabled
      ,regdate
      ,updatedate
      ,auth
FROM   tbl_member mem
LEFT   OUTER JOIN tbl_member_auth auth
ON     mem.userid = auth.userid
WHERE  mem.userid = 'user5';

CREATE TABLE persistent_logins(username VARCHAR(64) NOT NULL
                              ,series VARCHAR(64) primary key
                              ,token VARCHAR(64) NOT NULL
                              ,last_used TIMESTAMP NOT NULL);

SELECT *
FROM   hr.employees;

------------------------------------ jsp 수업용 테이블 및 데이터 생성.
--사원정보 테이블.
CREATE TABLE employee(emp_no NUMBER primary key
                     , -- 사원번호
                      emp_name VARCHAR2(50) NOT NULL
                     , --사원명
                      email VARCHAR2(30) NOT NULL
                     , --이메일
                      phone VARCHAR2(10) NOT NULL
                     , --연락처
                      hire_date   DATE DEFAULT SYSDATE
                     , --입사일자
                      salary      NUMBER DEFAULT 100
                     ,department VARCHAR2(30) NOT NULL
                     , --부서
                      create_date DATE DEFAULT SYSDATE);

INSERT INTO employee
    (emp_no
    ,emp_name
    ,email
    ,phone
    ,salary
    ,department
    ,hire_date)
VALUES
    (108
    ,'홍길동'
    ,'hong@mail.com'
    ,'234-5678'
    ,200
    ,'인사'
    ,TO_DATE('2023-01-05', 'yyyy-mm-dd'));
INSERT INTO employee
    (emp_no
    ,emp_name
    ,email
    ,phone
    ,salary
    ,department)
VALUES
    (102
    ,'김사원'
    ,'kim@mail.com'
    ,'234-5679'
    ,300
    ,'총무');
INSERT INTO employee
    (emp_no
    ,emp_name
    ,email
    ,phone
    ,salary
    ,department)
VALUES
    (103
    ,'최주임'
    ,'choi@mail.com'
    ,'234-5978'
    ,400
    ,'개발');

SELECT *
FROM   employee;

UPDATE employee
SET    salary = salary + 50
WHERE  emp_no = 101;

SELECT *
FROM   employee
--where department = '인사'
ORDER  BY 1 DESC;

SELECT department
      ,COUNT(*)
FROM   employee
GROUP  BY department; --78건.

DELETE FROM employee
WHERE  emp_no = 208;

INSERT INTO employee
    (emp_no
    ,emp_name
    ,email
    ,phone
    ,hire_date
    ,salary
    ,department)
    SELECT emp_no + 100 --(select max(emp_no)+1 from employee)
          ,emp_name
          ,email
          ,phone
          ,hire_date
          ,salary
          ,department
    FROM   employee; -- 30건 이상 데이터 생성.

--페이징. 페이지당 5개씩 출력.
--78건 > 16페이지
-- 1페이지: 5건, 사원번호 기준으로..
-- 1page: 1 ~ 5, 2page: 6 ~ 10
SELECT emp_no
      ,emp_name
      ,email
      ,phone
      ,hire_date
      ,salary
      ,department
FROM   (SELECT ROWNUM rn
              ,a.*
        FROM   (SELECT *
                FROM   employee
                WHERE  department = NVL(:dept, department)
                ORDER  BY emp_no) a) b
WHERE  b.rn > (:page - 1) * 5
AND    b.rn <= (:page) * 5;

SELECT *
FROM   employee
WHERE  department = NVL('개발', department);

SELECT rn
      ,emp_no
      ,emp_name
      ,email
      ,phone
      ,hire_date
      ,salary
      ,department
FROM   (SELECT /*+ INDEX_DESC(e SYS_C008368) */
         ROWNUM rn
        ,e.*
        FROM   employee e
        WHERE  ROWNUM <= 10) a
WHERE  rn > 0;

drop TABLE tbl_board purge;
CREATE TABLE tbl_board(board_no NUMBER
                      ,title VARCHAR2(50) NOT NULL
                      ,content VARCHAR2(300) NOT NULL
                      ,writer VARCHAR2(20) NOT NULL
                      ,view_cnt    NUMBER DEFAULT 0
                      ,create_date DATE DEFAULT SYSDATE);
ALTER TABLE tbl_board add CONSTRAINT board_pk primary key(board_no);
ALTER TABLE tbl_board add update_date DATE DEFAULT SYSDATE;

CREATE sequence board_seq;

INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
VALUES
    (board_seq.nextval
    ,'title11'
    ,'content1'
    ,'user01');
INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
VALUES
    (board_seq.nextval
    ,'test1'
    ,'nice content 1'
    ,'user02');
INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
VALUES
    (board_seq.nextval
    ,'good'
    ,'good content'
    ,'user03');
INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
VALUES
    (board_seq.nextval
    ,'every'
    ,'every content'
    ,'user01');

INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
    SELECT board_seq.nextval
          ,title || board_seq.currval
          ,content || board_seq.currval
          ,writer
    FROM   tbl_board;

SELECT board_no
      ,title
      ,content
      ,writer
      ,view_cnt
      ,create_date
      ,update_date
FROM   (SELECT /*+ INDEX(b board_pk)*/
         ROWNUM rn
        ,b.*
        FROM   tbl_board b
        WHERE  writer = NVL(:writer, writer)
        AND    title LIKE '%' || :title || '%'
        AND    ROWNUM <= :page * 5) a
WHERE  rn > (:page - 1) * 5;

SELECT board_no
      ,title
      ,content
      ,writer
      ,view_cnt
      ,create_date
      ,update_date
FROM   (SELECT /*+ INDEX(b board_pk)*/
         ROWNUM rn
        ,b.*
        FROM   tbl_board b
        WHERE  title LIKE 'test%'
        OR     writer LIKE 'test%'
        AND    ROWNUM <= :page * 5) a
WHERE  rn > (:page - 1) * 5;

SELECT COUNT(*)
FROM   tbl_board;

COMMIT;

SELECT *
FROM   tbl_board
ORDER  BY 1 DESC;

DELETE FROM tbl_board
WHERE  board_no IN (9, 23, 12);

CREATE TABLE tbl_member(id VARCHAR2(10) primary key
                       ,pw VARCHAR2(10) NOT NULL
                       ,NAME VARCHAR2(100) NOT NULL
                       ,auth VARCHAR2(10) DEFAULT 'user');

INSERT INTO tbl_member
    (id
    ,pw
    ,NAME)
VALUES
    ('user01'
    ,'1111'
    ,'홍길동');
INSERT INTO tbl_member
    (id
    ,pw
    ,NAME)
VALUES
    ('user02'
    ,'1111'
    ,'김민규');
INSERT INTO tbl_member
    (id
    ,pw
    ,NAME
    ,auth)
VALUES
    ('admin'
    ,'1111'
    ,'관리자'
    ,'admin');

COMMIT;

SELECT *
FROM   tbl_member;

SELECT *
FROM   tab;

drop TABLE tbl_reply purge;
CREATE TABLE tbl_reply(reply_no NUMBER
                      ,board_no NUMBER NOT NULL
                      ,reply VARCHAR2(100) NOT NULL
                      ,replyer VARCHAR2(20) NOT NULL
                      ,reply_date DATE DEFAULT SYSDATE);

ALTER TABLE tbl_reply add CONSTRAINT reply_pk primary key(reply_no);

CREATE sequence reply_seq;

INSERT INTO tbl_reply
    (reply_no
    ,board_no
    ,reply
    ,replyer)
VALUES
    (reply_seq.nextval
    ,157
    ,'reply test'
    ,'user03');
INSERT INTO tbl_reply
    (reply_no
    ,board_no
    ,reply
    ,replyer)
VALUES
    (reply_seq.nextval
    ,157
    ,'reply test2'
    ,'user02');
INSERT INTO tbl_reply
    (reply_no
    ,board_no
    ,reply
    ,replyer)
VALUES
    (reply_seq.nextval
    ,157
    ,'reply test3'
    ,'user01');

INSERT INTO tbl_reply
    (reply_no
    ,board_no
    ,reply
    ,replyer)
    SELECT reply_seq.nextval
          ,157
          ,'157 reply'
          ,replyer
    FROM   tbl_reply;

SELECT *
FROM   tbl_reply
WHERE  1 = 1 --board_no != 157
ORDER  BY 1 DESC;

SELECT board_no
      ,COUNT(*)
FROM   tbl_reply
WHERE  1 = 1 --board_no = 521
GROUP  BY board_no;

UPDATE tbl_reply
SET    board_no = 521;

SELECT rn
      ,reply_no
      ,reply
      ,replyer
      ,reply_date
      ,board_no
FROM   (SELECT /*+ INDEX_DESC(r reply_pk)*/
         ROWNUM rn
        ,r.*
        FROM   tbl_reply r
        WHERE  board_no = :bno
        AND    ROWNUM <= :page * 5) a
WHERE  a.rn > (:page - 1) * 5;

SELECT /*+ INDEX_DESC(r reply_pk)*/
 ROWNUM rn
,r.*
,TO_CHAR(r.reply_date, 'yyyy-mm-dd hh24:mi:ss')
FROM   tbl_reply r
WHERE  board_no = 521;

CREATE TABLE tbl_center(id NUMBER
                       ,center_name VARCHAR2(200)
                       ,sido VARCHAR2(100));

SELECT *
FROM   tbl_center
ORDER  BY 1;

------------------------
CREATE TABLE cart(no NUMBER primary key
                 ,porduct_nm VARCHAR2(50)
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

--drop table pet;
--drop table adopt;
CREATE TABLE pet(id NUMBER primary key
                ,NAME VARCHAR2(50)
                ,picture VARCHAR2(100)
                ,age NUMBER
                ,breed VARCHAR2(100)
                ,location VARCHAR2(100));

CREATE TABLE adopt(id NUMBER primary key, price NUMBER);

INSERT INTO pet
VALUES
    (0
    ,'Frieda'
    ,'resources/images/scottish-terrier.jpeg'
    ,3
    ,'Scottish Terrier'
    ,'Lisco, Alabama');
INSERT INTO pet
VALUES
    (1
    ,'Gina'
    ,'resources/images/scottish-terrier.jpeg'
    ,3
    ,'Scottish Terrier'
    ,'Tooleville, West Virginia');
INSERT INTO pet
VALUES
    (2
    ,'Collins'
    ,'resources/images/french-bulldog.jpeg'
    ,2
    ,'French Bulldog'
    ,'Freeburn, Idaho');
INSERT INTO pet
VALUES
    (3
    ,'Melissa'
    ,'resources/images/boxer.jpeg'
    ,2
    ,'Boxer'
    ,'Camas, Pennsylvania');
INSERT INTO pet
VALUES
    (4
    ,'Jeanine'
    ,'resources/images/french-bulldog.jpeg'
    ,2
    ,'French Bulldog'
    ,'Gerber, South Dakota');
INSERT INTO pet
VALUES
    (5
    ,'Elvia'
    ,'resources/images/french-bulldog.jpeg'
    ,3
    ,'French Bulldog'
    ,'Innsbrook, Illinois');
INSERT INTO pet
VALUES
    (6
    ,'Latisha'
    ,'resources/images/golden-retriever.jpeg'
    ,3
    ,'Golden Retriever'
    ,'Soudan, Louisiana');
INSERT INTO pet
VALUES
    (7
    ,'Coleman'
    ,'resources/images/golden-retriever.jpeg'
    ,3
    ,'Golden Retriever'
    ,'Jacksonwald, Palau');
INSERT INTO pet
VALUES
    (8
    ,'Nichole'
    ,'resources/images/french-bulldog.jpeg'
    ,2
    ,'French Bulldog'
    ,'Honolulu, Hawaii');
INSERT INTO pet
VALUES
    (9
    ,'Fran'
    ,'resources/images/boxer.jpeg'
    ,3
    ,'"Boxer'
    ,'Matheny, Utah');
INSERT INTO pet
VALUES
    (10
    ,'Leonor'
    ,'resources/images/boxer.jpeg'
    ,2
    ,'Boxer'
    ,'Tyhee, Indiana');
INSERT INTO pet
VALUES
    (11
    ,'Dean'
    ,'resources/images/scottish-terrier.jpeg'
    ,3
    ,'Scottish Terrier'
    ,'Windsor, Montana');
INSERT INTO pet
VALUES
    (12
    ,'Stevenson'
    ,'resources/images/french-bulldog.jpeg'
    ,3
    ,'French Bulldog'
    ,'Kingstowne, Nevada');
INSERT INTO pet
VALUES
    (13
    ,'Kristina'
    ,'resources/images/golden-retriever.jpeg'
    ,4
    ,'Golden Retriever'
    ,'Sultana, Massachusetts');
INSERT INTO pet
VALUES
    (14
    ,'Ethel'
    ,'resources/images/golden-retriever.jpeg'
    ,2
    ,'Golden Retriever'
    ,'Broadlands, Oregon');
INSERT INTO pet
VALUES
    (15
    ,'Terry'
    ,'resources/images/golden-retriever.jpeg'
    ,2
    ,'Golden Retriever'
    ,'Dawn, Wisconsin');

INSERT INTO adopt
VALUES
    (1
    ,100);
INSERT INTO adopt
VALUES
    (3
    ,200);

COMMIT;

SELECT *
FROM   pet;
SELECT *
FROM   adopt;

CREATE TABLE todo(no NUMBER primary key
                 ,contents VARCHAR2(100)
                 ,todoyn   CHAR(1) DEFAULT '0');

INSERT INTO todo
VALUES
    (1
    ,'java'
    ,'1');
INSERT INTO todo
VALUES
    (2
    ,'html'
    ,'1');
INSERT INTO todo
VALUES
    (3
    ,'javascript'
    ,'0');
INSERT INTO todo
VALUES
    (4
    ,'spring'
    ,'0');

COMMIT;

CREATE TABLE users(id VARCHAR2(8) primary key
                  ,password VARCHAR2(8)
                  ,NAME VARCHAR2(20)
                  ,role VARCHAR2(5));

INSERT INTO users
VALUES
    ('test'
    ,'test123'
    ,'관리자'
    ,'Admin');
INSERT INTO users
VALUES
    ('user1'
    ,'user1'
    ,'사용자'
    ,'User');

COMMIT;
