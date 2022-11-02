CREATE OR REPLACE PACKAGE common IS

    -- Author  : USER
    -- Created : 2018-04-04 오후 2:46:45
    -- Purpose : common package

    -- Public type declarations
    --type <TypeName> is <Datatype>;

    -- Public constant declarations
    --<ConstantName> constant <Datatype> := <Value>;

    -- Public variable declarations
    --<VariableName> <Datatype>;

    -- Public function and procedure declarations
    --function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;

    PROCEDURE in_txn(p_txn_no VARCHAR2
                     --,p_item     VARCHAR2
                     --,p_qty      NUMBER
                     --,p_txn_type VARCHAR2
                     );

    PROCEDURE out_txn(p_txn_no VARCHAR2
                      --,p_item     VARCHAR2
                      --,p_qty      NUMBER
                      --,p_txn_type VARCHAR2
                      );

    PROCEDURE create_purchase_order(p_purchases_order VARCHAR2
                                   ,p_status          OUT VARCHAR2);

    PROCEDURE create_sales_order(p_sales_order VARCHAR2
                                ,p_status      OUT VARCHAR2);

    FUNCTION get_vendor_name(p_vendor_code VARCHAR2) RETURN VARCHAR2;

    FUNCTION get_item_name(p_item_code VARCHAR2) RETURN VARCHAR2;

    PROCEDURE create_purchase_info(p_msg OUT VARCHAR2);

    FUNCTION create_purchase_mast_no RETURN VARCHAR2;

END common;
/
CREATE OR REPLACE PACKAGE BODY common IS

    -- Private type declarations
    --type <TypeName> is <Datatype>;

    -- Private constant declarations
    --<ConstantName> constant <Datatype> := <Value>;

    -- Private variable declarations
    --<VariableName> <Datatype>;

    -- Function and procedure implementations
    /*function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
      <LocalVariable> <Datatype>;
    begin
      <Statement>;
      return(<Result>);
    end;*/
    PROCEDURE in_txn(p_txn_no VARCHAR2
                     --,p_item     VARCHAR2
                     --,p_qty      NUMBER
                     --,p_txn_type VARCHAR2
                     ) IS
    
        CURSOR c1 IS
            SELECT pr.purchase_code
                  ,prl.purchase_item
                  ,prl.purchase_qty
                  ,pr.purchase_date
            FROM   purchases pr
            JOIN   purchase_details prl
            ON     pr.purchase_code = prl.purchase_code
            WHERE  pr.purchase_code = p_txn_no;
    
        v_exists NUMBER := 0;
    
    BEGIN
    
        --입출이력만들고
        FOR r IN c1
        LOOP
        
            INSERT INTO stocks_in_out
                (stock_id
                ,item_code
                ,deal_date
                ,dealer_code
                ,in_qty
                ,out_qty
                ,txn_date)
            VALUES
                (stocks_in_out_seq.nextval
                ,r.purchase_item
                ,r.purchase_date
                ,r.purchase_code
                ,r.purchase_qty
                ,0
                ,SYSDATE);
        
            --입출재고 update
            SELECT COUNT(*)
            INTO   v_exists
            FROM   stock_onhands soh
            WHERE  soh.item_code = r.purchase_item;
        
            IF v_exists = 1 THEN
                UPDATE stock_onhands soh
                SET    soh.onhand_qty = soh.onhand_qty + r.purchase_qty
                      ,soh.txn_date   = SYSDATE
                WHERE  soh.item_code = r.purchase_item;
            
            ELSE
                INSERT INTO stock_onhands
                    (item_code
                    ,onhand_qty
                    ,txn_date)
                VALUES
                    (r.purchase_item
                    ,r.purchase_qty
                    ,SYSDATE);
            
            END IF;
        
        END LOOP;
    
        UPDATE purchases p
        SET    in_flag = 'Y'
        WHERE  p.purchase_code = p_txn_no;
    
        COMMIT;
    
    END in_txn;

    PROCEDURE out_txn(p_txn_no VARCHAR2
                      --,p_item     VARCHAR2
                      --,p_qty      NUMBER
                      --,p_txn_type VARCHAR2
                      ) IS
    
        CURSOR c1 IS
            SELECT sl.sale_code
                  ,srl.sale_item_code
                  ,srl.sale_qty
                  ,sl.sale_date
            FROM   sales sl
            JOIN   sale_details srl
            ON     sl.sale_code = srl.sale_code
            WHERE  sl.sale_code = p_txn_no;
    
        v_exists NUMBER := 0;
    
    BEGIN
    
        --입출이력만들고
        FOR r IN c1
        LOOP
        
            INSERT INTO stocks_in_out
                (stock_id
                ,item_code
                ,deal_date
                ,dealer_code
                ,in_qty
                ,out_qty
                ,txn_date)
            VALUES
                (stocks_in_out_seq.nextval
                ,r.sale_item_code
                ,r.sale_date
                ,r.sale_code
                ,0
                ,r.sale_qty
                ,SYSDATE);
        
            --입출재고 update
            SELECT COUNT(*)
            INTO   v_exists
            FROM   stock_onhands soh
            WHERE  soh.item_code = r.sale_item_code;
        
            IF v_exists = 1 THEN
                UPDATE stock_onhands soh
                SET    soh.onhand_qty = soh.onhand_qty - r.sale_qty
                      ,soh.txn_date   = SYSDATE
                WHERE  soh.item_code = r.sale_item_code;
            
            ELSE
                INSERT INTO stock_onhands
                    (item_code
                    ,onhand_qty
                    ,txn_date)
                VALUES
                    (r.sale_item_code
                    ,r.sale_qty
                    ,SYSDATE);
            
            END IF;
        
        END LOOP;
        COMMIT;
    
    END out_txn;

    PROCEDURE create_purchase_order(p_purchases_order IN VARCHAR2
                                   ,p_status          OUT VARCHAR2) IS
        CURSOR c1 IS
            SELECT itm.item_code
            FROM   items itm
            WHERE  1 = 1
            AND    NOT EXISTS (SELECT 1
                    FROM   purchase_details sd
                    WHERE  itm.item_code = sd.purchase_item)
            AND    ROWNUM < 5;
    
        v_status VARCHAR2(100) := 'Start';
    
    BEGIN
    
        FOR r IN c1
        LOOP
            BEGIN
                INSERT INTO purchase_details
                    (purchase_detail_code
                    ,purchase_code
                    ,purchase_item
                    ,purchase_qty
                    ,purchase_price
                    ,item_tax)
                VALUES
                    (TO_CHAR(purchase_detail_seq.nextval)
                    ,p_purchases_order
                    ,r.item_code
                    ,100
                    ,1000
                    ,0.1);
            END;
        END LOOP;
    
        BEGIN
            INSERT INTO purchases
                (purchase_code
                ,purchase_date
                ,vendor_code
                ,purchase_qty
                ,purchase_cost
                ,purchase_item
                ,item_tax)
            VALUES
                (p_purchases_order
                ,SYSDATE
                ,'1234567890'
                ,100
                ,100
                ,'test1234'
                ,0.1);
        END;
        COMMIT;
        v_status := 'Success';
    
        p_status := v_status;
    
    END create_purchase_order;

    PROCEDURE create_sales_order(p_sales_order IN VARCHAR2
                                ,p_status      OUT VARCHAR2) IS
        CURSOR c1 IS
            SELECT itm.item_code
            FROM   items itm
            WHERE  1 = 1
            AND    NOT EXISTS (SELECT 1
                    FROM   sale_details sd
                    WHERE  itm.item_code = sd.sale_item_code)
            AND    ROWNUM < 5;
    
        v_status VARCHAR2(100) := 'Start';
    
    BEGIN
    
        FOR r IN c1
        LOOP
            BEGIN
                INSERT INTO sale_details
                    (sale_detail_code
                    ,sale_code
                    ,sale_item_code
                    ,sale_qty
                    ,sale_price
                    ,item_tax)
                VALUES
                    (TO_CHAR(sales_detail_seq.nextval)
                    ,p_sales_order
                    ,r.item_code
                    ,100
                    ,1000
                    ,0.1);
            END;
        END LOOP;
    
        BEGIN
            INSERT INTO sales
                (sale_code
                ,sale_date
                ,customer_code
                ,sale_cost
                ,delivery_addr
                ,delivery_emp
                ,delivery_status
                ,pay_status
                ,warehouse
                ,order_permit)
            VALUES
                (p_sales_order
                ,SYSDATE
                ,'1234567890'
                ,100
                ,'대구시 중구 예담동 예담상사'
                ,'SAWON12345'
                ,'N'
                ,'N'
                ,'A'
                ,'N');
        END;
        COMMIT;
        v_status := 'Success';
    
        p_status := v_status;
    
    END create_sales_order;

    FUNCTION get_vendor_name(p_vendor_code VARCHAR2) RETURN VARCHAR2 IS
    
        v_vend_name VARCHAR2(30);
    
    BEGIN
    
        SELECT vs.vendor_name
        INTO   v_vend_name
        FROM   vendors vs
        WHERE  vs.vendor_code = p_vendor_code;
        RETURN v_vend_name;
    END get_vendor_name;

    FUNCTION get_item_name(p_item_code VARCHAR2) RETURN VARCHAR2 IS
        v_item_name VARCHAR2(100);
    
    BEGIN
    
        SELECT vs.item_name
        INTO   v_item_name
        FROM   items vs
        WHERE  vs.item_code = p_item_code;
        RETURN v_item_name;
    
    END get_item_name;

    --Temp 에 있는 데이터를 가지고 purchase header/detail 생성하는 proc;
    PROCEDURE create_purchase_info(p_msg OUT VARCHAR2) IS
    
        CURSOR c1 IS
            SELECT tmp_vendor_code
            FROM   purchase_detail_temp
            GROUP  BY tmp_vendor_code;
    
        CURSOR c2(p_vendor_code VARCHAR2) IS
            SELECT *
            FROM   purchase_detail_temp_vo dv
            WHERE  dv.vendor_code = p_vendor_code;
    
        v_new_mast VARCHAR2(12);
    
    BEGIN
        FOR r IN c1
        LOOP
            v_new_mast := create_purchase_mast_no;
            BEGIN
                INSERT INTO purchases
                    (purchase_code
                    ,purchase_date
                    ,vendor_code
                    ,purchase_qty
                    ,purchase_cost
                    ,purchase_item
                    ,item_tax)
                VALUES
                    (v_new_mast
                    ,SYSDATE
                    ,r.tmp_vendor_code
                    ,0
                    ,0
                    ,'aaa'
                    ,0);
            END;
        
            FOR r2 IN c2(r.tmp_vendor_code)
            LOOP
                BEGIN
                    INSERT INTO purchase_details
                        (purchase_detail_code
                        ,purchase_code
                        ,purchase_item
                        ,purchase_qty
                        ,purchase_price
                        ,item_tax
                        ,incoming_flag)
                    VALUES
                        (r2.tmp_detail_code
                        ,v_new_mast
                        ,r2.item_code
                        ,r2.tmp_purchase_qty
                        ,r2.tmp_purchase_price
                        ,r2.tmp_item_tax
                        ,'N');
                END;
            
                BEGIN
                    DELETE FROM purchase_detail_temp tmp
                    WHERE  tmp.tmp_detail_code = r2.tmp_detail_code;
                END;
            
            END LOOP;
        
        END LOOP;
        p_msg := 'success';
    
    END create_purchase_info;

    FUNCTION create_purchase_mast_no RETURN VARCHAR2 IS
        v_max    VARCHAR2(3) := '001';
        v_new_no VARCHAR2(12);
    
    BEGIN
        BEGIN
            SELECT NVL(LPAD((MAX(SUBSTR(purchase_code
                                       ,10
                                       ,3)) + 1)
                           ,3
                           ,'0')
                      ,'001')
            INTO   v_max
            FROM   purchases
            WHERE  SUBSTR(purchase_code
                         ,2
                         ,8) = TO_CHAR(SYSDATE
                                      ,'rrrrmmdd');
        EXCEPTION
            WHEN OTHERS THEN
                v_max := '001';
        END;
    
        SELECT 'P' || TO_CHAR(SYSDATE
                             ,'rrrrmmdd') || v_max
        INTO   v_new_no
        FROM   dual;
    
        RETURN v_new_no;
    
    END create_purchase_mast_no;

END common;
/
