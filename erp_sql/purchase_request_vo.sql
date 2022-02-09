CREATE OR REPLACE VIEW purchase_request_vo
/*
  ���ſ�û ������ Ȯ���ϴ� �� 2018.04.04.
*/
AS
SELECT itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty
      ,itm.supply_price
      ,itm.selling_price
      ,itm.vendor_code
      ,itm.min_qty
      ,soh.onhand_qty
      ,itm.min_qty - soh.onhand_qty req_qty
FROM   items itm
JOIN   stock_onhands soh
ON     itm.item_code = soh.item_code
WHERE  itm.min_qty > soh.onhand_qty
