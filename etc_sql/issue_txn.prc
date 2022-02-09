CREATE OR REPLACE PROCEDURE issue_txn(p_issue_no IN VARCHAR2
                                     ,p_ret_msg  OUT VARCHAR2) IS
    CURSOR receiptlist IS
        SELECT *
        FROM   issue_info r
        WHERE  r.issue_no = p_issue_no;
BEGIN
    p_ret_msg := 'NG';
    FOR r IN receiptlist
    LOOP
        INSERT INTO receipt_issue_txn
            (seq_id
            ,item_code
            ,txn_quantity
            ,txn_sub
            ,txn_date
            ,receipt_issue_no)
        VALUES
            ((SELECT NVL(MAX(seq_id)
                       ,0) + 1
             FROM   receipt_issue_txn)
            ,r.issue_item
            ,r.issue_qty
            ,r.issue_sub
            ,SYSDATE
            ,r.issue_no);
    END LOOP;

    UPDATE issue_info ri
    SET    ri.issue_flag = 'Y'
    WHERE  ri.issue_no = p_issue_no;

    p_ret_msg := 'OK';

END issue_txn;
/
