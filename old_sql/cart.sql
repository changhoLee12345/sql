SELECT *
FROM   tab;

CREATE TABLE cart(no NUMBER primary key
                 ,porduct_nm VARCHAR2(50)
                 ,price NUMBER
                 ,qty NUMBER);

SELECT *
FROM   cart;

BEGIN
    INSERT INTO cart
    VALUES
        (1, '�ڵ� ������', 45000, 3);

    INSERT INTO cart
    VALUES
        (2, 'ȥ�� �ڹ�2', 25000, 2);

    INSERT INTO cart
    VALUES
        (3, 'ȥ�� �ڹ�3', 32000, 3);

    INSERT INTO cart
    VALUES
        (4, 'ȥ�� �ڹ�4', 37000, 4);
    COMMIT;
END;
