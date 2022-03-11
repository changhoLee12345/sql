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
        (1, '코드 스프링', 45000, 3);

    INSERT INTO cart
    VALUES
        (2, '혼자 자바2', 25000, 2);

    INSERT INTO cart
    VALUES
        (3, '혼자 자바3', 32000, 3);

    INSERT INTO cart
    VALUES
        (4, '혼자 자바4', 37000, 4);
    COMMIT;
END;
