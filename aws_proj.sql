SELECT *
FROM   tab;

-------------------------------------------------------------------------------------------------------
-- proj -----------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

drop TABLE member purge;
CREATE TABLE member(id VARCHAR2(10) primary key
                   ,NAME VARCHAR2(50) NOT NULL
                   ,passwd VARCHAR2(10) NOT NULL
                   ,email VARCHAR2(100));
INSERT INTO member
    (id
    ,NAME
    ,passwd
    ,email)
VALUES
    ('user1'
    ,'사용자1'
    ,'1111'
    ,'user1@email.com');
INSERT INTO member
    (id
    ,NAME
    ,passwd
    ,email)
VALUES
    ('user2'
    ,'사용자2'
    ,'1111'
    ,'user2@email.com');
INSERT INTO member
    (id
    ,NAME
    ,passwd
    ,email)
VALUES
    ('user3'
    ,'사용자3'
    ,'1111'
    ,'user3@email.com');

SELECT *
FROM   member;

SELECT *
FROM   tbl_board
ORDER  BY bno DESC;
SELECT *
FROM   tbl_attach;

CREATE TABLE tbl_sample1(col1 VARCHAR2(500));
drop TABLE tbl_sample2 purge;
CREATE TABLE tbl_sample2(col2 VARCHAR2(50));

SELECT *
FROM   tbl_reply
ORDER  BY 1 DESC;

SELECT *
FROM   tbl_reply
WHERE  bno = 2490387
ORDER  BY 1;

INSERT INTO tbl_reply
    (rno
    ,bno
    ,reply
    ,replyer)
    SELECT seq_reply.nextval
          ,bno
          ,reply
          ,replyer
    FROM   tbl_reply
    WHERE  bno = 2490387;

SELECT rno
      ,bno
      ,reply
      ,replyer
      ,replydate
      ,updatedate
FROM   (SELECT /*+INDEX(tbl_reply idx_reply) */
         ROWNUM rn
        ,bno
        ,rno
        ,reply
        ,replyer
        ,replydate
        ,updatedate
        FROM   tbl_reply
        WHERE  bno = 3
        AND    rno > 0
        AND    ROWNUM <= 10)
WHERE  rn >= 1;

SELECT /*+ INDEX_DESC(tbl_board pk_board) */
 *
FROM   tbl_board
WHERE  bno > 0;

SELECT /*+ INDEX_ASC(tbl_board pk_board) */
 *
FROM   tbl_board
WHERE  bno > 0;

SELECT rn
      ,bno
      ,title
      ,content
      ,writer
      ,regdate
      ,updatedate
FROM   (SELECT /*+ INDEX_DESC(tbl_board pk_board) */
         ROWNUM rn
        ,bno
        ,title
        ,content
        ,writer
        ,regdate
        ,updatedate
        FROM   tbl_board
        WHERE  ROWNUM <= 20)
WHERE  rn > 10
--order by bno
;

SELECT *
FROM   (SELECT /*+INDEX_DESC(tbl_board pk_board) */
         ROWNUM rn
        ,bno
        ,title
        ,content
        ,writer
        ,regdate
        ,updatedate
        FROM   tbl_board
        WHERE  (title LIKE '%test%' OR content LIKE '%test%')
        AND    ROWNUM <= 20)
WHERE  rn > 10;

UPDATE tbl_board
SET    writer = CASE MOD(bno, 4)
                    WHEN 0 THEN
                     'user00'
                    WHEN 1 THEN
                     'user01'
                    WHEN 2 THEN
                     'user02'
                    WHEN 3 THEN
                     'user03'
                END
WHERE  bno > 0;

SELECT COUNT(*)
FROM   tbl_board
WHERE  bno > 0;

INSERT INTO tbl_board
    (bno
    ,title
    ,content
    ,writer)
    SELECT seq_board.nextval
          ,title
          ,content
          ,writer
    FROM   tbl_board;

SELECT *
FROM   tbl_board
ORDER  BY bno DESC;

SELECT TO_CHAR(replydate, 'rrrr/mm/dd hh24:mi:ss')
FROM   tbl_reply
ORDER  BY 1 DESC;
SELECT SYSDATE
      ,TO_CHAR(SYSDATE, 'rrrr/mm/dd hh24:mi:ss')
FROM   dual;

INSERT INTO tbl_reply
    (rno
    ,bno
    ,reply
    ,replyer)
VALUES
    (seq_reply.nextval
    ,2490385
    ,'reply' || seq_reply.currval
    ,'replyer2');

CREATE TABLE tbl_attach(uuid VARCHAR2(100) NOT NULL
                       ,uploadpath VARCHAR2(200) NOT NULL
                       ,filename VARCHAR2(100) NOT NULL
                       ,filetype   CHAR(1) DEFAULT 'I'
                       ,bno NUMBER(10, 0));
ALTER TABLE tbl_attach add CONSTRAINT pk_attach primary key(uuid);
ALTER TABLE tbl_attach add CONSTRAINT fk_board_attach foreign key(bno) references tbl_board(bno);

-----------------------------------------------
-----------------------------------------------
CREATE sequence seq_board;
CREATE TABLE tbl_board(bno NUMBER(10, 0)
                      ,title VARCHAR2(200) NOT NULL
                      ,content VARCHAR2(2000) NOT NULL
                      ,writer VARCHAR2(50) NOT NULL
                      ,regdate    DATE DEFAULT SYSDATE
                      ,updatedate DATE DEFAULT SYSDATE);
ALTER TABLE tbl_board add CONSTRAINT pk_board primary key(bno);

INSERT INTO tbl_board
    (bno
    ,title
    ,content
    ,writer)
VALUES
    (seq_board.nextval
    ,'test title'
    ,'test content'
    ,'user01');

SELECT *
FROM   tbl_board
ORDER  BY 1 DESC;

-----------------------------------------------
-----------------------------------------------
CREATE sequence seq_reply;
CREATE TABLE tbl_reply(rno NUMBER(10, 0)
                      ,bno NUMBER(10, 0) NOT NULL
                      ,reply VARCHAR2(1000) NOT NULL
                      ,replyer VARCHAR2(50) NOT NULL
                      ,replydate  DATE DEFAULT SYSDATE
                      ,updatedate DATE DEFAULT SYSDATE);
ALTER TABLE tbl_reply add CONSTRAINT pk_reply primary key(rno);
ALTER TABLE tbl_reply add CONSTRAINT fk_reply_board foreign key(bno) references tbl_board(bno);
CREATE INDEX idx_reply ON tbl_reply(bno DESC, rno ASC);
-----------------------------------------------
-----------------------------------------------

--T20230213(3강의장)
CREATE TABLE product(product_code VARCHAR2(10) primary key
                    ,product_name VARCHAR2(100) NOT NULL
                    , --상품명
                     product_desc VARCHAR2(1000) NOT NULL
                    ,product_price NUMBER NOT NULL
                    ,sale_price NUMBER
                    ,like_it NUMBER(3, 1)
                    ,image VARCHAR2(100));
INSERT INTO product
VALUES
    ('P2023001'
    ,'과테말라 안티구아'
    ,'과테말라 안티구아 맛있는 커피입니다'
    ,5000
    ,4500
    ,4.5
    ,'과테말라 안티구아.jpg');
INSERT INTO product
VALUES
    ('P2023002'
    ,'니카라구아 아라비카'
    ,'니카라구아 아라비카 맛있는 커피입니다'
    ,5500
    ,4500
    ,4.0
    ,'니카라구아 아라비카.jpg');
INSERT INTO product
VALUES
    ('P2023003'
    ,'브라질산토스'
    ,'브라질산토스 맛있는 커피입니다'
    ,6000
    ,5000
    ,3.5
    ,'브라질산토스.jpg');
INSERT INTO product
VALUES
    ('P2023004'
    ,'에티오피아 예가체프'
    ,'에티오피아 예가체프 맛있는 커피입니다'
    ,4000
    ,3500
    ,4.0
    ,'에티오피아 예가체프.jpg');
INSERT INTO product
VALUES
    ('P2023005'
    ,'케냐 오크라톡신'
    ,'케냐 오크라톡신 맛있는 커피입니다'
    ,4500
    ,3000
    ,3.0
    ,'케냐 오크라톡신.jpg');
INSERT INTO product
VALUES
    ('P2023006'
    ,'코스타리카 따라주'
    ,'코스타리카 따라주 맛있는 커피입니다'
    ,3000
    ,2500
    ,5.0
    ,'코스타리카 따라주.jpg');

-------------------------------------------------------------------------------------------------------
-- book_ex --------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
SELECT *
FROM   tab;
CREATE sequence seq_board;
CREATE TABLE tbl_board(bno NUMBER(10, 0)
                      ,title VARCHAR2(200) NOT NULL
                      ,content VARCHAR2(2000) NOT NULL
                      ,writer VARCHAR2(50) NOT NULL
                      ,regdate    DATE DEFAULT SYSDATE
                      ,updatedate DATE DEFAULT SYSDATE);
ALTER TABLE tbl_board add CONSTRAINT pk_board primary key(bno);

INSERT INTO tbl_board
    (bno
    ,title
    ,content
    ,writer)
VALUES
    (seq_board.nextval
    ,'test title'
    ,'test content'
    ,'user00');

SELECT *
FROM   tbl_board;