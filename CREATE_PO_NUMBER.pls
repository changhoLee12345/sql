create or replace NONEDITIONABLE FUNCTION CREATE_PO_NUMBER RETURN VARCHAR2 AS 

  v_prefix varchar2(7);
  v_suffix varchar2(3);
  v_cnt number;
  
BEGIN
  -- P202406001,
  select 'P'||to_char(sysdate, 'yyyymm')
  into v_prefix
  from dual;
  
  select count(1)
  into v_cnt
  from purchase_order
  where substr(order_no,1,7) = v_prefix;
  
  v_suffix := lpad(v_cnt+1, 3, '0');
  
  RETURN v_prefix || v_suffix;
END CREATE_PO_NUMBER;