SELECT *
FROM   stock_in_out_vo;

SELECT *
FROM   stock_onhands_vo;

SELECT *
FROM   purchase_request_vo
ORDER  BY vendor_code
         ,item_code;

SELECT *
FROM   purchase_detail_temp_vo;

SELECT *
FROM   purchase_detail_vo vo
WHERE  vo.purchase_code = 'P20180301001'
ORDER  BY purchase_code
         ,purchase_detail_code;

SELECT *
FROM   purchase_details;

SELECT *
FROM   lookups;

SELECT lv.lookup_code
      ,lv.lookup_values
FROM   lookups       lk
      ,lookup_values lv
WHERE  lk.lookup = lv.lookup
AND    lk.lookup = 'SUBINVENTORY';

SELECT lv.lookup_code
      ,lv.lookup_values
FROM   lookups lk
JOIN   lookup_values lv
ON     lk.lookup = lv.lookup
WHERE  lk.lookup = 'SUBINVENTORY';
