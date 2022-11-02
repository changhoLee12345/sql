CREATE OR REPLACE VIEW purchase_detail_vo AS
SELECT pr.purchase_code
      ,pr.purchase_date
      ,pr.vendor_code
      ,prl.purchase_detail_code
      ,prl.purchase_item
      ,prl.purchase_qty
      ,prl.purchase_price
      ,prl.item_tax
			,pr.in_flag
      ,NVL(prl.incoming_flag
          ,'N') incoming_flag
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty
      ,itm.supply_price
      ,itm.selling_price
FROM   purchases pr
JOIN   purchase_details prl
ON     pr.purchase_code = prl.purchase_code
JOIN   items itm
ON     prl.purchase_item = itm.item_code;
