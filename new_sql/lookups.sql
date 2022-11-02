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
    ,'â������');
INSERT INTO lookup_values
VALUES
    ('SUBINVENTORY'
    ,'A'
    ,'Subinventory A'
    ,'1�� â��'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('SUBINVENTORY'
    ,'B'
    ,'Subinventory B'
    ,'2�� â��'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('SUBINVENTORY'
    ,'C'
    ,'Subinventory C'
    ,'3�� â��'
    ,'Y');
--2.
INSERT INTO lookups
VALUES
    ('DELIVERY'
    ,'��۱���');
INSERT INTO lookup_values
VALUES
    ('DELIVERY'
    ,'A'
    ,'�߼���'
    ,'���� �غ� �� �ܰ�'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('DELIVERY'
    ,'B'
    ,'�����'
    ,'���� �� ��ۿϷ� ��'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('DELIVERY'
    ,'C'
    ,'��ۿϷ�'
    ,'��ۿϷ����'
    ,'Y');
--3.
INSERT INTO lookups
VALUES
    ('PAYMENT'
    ,'������±���');
INSERT INTO lookup_values
VALUES
    ('PAYMENT'
    ,'A'
    ,'�̰���'
    ,'�̰�������'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('PAYMENT'
    ,'B'
    ,'�����Ϸ�'
    ,'�����Ϸ����'
    ,'Y');
--4.
INSERT INTO lookups
VALUES
    ('ITEM_GROUP1'
    ,'ǰ���з�');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP1'
    ,'P'
    ,'PENS'
    ,'�ʱ��'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP1'
    ,'A'
    ,'PAPERS'
    ,'������'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP1'
    ,'O'
    ,'OFFICES'
    ,'�繫��ǰ'
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP1'
    ,'F'
    ,'FILES'
    ,'����/���δ�'
    ,'Y');
--5.
INSERT INTO lookups
VALUES
    ('ITEM_GROUP2'
    ,'ǰ���ߺз�');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'B'
    ,''
    ,'����        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'C'
    ,''
    ,'������         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'S'
    ,''
    ,'����        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'P'
    ,''
    ,'����        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'E'
    ,''
    ,'������ǰ      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'K'
    ,''
    ,'Į/����      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'J'
    ,''
    ,'����        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'G'
    ,''
    ,'������         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'A'
    ,''
    ,'�������      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'N'
    ,''
    ,'��Ʈ        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'F'
    ,''
    ,'����        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP2'
    ,'V'
    ,''
    ,'���δ�         '
    ,'Y');

--6.
INSERT INTO lookups
VALUES
    ('ITEM_GROUP3'
    ,'ǰ��Һз�');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'1'
    ,''
    ,'��������      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'2'
    ,''
    ,'������         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'3'
    ,''
    ,'�߼���         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'4'
    ,''
    ,'������         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'5'
    ,''
    ,'����        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'6'
    ,''
    ,'�Ϲݻ���      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'7'
    ,''
    ,'������         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'8'
    ,''
    ,'����        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'9'
    ,''
    ,'���ʱ���      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'A'
    ,''
    ,'������         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'B'
    ,''
    ,'����������       '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'C'
    ,''
    ,'���찳         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'D'
    ,''
    ,'����Ŀ��      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'E'
    ,''
    ,'����Ŀ��      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'F'
    ,''
    ,'Ŀ�ͳ�         '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'G'
    ,''
    ,'�Ϲ�����Ʈ��  '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'H'
    ,''
    ,'�޸���       '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'I'
    ,''
    ,'�Ϲݰ�����     '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'J'
    ,''
    ,'��ȣ��Ұ�����   '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'K'
    ,''
    ,'����/���������� '
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
    ,'�������      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'Q'
    ,''
    ,'�Ϲݳ�Ʈ      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'R'
    ,''
    ,'��ø        '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'S'
    ,''
    ,'�߰��Ʈ      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'T'
    ,''
    ,'�Ϲ�ȭ��      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'U'
    ,''
    ,'����ȭ��      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'V'
    ,''
    ,'���ȭ��      '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'W'
    ,''
    ,'D�����δ�       '
    ,'Y');
INSERT INTO lookup_values
VALUES
    ('ITEM_GROUP3'
    ,'X'
    ,''
    ,'��ġ���δ�       '
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
