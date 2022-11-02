CREATE OR REPLACE VIEW stock_in_out_vo AS
SELECT sts.stock_id
      ,itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty        quantities
      ,itm.supply_price
      ,itm.selling_price
      ,itm.item_tax
      ,itm.expire_date
      ,itm.vendor_code
      ,itm.min_qty
      ,sts.dealer_code
      ,sts.deal_date
      ,sts.in_qty
      ,sts.out_qty
      ,sts.txn_date
FROM   stocks_in_out sts
JOIN   items itm
ON     sts.item_code = itm.item_code;
