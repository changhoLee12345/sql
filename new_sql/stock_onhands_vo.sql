CREATE OR REPLACE VIEW stock_onhands_vo AS
SELECT itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty quantities
      ,itm.supply_price
      ,itm.selling_price
      ,itm.item_tax
      ,itm.expire_date
      ,itm.vendor_code
      ,itm.min_qty
      ,NVL(sts.onhand_qty
          ,0) onhand_qty
      ,sts.txn_date
FROM   stock_onhands sts
RIGHT  OUTER JOIN items itm
ON     sts.item_code = itm.item_code;
