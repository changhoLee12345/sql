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
        
            INSERT INTO stocks
                (item_code
                ,deal_date
                ,dealer_code
                ,in_qty
                ,out_qty
                ,txn_date)
            VALUES
                (r.purchase_item
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
        COMMIT;
    
    END in_txn;

    PROCEDURE out_txn(p_txn_no VARCHAR2
                      --,p_item     VARCHAR2
                      --,p_qty      NUMBER
                      --,p_txn_type VARCHAR2
                      ) IS
    
        CURSOR c1 IS
            SELECT sl.sale_code
                  ,srl.sale_item
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
        
            INSERT INTO stocks
                (item_code
                ,deal_date
                ,dealer_code
                ,in_qty
                ,out_qty
                ,txn_date)
            VALUES
                (r.sale_item
                ,r.sale_date
                ,r.sale_code
                ,0
                ,r.sale_qty
                ,SYSDATE);
        
            --입출재고 update
            SELECT COUNT(*)
            INTO   v_exists
            FROM   stock_onhands soh
            WHERE  soh.item_code = r.sale_item;
        
            IF v_exists = 1 THEN
                UPDATE stock_onhands soh
                SET    soh.onhand_qty = soh.onhand_qty - r.sale_qty
                      ,soh.txn_date   = SYSDATE
                WHERE  soh.item_code = r.sale_item;
            
            ELSE
                INSERT INTO stock_onhands
                    (item_code
                    ,onhand_qty
                    ,txn_date)
                VALUES
                    (r.sale_item
                    ,r.sale_qty
                    ,SYSDATE);
            
            END IF;
        
        END LOOP;
        COMMIT;
    
    END out_txn;

END common;
/
