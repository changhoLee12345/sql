SELECT *
FROM   tab;

SELECT *
FROM   login_test;

CREATE TABLE login_test(id VARCHAR2(10)
                       ,passwd VARCHAR2(10)
                       ,NAME VARCHAR2(100));

INSERT INTO login_test
VALUES
    ('1111'
    ,'1234'
    ,'changho');
INSERT INTO login_test
VALUES
    ('166'
    ,'1234'
    ,'Susan');

--�Խ���
CREATE TABLE board(board_no NUMBER NOT NULL
                  ,title VARCHAR2(100)
                  ,content VARCHAR2(3000)
                  ,writer VARCHAR2(100)
                  ,create_date DATE
                  ,parent_no NUMBER);

ALTER TABLE board add CONSTRAINT board_pk primary key(board_no);

CREATE sequence board_seq;

SELECT *
FROM   board
ORDER  BY 1;

UPDATE board
SET    parent_no = 2
WHERE  board_no = 4;
