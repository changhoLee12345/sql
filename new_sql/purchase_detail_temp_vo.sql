CREATE OR REPLACE VIEW purchase_detail_temp_vo AS
SELECT tmp.tmp_detail_code
      ,tmp.tmp_master_code
      ,tmp.tmp_purchase_qty
      ,tmp.tmp_purchase_price
      ,tmp.tmp_item_tax
      ,itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty
      ,itm.supply_price
      ,itm.selling_price
      ,itm.item_tax
      ,itm.expire_date
      ,itm.min_qty
      ,vend.vendor_code
      ,vend.vendor_name
      ,vend.vendor_owner
      ,vend.vendor_loc
      ,vend.vendor_phone
      ,vend.vendor_bank
      ,vend.vendor_account
FROM   purchase_detail_temp tmp
JOIN   items itm
ON     tmp.tmp_purchase_item = itm.item_code
JOIN   vendors vend
ON     tmp.tmp_vendor_code = vend.vendor_code;
