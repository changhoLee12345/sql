SELECT p.*
      ,common.get_item_name(p.purchase_item) item_name
FROM   purchase_details p;

SELECT *
FROM   purchase_detail_vo
WHERE  1 = 1
ORDER  BY purchase_code
         ,purchase_detail_code;

SELECT sl.sale_code
      ,srl.sale_item_code
      ,srl.sale_qty
      ,sl.sale_date
FROM   sales sl
JOIN   sale_details srl
ON     sl.sale_code = srl.sale_code
WHERE  sl.sale_code = 'S20180301013';

SELECT *
FROM   stock_in_out_vo
WHERE  item_code IN ('FFR00003'
                    ,'JCB00003'
                    ,'OGB00001'
                    ,'OPP00003')
ORDER  BY txn_date;

SELECT *
FROM   stock_onhands so
WHERE  so.item_code IN ('FFR00003'
                       ,'JCB00003'
                       ,'OGB00001'
                       ,'OPP00003');

SELECT *
FROM   employees
WHERE  work_day LIKE '%' || TO_CHAR(SYSDATE
                                   ,'dy') || '%';

SELECT *
FROM   purchases;

SELECT *
FROM   purchase_details
WHERE  purchase_code = 'P20180411004';

SELECT *
FROM   stock_onhands;

SELECT *
FROM   stock_onhands_vo;

SELECT *
FROM   items
WHERE  item_code = 'OPP00003'
