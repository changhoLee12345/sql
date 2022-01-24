SELECT *
FROM   tab;

CREATE sequence seq_board;
CREATE TABLE tbl_board(bno NUMBER(10,0)
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
    ,'테스트 제목'
    ,'테스트 내용'
    ,'user00');

SELECT *
FROM   tbl_board
ORDER  BY 1;
