CREATE OR REPLACE VIEW purchase_request_vo AS
SELECT itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty
      ,itm.supply_price
      ,itm.selling_price
      ,itm.vendor_code
      ,itm.min_qty
      ,itm.item_tax
      ,itm.expire_date
      ,NVL(soh.onhand_qty
          ,0) onhand_qty
      ,itm.min_qty - NVL(soh.onhand_qty
                        ,0) req_qty
FROM   items itm
LEFT   OUTER JOIN stock_onhands soh
ON     itm.item_code = soh.item_code
WHERE  itm.min_qty > NVL(soh.onhand_qty
                        ,0)
AND    NOT EXISTS (SELECT 1
        FROM   purchase_detail_temp tmp
        WHERE  itm.item_code = tmp.tmp_purchase_item);
