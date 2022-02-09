SELECT *
FROM   tab;

SELECT *
FROM   items;

/*INSERT INTO sales VALUES('S20180303001',SYSDATE,'1234567890','address1','SAWON12345','N','N','A','N');
INSERT INTO sale_details VALUES('1000000001','S20180303001','PCC00001',1,100);
INSERT INTO sale_details VALUES('1000000002','S20180303001','PCC00003',1,100);
INSERT INTO sale_details VALUES('1000000003','S20180303001','PSR00001',1,100);*/
SELECT *
FROM   sales sl
JOIN   sale_details sd
ON     sl.sale_code = sd.sale_code;

SELECT *
FROM   purchases;

/*INSERT INTO purchases VALUES('P20180301003',SYSDATE,'1234567890',10,1000,'PPG00001 외 3건',0.1);
INSERT INTO purchase_details VALUES('1000000007','P20180301003','PCC00001',3,100,0.1);
INSERT INTO purchase_details VALUES('1000000008','P20180301003','PCC00003',3,100,0.1);
INSERT INTO purchase_details VALUES('1000000009','P20180301003','PSR00001',3,100,0.1);*/

SELECT *
FROM   purchases pr
JOIN   purchase_details prl
ON     pr.purchase_code = prl.purchase_code;

SELECT *
FROM   items
WHERE  min_qty IS NOT NULL;

SELECT *
FROM   stock_onhands;

--구매요청정보 생성하는 sql
SELECT *
FROM   purchase_request_vo;

--입출고 정보를 확인하는 뷰
SELECT *
FROM   stock_in_out_vo;

--재고정보를 확인하는 뷰
SELECT *
FROM   stock_onhands_vo;

SELECT *
FROM   stock_onhands;

SELECT *
FROM   stocks
ORDER  BY txn_date;

SELECT item_code
      ,SUM(in_qty) - SUM(out_qty)
      ,'a' AS ccc
FROM   stocks
GROUP  BY item_code
--ORDER BY 1
UNION ALL
SELECT item_code
      ,onhand_qty
      ,'b'
FROM   stock_onhands
ORDER  BY ccc
         ,1;

SELECT *
FROM   session_privs;
