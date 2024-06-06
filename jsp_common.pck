CREATE OR REPLACE PACKAGE jsp_common IS

    -- Author  : WINNIE
    -- Created : 2024-06-06 오후 2:26:15
    -- Purpose : common package

    -- Public type declarations
    --type <TypeName> is <Datatype>;

    -- Public constant declarations
    --<ConstantName> constant <Datatype> := <Value>;

    -- Public variable declarations
    --<VariableName> <Datatype>;

    -- Public function and procedure declarations
    --function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;

    FUNCTION get_version RETURN VARCHAR2;

    PROCEDURE create_order_info(p_user_id IN VARCHAR2
                               ,p_cursor  OUT SYS_REFCURSOR);

    PROCEDURE create_order_proc(p_user_id IN VARCHAR2);

    FUNCTION create_po_number RETURN VARCHAR2;

END jsp_common;
/
CREATE OR REPLACE PACKAGE BODY jsp_common IS

    -- Private type declarations
    --type <TypeName> is <Datatype>;

    -- Private constant declarations
    --<ConstantName> constant <Datatype> := <Value>;

    -- Private variable declarations
    --<VariableName> <Datatype>;

    -- Function and procedure implementations
    --function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
    --  <LocalVariable> <Datatype>;
    --begin
    --  <Statement>;
    --  return(<Result>);
    --end;

    -- Initialization
    --<Statement>;
    FUNCTION get_version RETURN VARCHAR2 AS
    BEGIN
        RETURN 'help v.1.0';
    END get_version;

    PROCEDURE create_order_info(p_user_id IN VARCHAR2
                               ,p_cursor  OUT SYS_REFCURSOR) AS
        CURSOR c_order(v_order_no VARCHAR2) IS
            SELECT order_no
                  ,order_status
                  ,address_to
                  ,order_detail_no
                  ,product_no
                  ,product_name
                  ,qty
                  ,order_price
            FROM   v_order_items
            WHERE  order_no = v_order_no;
    
        v_out_cursor SYS_REFCURSOR;
    
    BEGIN
        NULL;
        OPEN v_out_cursor FOR
            SELECT order_no
                  ,order_status
                  ,address_to
                  ,order_detail_no
                  ,product_no
                  ,product_name
                  ,qty
                  ,order_price
            FROM   jsp.v_order_items;
    
        p_cursor := v_out_cursor;
    END create_order_info;

    PROCEDURE create_order_proc(p_user_id IN VARCHAR2) AS
        CURSOR c_cart IS
            SELECT cart_no
                  ,crt.product_no
                  ,qty
                  ,user_id
                  ,sale_price
            FROM   tbl_cart crt
            JOIN   tbl_product prd
            ON     crt.product_no = prd.product_no
            WHERE  user_id = p_user_id
            ORDER  BY cart_no;
    
        v_order_no purchase_order.order_no%TYPE;
    BEGIN
        --주문번호생성.
        SELECT create_po_number()
        INTO   v_order_no
        FROM   dual;
    
        --주문 마스터 생성.
        INSERT INTO purchase_order
            (order_no
            ,user_id
            ,address_to
            ,order_status)
        VALUES
            (v_order_no
            ,p_user_id
            ,'Seoul 100'
            ,'주문');
        --주문 상세 생성.
        FOR r_cart IN c_cart
        LOOP
            INSERT INTO order_details
                (order_detail_no
                ,product_no
                ,qty
                ,order_price
                ,order_no)
            VALUES
                (order_details_seq.nextval
                ,r_cart.product_no
                ,r_cart.qty
                ,r_cart.sale_price
                ,v_order_no);
        END LOOP;
        --장바구니 비우기.
        DELETE FROM tbl_cart
        WHERE  user_id = p_user_id;
    
        COMMIT;
    END create_order_proc;

    FUNCTION create_po_number RETURN VARCHAR2 AS
    
        v_prefix VARCHAR2(7);
        v_suffix VARCHAR2(3);
        v_cnt    NUMBER;
    
    BEGIN
        -- P202406001,
        SELECT 'P' || TO_CHAR(SYSDATE
                             ,'yyyymm')
        INTO   v_prefix
        FROM   dual;
    
        SELECT COUNT(1)
        INTO   v_cnt
        FROM   purchase_order
        WHERE  SUBSTR(order_no
                     ,1
                     ,7) = v_prefix;
    
        v_suffix := LPAD(v_cnt + 1
                        ,3
                        ,'0');
    
        RETURN v_prefix || v_suffix;
    END create_po_number;

END jsp_common;
/
