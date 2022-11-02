SELECT *
FROM   tab;

SELECT *
FROM   stocks;

CREATE TABLE lookup_title

drop TABLE lookups purge;
CREATE TABLE lookups(lookup VARCHAR2(20) primary key
                    ,lookup_description VARCHAR2(300));

drop TABLE lookup_values purge;
CREATE TABLE lookup_values(lookup VARCHAR2(20)
                          ,lookup_code VARCHAR2(10)
                          ,lookup_values VARCHAR2(30)
                          ,descriptions VARCHAR2(100)
                          ,flag          CHAR(1) DEFAULT 'Y');
ALTER TABLE lookup_values ADD (dff VARCHAR2(10));                          
--1.
INSERT INTO lookups
VALUES
    ('SUBINVENTORY'
    ,'창고정보');
INSERT INTO lookup_values
VALUES
    ('SUBINVENTORY'
    ,'A'
    ,'Subinventory A'
    ,'1층 창고'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('SUBINVENTORY'
    ,'B'
    ,'Subinventory B'
    ,'2층 창고'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('SUBINVENTORY'
    ,'C'
    ,'Subinventory C'
    ,'3층 창고'
    ,'Y');
--2.
INSERT INTO lookups
VALUES
    ('DELIVERY'
    ,'배송구분');
INSERT INTO lookup_values
VALUES
    ('DELIVERY'
    ,'A'
    ,'발송전'
    ,'출하 준비 중 단계'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('DELIVERY'
    ,'B'
    ,'배송중'
    ,'출하 후 배송완료 전'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('DELIVERY'
    ,'C'
    ,'배송완료'
    ,'배송완료상태'
    ,'Y');
--3.
INSERT INTO lookups
VALUES
    ('PAYMENT'
    ,'결재상태구분');
INSERT INTO lookup_values
VALUES
    ('PAYMENT'
    ,'A'
    ,'미결제'
    ,'미결제상태'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('PAYMENT'
    ,'B'
    ,'결제완료'
    ,'결제완료상태'
    ,'Y');
--4.
INSERT INTO lookups
VALUES
    ('ITEM_GROUP1'
    ,'품목대분류');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP1'
    ,'P'
    ,'PENS'
    ,'필기류'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP1'
    ,'A'
    ,'PAPERS'
    ,'용지류'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP1'
    ,'O'
    ,'OFFICES'
    ,'사무용품'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP1'
    ,'F'
    ,'FILES'
    ,'파일/바인더'
    ,'Y');
--5.
INSERT INTO lookups
VALUES
    ('ITEM_GROUP2'
    ,'품목중분류');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'B'
    ,''
    ,'볼펜        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'C'
    ,''
    ,'형광펜         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'S'
    ,''
    ,'샤프        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'P'
    ,''
    ,'연필        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'E'
    ,''
    ,'수정용품      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'K'
    ,''
    ,'칼/가위      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'J'
    ,''
    ,'용지        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'G'
    ,''
    ,'견출지         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'A'
    ,''
    ,'복사용지      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'N'
    ,''
    ,'노트        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'F'
    ,''
    ,'파일        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'V'
    ,''
    ,'바인더         '
    ,'Y');

--6.
INSERT INTO lookups
VALUES
    ('ITEM_GROUP3'
    ,'품목소분류');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'1'
    ,''
    ,'유성볼펜      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'2'
    ,''
    ,'수성펜         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'3'
    ,''
    ,'중성펜         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'4'
    ,''
    ,'형광펜         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'5'
    ,''
    ,'붓펜        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'6'
    ,''
    ,'일반샤프      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'7'
    ,''
    ,'샤프심         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'8'
    ,''
    ,'연필        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'9'
    ,''
    ,'연필깍이      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'A'
    ,''
    ,'색연필         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'B'
    ,''
    ,'수정테이프       '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'C'
    ,''
    ,'지우개         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'D'
    ,''
    ,'소형커터      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'E'
    ,''
    ,'대형커터      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'F'
    ,''
    ,'커터날         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'G'
    ,''
    ,'일반포스트잇  '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'H'
    ,''
    ,'메모지       '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'I'
    ,''
    ,'일반견출지     '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'J'
    ,''
    ,'보호비닐견출지   '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'K'
    ,''
    ,'원형/모형견출지 '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'L'
    ,''
    ,'A4          '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'M'
    ,''
    ,'A3          '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'N'
    ,''
    ,'B4          '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'O'
    ,''
    ,'B5          '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'P'
    ,''
    ,'재생용지      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'Q'
    ,''
    ,'일반노트      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'R'
    ,''
    ,'수첩        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'S'
    ,''
    ,'중고노트      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'T'
    ,''
    ,'일반화일      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'U'
    ,''
    ,'종이화일      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'V'
    ,''
    ,'장식화일      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'W'
    ,''
    ,'D링바인더       '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'X'
    ,''
    ,'아치바인더       '
    ,'Y');

------------------------------------------------------
UPDATE lookup_values lv
SET    lv.lookup_values = lv.descriptions
WHERE  lv.lookup = 'ITEM_GROUP3';
UPDATE lookup_values lv
SET    lv.lookup_values = lv.descriptions
WHERE  lv.lookup = 'ITEM_GROUP2';

DELETE lookup_values lv
WHERE  lv.lookup = 'ITEM_GROUP2';

------------------------------------------------------
SELECT lk.lookup_description
      ,lv.*
FROM   lookups lk
JOIN   lookup_values lv
ON     lk.lookup = lv.lookup
WHERE  1 = 1
--AND    lk.lookup = 'ITEM_GROUP1'
ORDER  BY lk.lookup
         ,lv.lookup_code;

SELECT *
FROM   items;
