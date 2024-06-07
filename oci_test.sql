SELECT *
FROM   tab
ORDER  BY tname;

SELECT jsp_common.get_version2()
FROM   dual;

--procedure 연습내용.
--상품테이블의 상품정보를 활용해서 장바구니의 상품을 구매할 때...주문정보와 주문상세정보를 만드는 작업을 실행. 
CREATE TABLE tbl_product(product_no NUMBER
                        ,product_name VARCHAR2(100) NOT NULL
                        ,product_desc VARCHAR2(300) NOT NULL
                        ,price NUMBER NOT NULL
                        ,sale_price NUMBER
                        ,like_it       NUMBER DEFAULT 0
                        ,creation_date DATE DEFAULT SYSDATE);
--alter table tbl_product add primary key (product_no);
ALTER TABLE tbl_product add CONSTRAINT product_pk primary key(product_no);
CREATE sequence product_seq;

INSERT INTO tbl_product
    (product_no
    ,product_name
    ,product_desc
    ,price
    ,sale_price)
VALUES
    (product_seq.nextval
    ,'샤프2000'
    ,'모나미의 샤프 2000은 좋습니다'
    ,2000
    ,1800);
INSERT INTO tbl_product
    (product_no
    ,product_name
    ,product_desc
    ,price
    ,sale_price)
VALUES
    (product_seq.nextval
    ,'마우스5000'
    ,'다이소의 마우스로 5000은 좋습니다'
    ,5000
    ,4000);
INSERT INTO tbl_product
    (product_no
    ,product_name
    ,product_desc
    ,price
    ,sale_price)
VALUES
    (product_seq.nextval
    ,'지우개1000'
    ,'모나미의 지우개 1000은 좋습니다'
    ,1000
    ,900);
INSERT INTO tbl_product
    (product_no
    ,product_name
    ,product_desc
    ,price
    ,sale_price)
VALUES
    (product_seq.nextval
    ,'필통2000'
    ,'모나미의 필통 2000은 좋습니다'
    ,2000
    ,1500);

SELECT *
FROM   tbl_product
ORDER  BY 1;

DELETE FROM tbl_product
WHERE  product_no = 4;

drop TABLE tbl_cart purge;
CREATE TABLE tbl_cart(cart_no NUMBER
                     ,product_no NUMBER NOT NULL
                     ,qty           NUMBER DEFAULT 1
                     ,user_id VARCHAR2(20) NOT NULL
                     ,creation_date DATE DEFAULT SYSDATE);
ALTER TABLE tbl_cart add CONSTRAINT cart_pk primary key(cart_no);
CREATE sequence cart_seq;

INSERT INTO tbl_cart
    (cart_no
    ,product_no
    ,qty
    ,user_id)
VALUES
    (cart_seq.nextval
    ,1
    ,2
    ,'user01');
INSERT INTO tbl_cart
    (cart_no
    ,product_no
    ,qty
    ,user_id)
VALUES
    (cart_seq.nextval
    ,2
    ,3
    ,'user01');
INSERT INTO tbl_cart
    (cart_no
    ,product_no
    ,qty
    ,user_id)
VALUES
    (cart_seq.nextval
    ,3
    ,1
    ,'user01');

SELECT *
FROM   tbl_cart
WHERE  user_id = 'user01';

DELETE FROM order_details;
DELETE FROM purchase_order;

SELECT *
FROM   order_details;

SELECT *
FROM   v_order_items;

CREATE OR REPLACE view v_order_items AS
    SELECT po.order_no
          ,po.order_status
          ,po.address_to
          ,od.order_detail_no
          ,od.product_no
          ,pd.product_name
          ,od.qty
          ,od.order_price
    FROM   purchase_order po
    JOIN   order_details od
    ON     po.order_no = od.order_no
    JOIN   tbl_product pd
    ON     pd.product_no = od.product_no
    ORDER  BY od.order_detail_no;

--주문정보.
drop TABLE purchase_order purge;
CREATE TABLE purchase_order(order_no VARCHAR2(10) --P202406001
                           ,user_id VARCHAR2(10) NOT NULL
                           ,address_to VARCHAR2(100) NOT NULL
                           ,order_status VARCHAR2(20) NOT NULL --주문, 배송, 완료
                           ,order_date   DATE DEFAULT SYSDATE);
ALTER TABLE purchase_order add CONSTRAINT order_pk primary key(order_no);

drop TABLE order_details purge;
CREATE TABLE order_details(order_detail_no NUMBER
                          ,order_no VARCHAR2(10) --P202406001
                          ,product_no NUMBER NOT NULL
                          ,qty NUMBER NOT NULL
                          ,order_price NUMBER
                          ,creation_date   DATE DEFAULT SYSDATE);
CREATE sequence order_details_seq;
ALTER TABLE order_details add CONSTRAINT odetail_pk primary key(order_detail_no);

drop TABLE tbl_member purge;
CREATE TABLE tbl_member(member_id VARCHAR2(20)
                       ,member_pw VARCHAR2(10) NOT NULL
                       ,member_nm VARCHAR2(100) NOT NULL
                       ,responsibility VARCHAR2(10) DEFAULT 'User'
                       ,phone VARCHAR2(20)
                       ,creation_date  DATE DEFAULT SYSDATE);
INSERT INTO tbl_member
    (member_id
    ,member_pw
    ,member_nm)
VALUES
    ('user01'
    ,'1111'
    ,'User1');
INSERT INTO tbl_member
    (member_id
    ,member_pw
    ,member_nm)
VALUES
    ('user02'
    ,'1111'
    ,'User2');
INSERT INTO tbl_member
    (member_id
    ,member_pw
    ,member_nm)
VALUES
    ('user03'
    ,'1111'
    ,'User3');
INSERT INTO tbl_member
    (member_id
    ,member_pw
    ,member_nm
    ,responsibility)
VALUES
    ('user04'
    ,'1111'
    ,'User4'
    ,'Admin');

SELECT *
FROM   tbl_member;

--git form연습.
SELECT /*+ INDEX_DESC(tbl_board SYS_C0031805) */
 *
FROM   tbl_board
WHERE  board_no > 0;

UPDATE tbl_board
SET    writer = CASE MOD(board_no, 4)
                    WHEN 0 THEN 'user0'
                    WHEN 1 THEN 'user1'
                    WHEN 2 THEN 'user2'
                    ELSE 'user3'
                END
WHERE  board_no > 0;

SELECT /*+ FULL(tbl_board) */
 ROWNUM rn
,board_no
,title
FROM   tbl_board
WHERE  board_no > 0
ORDER  BY board_no;

SELECT rn
      ,board_no
      ,title
      ,content
FROM   (SELECT /*+ INDEX_DESC(tbl_board SYS_C0031805) */
         ROWNUM rn
        ,board_no
        ,title
        ,content
        FROM   tbl_board
        WHERE  ROWNUM <= 20)
WHERE  rn > 10;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--여러건 넣기.
INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
    SELECT board_seq.nextval
          ,title
          ,content
          ,writer
    FROM   tbl_board;
SELECT COUNT(*)
FROM   tbl_board;

INSERT INTO tbl_board
    (board_no
    ,title
    ,content
    ,writer)
VALUES
    (board_seq.nextval
    ,'title' || board_seq.currval
    ,'content' || board_seq.currval
    ,'writer' || board_seq.currval);

SELECT *
FROM   tbl_board
ORDER  BY 1 DESC;

DELETE FROM tbl_board
WHERE  board_no > 500;

drop TABLE tbl_reply purge;
CREATE sequence reply_seq;
CREATE TABLE tbl_reply(reply_no INT primary key
                      ,bno INT NOT NULL
                      ,content VARCHAR2(300) NOT NULL
                      ,writer VARCHAR2(100) NOT NULL
                      ,create_date DATE DEFAULT SYSDATE);
SELECT *
FROM   tbl_reply;
INSERT INTO tbl_reply
VALUES
    (reply_seq.nextval
    ,3813048
    ,'test reply'
    ,'user01'
    ,SYSDATE);

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- book_info table.
drop TABLE book_info purge;
CREATE TABLE book_info(book_code VARCHAR2(20) primary key
                      ,book_title VARCHAR2(300)
                      ,book_author VARCHAR2(500)
                      ,book_press VARCHAR2(50)
                      ,book_price NUMBER);
ALTER TABLE book_info add(book_desc VARCHAR2(1000));
INSERT INTO book_info
VALUES
    ('B0001'
    ,'더좋은삶을위한철학'
    ,'김철학'
    ,'이야기'
    ,21000
    ,'더좋은삶을위한철학 아주 재미있습니다');
INSERT INTO book_info
VALUES
    ('B0002'
    ,'현대철학매뉴'
    ,'박철학'
    ,'뉴욕타임즈'
    ,23000
    ,'현대철학매뉴 아주 재미있습니다');
INSERT INTO book_info
VALUES
    ('B0003'
    ,'호모픽투스의모험'
    ,'모닝글로리'
    ,'자바출판사'
    ,15500
    ,'호모픽투스의모험 아주 재미있습니다');
INSERT INTO book_info
VALUES
    ('B0004'
    ,'인류의여정'
    ,'조여정'
    ,'김영사'
    ,10000
    ,'인류의여정 아주 재미있습니다');
INSERT INTO book_info
VALUES
    ('B0005'
    ,'세상은어떻게돌아가는가'
    ,'저세상'
    ,'그린비'
    ,22000
    ,'세상은어떻게돌아가는가 아주 재미있습니다');
INSERT INTO book_info
VALUES
    ('B0006'
    ,'삶은문제해결의연속이다'
    ,'황연속'
    ,'시공사'
    ,11000
    ,'삶은문제해결의연속이다 아주 재미있습니다');

INSERT INTO book_file
VALUES
    (1
    ,'B0001'
    ,'더좋은삶을위한철학.png'
    ,'bookImages');
INSERT INTO book_file
VALUES
    (2
    ,'B0002'
    ,'현대철학매뉴.png'
    ,'bookImages');
INSERT INTO book_file
VALUES
    (3
    ,'B0003'
    ,'호모픽투스의모험.png'
    ,'bookImages');
INSERT INTO book_file
VALUES
    (4
    ,'B0004'
    ,'인류의여정.png'
    ,'bookImages');
INSERT INTO book_file
VALUES
    (5
    ,'B0005'
    ,'세상은어떻게돌아가는가.png'
    ,'bookImages');
INSERT INTO book_file
VALUES
    (6
    ,'B0006'
    ,'삶은문제해결의연속이다.png'
    ,'bookImages');

-- book_file table.
CREATE TABLE book_file(file_no NUMBER primary key
                      ,book_code VARCHAR2(50)
                      ,book_image VARCHAR2(50)
                      ,book_path VARCHAR2(50));

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- members table.
CREATE TABLE members(id VARCHAR(10) primary key
                    ,passwd VARCHAR2(10)
                    ,NAME VARCHAR2(30)
                    ,email VARCHAR2(30)
                    ,responsibility VARCHAR2(10)
                    ,pfilename VARCHAR2(50)
                    ,ofilename VARCHAR2(50)
                    ,cdate DATE);

SELECT *
FROM   members
ORDER  BY 1;

ALTER TABLE member rename column mail TO email;
ALTER TABLE members add(phone_number VARCHAR2(20));
ALTER TABLE members add(addr VARCHAR2(100));

INSERT INTO members
VALUES
    ('user6'
    ,'1234'
    ,'사용자6'
    ,'user6@email'
    ,'User'
    ,'member6.png'
    ,NULL
    ,SYSDATE
    ,'010-1111-2222'
    ,'Daegu, jungangno-6');

SELECT *
FROM   members
ORDER  BY 1;

DELETE FROM members
WHERE  responsibility = 'User';
UPDATE members
SET    pfilename = 'admin1.png'
WHERE  pfilename IS NULL;

SELECT *
FROM   tbl_board
ORDER  BY 1;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- tbl_notice table.
CREATE sequence notice_seq;
CREATE TABLE tbl_notice(notice_id NUMBER primary key
                       ,notice_writer VARCHAR2(100) NOT NULL
                       ,notice_title VARCHAR2(100) NOT NULL
                       ,notice_subject VARCHAR2(1000) NOT NULL
                       ,notice_date DATE
                       ,hit_count      NUMBER DEFAULT 0
                       ,attach_file VARCHAR2(100)
                       ,attach_dir VARCHAR2(100));

SELECT notice_seq.nextval
FROM   dual;
INSERT INTO tbl_notice
    (notice_id
    ,notice_writer
    ,notice_title
    ,notice_subject
    ,notice_date)
VALUES
    (1
    ,'user1'
    ,'sample title'
    ,'sample subject'
    ,SYSDATE);

INSERT INTO tbl_notice
    (notice_id
    ,notice_writer
    ,notice_title
    ,notice_subject
    ,notice_date)
    SELECT notice_seq.nextval
          ,'writer' || notice_seq.currval
          ,'title' || notice_seq.currval
          ,'subject' || notice_seq.currval
          ,SYSDATE
    FROM   tbl_notice;

SELECT b.notice_id
      ,b.notice_writer
      ,b.notice_title
      ,b.notice_date
      ,b.hit_count
FROM   (SELECT ROWNUM rn
              ,a.*
        FROM   (SELECT n.*
                FROM   tbl_notice n
                WHERE  1 = 1
                --and notice_writer like '%writer3%'
                --and notice_title like '%title3%'
                --and notice_subject like '%subject31%'
                ORDER  BY 1) a
        WHERE  ROWNUM <= (1 * 10)) b
WHERE  b.rn >= (1 * 10 - 9);

SELECT *
FROM   tbl_notice
WHERE  notice_id = 1;

UPDATE tbl_notice
SET    notice_writer = CASE MOD(notice_id, 4)
                           WHEN 1 THEN 'user1'
                           WHEN 2 THEN 'user2'
                           WHEN 3 THEN 'user3'
                           ELSE 'user4'
                       END
WHERE  notice_id > 10;

SELECT *
FROM   tbl_notice
ORDER  BY 1 DESC;

DELETE FROM tbl_notice
WHERE  notice_id = 484;
COMMIT;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

-- center_info table.
drop TABLE center_info purge;
CREATE TABLE center_info(id NUMBER
                        ,center_name VARCHAR2(100)
                        ,center_type VARCHAR2(50)
                        ,facility_name VARCHAR2(100)
                        ,org VARCHAR2(100)
                        ,phone_number VARCHAR2(20)
                        ,sido VARCHAR2(40)
                        ,sigungu VARCHAR2(40)
                        ,address VARCHAR2(100)
                        ,lat VARCHAR2(20)
                        ,lng VARCHAR2(20)
                        ,zip_code VARCHAR2(10)
                        ,created_at VARCHAR2(30)
                        ,updated_at VARCHAR2(30));

DELETE FROM center_info
WHERE  id IS NOT NULL;
COMMIT;

SELECT *
FROM   center_info
ORDER  BY 1;

INSERT INTO center_info
    (id
    ,center_name
    ,center_type
    ,facility_name
    ,org
    ,phone_number
    ,sido
    ,sigungu
    ,address
    ,lat
    ,lng
    ,zip_code
    ,created_at
    ,updated_at)
VALUES
    (1
    ,'centername'
    ,'centertype'
    ,'facilityname'
    ,'org'
    ,'phone-number'
    ,'sido'
    ,'sigungu'
    ,'address'
    ,'lat'
    ,'lng'
    ,'zipcode'
    ,'createdat'
    ,'updatedat');

SELECT *
FROM   center_info
ORDER  BY id;
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

drop TABLE genesis purge;
CREATE TABLE genesis(member_order VARCHAR2(3) primary key
                    ,member_name VARCHAR2(100)
                    ,col1         CHAR(1) DEFAULT 'N'
                    ,col2         CHAR(1) DEFAULT 'N'
                    ,col3         CHAR(1) DEFAULT 'N'
                    ,col4         CHAR(1) DEFAULT 'N'
                    ,col5         CHAR(1) DEFAULT 'N'
                    ,col6         CHAR(1) DEFAULT 'N'
                    ,col7         CHAR(1) DEFAULT 'N'
                    ,col8         CHAR(1) DEFAULT 'N'
                    ,col9         CHAR(1) DEFAULT 'N'
                    ,col10        CHAR(1) DEFAULT 'N'
                    ,col11        CHAR(1) DEFAULT 'N'
                    ,col12        CHAR(1) DEFAULT 'N'
                    ,col13        CHAR(1) DEFAULT 'N'
                    ,col14        CHAR(1) DEFAULT 'N'
                    ,col15        CHAR(1) DEFAULT 'N');

SELECT *
FROM   genesis
ORDER  BY member_order;

UPDATE genesis
SET    col1 = 'Y'
WHERE  member_order = '1-1';

UPDATE genesis
SET    col2 = 'Y'
WHERE  member_order = '11';

---------------------------------------
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

BEGIN
    create_order_proc('user01');
END;
