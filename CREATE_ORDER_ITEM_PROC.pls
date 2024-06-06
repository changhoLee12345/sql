create or replace NONEDITIONABLE PROCEDURE CREATE_ORDER_ITEM_PROC 
(
  P_YYYYMM IN VARCHAR2 
, P_OUT_CURSOR OUT sys_refcursor
) AS 
BEGIN
  open p_out_cursor for
  select order_detail_no, order_no, product_no, qty, order_price, creation_date
  from order_details
  where substr(order_no,1,7) = 'P'||p_yyyymm;

END CREATE_ORDER_ITEM_PROC;