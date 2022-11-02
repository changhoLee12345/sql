CREATE OR REPLACE PROCEDURE items_ins_proc(p_group1        IN VARCHAR2
                                          ,p_group2        IN VARCHAR2
                                          ,p_group3        IN VARCHAR2
                                          ,p_item_name     IN VARCHAR2
                                          ,p_uom           IN VARCHAR2
                                          ,p_in_qty        IN NUMBER
                                          ,p_supply_price  IN NUMBER
                                          ,p_selling_price IN NUMBER
                                          ,p_tax           IN NUMBER
                                          ,p_expire_date   IN VARCHAR2
                                          ,p_vendor_code   IN VARCHAR2
                                          ,p_min_qty       IN NUMBER
                                          ,p_msg           OUT VARCHAR2) IS

    v_new_no        NUMBER := 0;
    v_new_item_name VARCHAR2(8);

BEGIN

    BEGIN
        SELECT NVL(MAX(to_number(SUBSTR(item_code
                                       ,4
                                       ,5))) + 1
                  ,1)
        INTO   v_new_no
        FROM   items
        WHERE  SUBSTR(item_code
                     ,1
                     ,3) = p_group1 || p_group2 || p_group3;
    EXCEPTION
        WHEN OTHERS THEN
            v_new_no := 1;
    END;

    v_new_item_name := p_group1 || p_group2 || p_group3 ||
                       LPAD(v_new_no
                           ,5
                           ,'0');

    INSERT INTO items
        (item_code
        ,item_name
        ,uom
        ,in_qty
        ,supply_price
        ,selling_price
        ,item_tax
        ,expire_date
        ,vendor_code
        ,min_qty)
    VALUES
        (v_new_item_name
        ,p_item_name
        ,p_uom
        ,p_in_qty
        ,p_supply_price
        ,p_selling_price
        ,p_tax
        ,p_expire_date
        ,p_vendor_code
        ,p_min_qty);

    p_msg := 'success';

END items_ins_proc;
/
