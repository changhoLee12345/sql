SELECT *
FROM   tab;

CREATE sequence seq_board;

drop TABLE tbl_board purge;
CREATE TABLE tbl_board(bno NUMBER(10
                             ,0)
                      ,title VARCHAR2(200) NOT NULL
                      ,content VARCHAR2(2000) NOT NULL
                      ,writer VARCHAR2(50) NOT NULL
                      ,regdate    DATE DEFAULT SYSDATE
                      ,updatedate DATE DEFAULT SYSDATE);

ALTER TABLE tbl_board add CONSTRAINT pk_board primary key(bno);

INSERT INTO tbl_board
    (bno, title, content, writer)
VALUES
    (seq_board.nextval, '테스트 제목', '테스트 내용', 'user00');
INSERT INTO tbl_board
    (bno, title, content, writer)
VALUES
    (seq_board.nextval, '테스트 title', '테스트 content', 'news01');
INSERT INTO tbl_board
    (bno, title, content, writer)
VALUES
    (seq_board.nextval, '타이틀 테스트', '콘텐츠 테스트', 'people1');

SELECT *
FROM   tbl_board
ORDER  BY 1;
DELETE FROM tbl_board
WHERE  bno > 1;

INSERT INTO tbl_board
    (bno, title, content, writer)
    SELECT seq_board.nextval, title, content, writer
    FROM   tbl_board;

SELECT *
FROM   tbl_board
WHERE  bno < 100;

SELECT rn, bno, title, content
FROM   (SELECT /*+ INDEX_DESC (tbl_board pk_board) */
         ROWNUM rn, bno, title, content
        FROM   tbl_board
        WHERE  ROWNUM <= 20)
WHERE  rn > 0;

SELECT /*+ INDEX_ASC (tbl_board pk_board) */
 *
FROM   tbl_board
WHERE  bno > 0;
