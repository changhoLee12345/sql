create or replace NONEDITIONABLE PROCEDURE CREATE_ORDER_PROC (P_USER_ID IN VARCHAR2)
AS
  cursor c_cart is select cart_no
                         ,crt.product_no
                         ,qty
                         ,user_id
                         ,sale_price
                   from tbl_cart crt
                   join tbl_product prd
                   on crt.product_no = prd.product_no
                   where user_id = p_user_id
                   order by cart_no;
                   
  v_order_no purchase_order.order_no%type;
BEGIN
  --주문번호생성.
  select create_po_number()
  into v_order_no
  from dual;
  
  --주문 마스터 생성.
  insert into purchase_order (order_no, user_id, address_to, order_status)
  values(v_order_no, p_user_id, 'Seoul 100', '주문');
  --주문 상세 생성.
  for r_cart in c_cart loop
    insert into order_details(order_detail_no, product_no, qty, order_price, order_no)
    values(order_details_seq.nextval, r_cart.product_no, r_cart.qty, r_cart.sale_price, v_order_no);  
  end loop;
  --장바구니 비우기.
  delete from tbl_cart
  where user_id = p_user_id;
  
  commit;
END CREATE_ORDER_PROC;