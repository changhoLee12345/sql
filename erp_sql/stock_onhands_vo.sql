CREATE OR REPLACE VIEW stock_onhands_vo
/*
  재고 정보를 확인하는 뷰 2018.04.04.
*/
AS
SELECT itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty 
      ,itm.supply_price
      ,itm.selling_price
      ,itm.item_tax
      ,itm.expire_date
      ,itm.vendor_code
      ,itm.min_qty
      ,sts.onhand_qty
      ,sts.txn_date
FROM   stock_onhands sts
JOIN   items itm
ON     sts.item_code = itm.item_code
