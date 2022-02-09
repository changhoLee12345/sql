SELECT *
FROM   tab;

select * from CUSTOMERS;

SELECT customer_code AS customerCode,
      customer_name AS customerName,
      customer_owner AS customerOwner,
      customer_loc AS customerLoc,
      customer_bank AS customerBank,
      customer_account AS customerAccount,
      customer_bankowner AS customerBankowner,
      use_flag,
      loc_addr
    FROM customers
    WHERE customer_code = 'admin12345'
    AND customer_pw = 'pw';
