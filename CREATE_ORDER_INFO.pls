create or replace PROCEDURE CREATE_ORDER_INFO 
(
  P_USER_ID IN VARCHAR2 
, P_CURSOR OUT SYS_REFCURSOR
) 
AS 

 cursor c_order(v_order_no varchar2)
 is
 select order_no
       ,order_status
       ,address_to
       ,order_detail_no
       ,product_no
       ,product_name
       ,qty
       ,order_price
 from v_order_items
 where order_no = v_order_no;
 
 v_out_cursor SYS_REFCURSOR;
 
BEGIN
  NULL;
  open v_out_cursor for
 select order_no
       ,order_status
       ,address_to
       ,order_detail_no
       ,product_no
       ,product_name
       ,qty
       ,order_price
 from jsp.v_order_items;
  
  p_cursor := v_out_cursor;
END CREATE_ORDER_INFO;