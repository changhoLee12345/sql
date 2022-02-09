SELECT *
FROM   tab;

---------------------------------------
-------<기초정보: 품목>
---------------------------------------
drop TABLE items cascade constraints;
CREATE TABLE items(item_code CHAR(8) NOT NULL
                  ,item_name VARCHAR2(100)
                  ,uom VARCHAR2(10)
                  ,in_qty NUMBER
                  ,supply_price NUMBER
                  ,selling_price NUMBER
                  ,item_tax NUMBER(3
                         ,2)
                  ,expire_date   NUMBER DEFAULT 5
                  ,vendor_code CHAR(10));
ALTER TABLE items ADD (min_qty NUMBER);
commint ON COLUMN items.min_qty IS '최소재고수량';                  
COMMENT ON column items.item_code IS '품목코드 형식 - 품목분류 이니셜 코드 1자리 + 품목 코드 7자리 ';
COMMENT ON column items.item_name IS '품목명';
--COMMENT ON column items.item_group IS '품목분류 필기구(PENS), 복사용지(PAPERS), 일반사무용품(OFFICES), 파일바인더(FILES)';
COMMENT ON column items.supply_price IS '공급가';
COMMENT ON column items.selling_price IS '판매가';
COMMENT ON column items.item_tax IS '부가세 10% (0.1)';
COMMENT ON column items.expire_date IS '사용연한 default 5년?';
COMMENT ON column items.vendor_code IS '구매처';
COMMENT ON TABLE items IS '품목정보';
CREATE UNIQUE INDEX entity_pk ON items(item_code);
ALTER TABLE items add CONSTRAINT items_pk primary key(item_code)
    USING INDEX entity_pk;

---------------------------------------
-------<기초정보: 구매처>
---------------------------------------
drop TABLE vendors cascade constraints;
CREATE TABLE vendors(vendor_code CHAR(10) NOT NULL
                    ,vendor_name VARCHAR2(100)
                    ,vendor_owner VARCHAR2(20)
                    ,vendor_loc VARCHAR2(100)
                    ,vendor_phone VARCHAR2(15)
                    ,vendor_bank VARCHAR2(30)
                    ,vendor_account VARCHAR2(30));
COMMENT ON column vendors.vendor_code IS '사업자등록번호';
COMMENT ON column vendors.vendor_name IS '사업체명';
COMMENT ON column vendors.vendor_owner IS '대표자명';
COMMENT ON column vendors.vendor_loc IS '소재지';
COMMENT ON column vendors.vendor_phone IS '연락처';
COMMENT ON column vendors.vendor_bank IS '거래은행';
COMMENT ON column vendors.vendor_account IS '거래계좌';
COMMENT ON TABLE vendors IS '구매처';
CREATE UNIQUE INDEX vendors_pk ON vendors(vendor_code);
ALTER TABLE vendors add CONSTRAINT vendors_pk primary key(vendor_code)
    USING INDEX vendors_pk;

---------------------------------------
-------<기초정보: 판매처>
---------------------------------------
drop TABLE customers cascade constraints;
CREATE TABLE customers(customer_code CHAR(10) NOT NULL
                      ,customer_name VARCHAR2(100)
                      ,customer_owner VARCHAR2(20)
                      ,customer_loc VARCHAR2(100)
                      ,customer_phone VARCHAR2(15)
                      ,customer_pw    VARCHAR2(50) DEFAULT '1111');
COMMENT ON column customers.customer_code IS '사업자등록번호';
COMMENT ON column customers.customer_name IS '사업체명';
COMMENT ON column customers.customer_owner IS '대표자명';
COMMENT ON column customers.customer_loc IS '소재지';
COMMENT ON column customers.customer_phone IS '연락처';
COMMENT ON column customers.customer_pw IS '패스워드';
COMMENT ON TABLE customers IS '판매처';
CREATE UNIQUE INDEX customers_pk ON customers(customer_code);
ALTER TABLE customers add CONSTRAINT customers_pk primary key(customer_code)
    USING INDEX customers_pk;

---------------------------------------
-------<기초정보: 판매정보>
---------------------------------------
drop TABLE sales cascade constraints;
CREATE TABLE sales(sale_code CHAR(12) NOT NULL
                  ,sale_date DATE
                  ,customer_code CHAR(10) NOT NULL
                  ,sale_cost NUMBER
                  ,sale_item VARCHAR2(100) NOT NULL
                  ,sale_qty NUMBER
                  ,sale_price NUMBER
                  ,item_tax NUMBER(3
                         ,2)
                  ,delivery_addr VARCHAR2(100)
                  ,delivery_emp CHAR(10)
                  ,delivery_status CHAR(1)
                  ,pay_status CHAR(1)
                  ,warehouse CHAR(1)
                  ,order_permit CHAR(1));
COMMENT ON column sales.sale_code IS '판매코드
S + 판매일자(YYYYMMDD) + 일련번호 3자리 = 총 12자리';
COMMENT ON column sales.sale_date IS '판매일자';
COMMENT ON column sales.customer_code IS '판매처';
COMMENT ON column sales.sale_cost IS '결제금액';
COMMENT ON column sales.sale_item IS '품목코드';
COMMENT ON column sales.sale_qty IS '품목수량';
COMMENT ON column sales.sale_price IS '품목단가';
COMMENT ON column sales.item_tax IS '부가세';
COMMENT ON column sales.delivery_addr IS '배송지';
COMMENT ON column sales.delivery_emp IS '배송사원
입사연월일(YYYYMMDD) + 일련번호(2자리)';
COMMENT ON column sales.delivery_status IS '배송상태';
COMMENT ON column sales.pay_status IS '결제상태';
COMMENT ON column sales.warehouse IS '출하창고';
COMMENT ON TABLE sales IS '판매정보';
CREATE UNIQUE INDEX sales_pk ON sales(sale_code);
ALTER TABLE sales add CONSTRAINT sales_pk primary key(sale_code)
    USING INDEX sales_pk;

---------------------------------------
-------<기초정보: 판매상세정보>
---------------------------------------
drop TABLE sale_details cascade constraints;
CREATE TABLE sale_details(sale_detail_code VARCHAR2(15) NOT NULL
                         ,sale_code CHAR(12) NOT NULL
                         ,sale_item CHAR(8)
                         ,sale_qty NUMBER
                         ,sale_price NUMBER
                         ,item_tax NUMBER(3
                                ,2));

COMMENT ON column sale_details.sale_detail_code IS '판매상세코드
SD + 시퀀스';
COMMENT ON column sale_details.sale_code IS '판매코드
S + 판매일자(YYYYMMDD) + 일련번호 3자리 = 총 12자리';
COMMENT ON column sale_details.sale_item IS '품목코드';
COMMENT ON column sale_details.sale_qty IS '품목수량';
COMMENT ON column sale_details.sale_price IS '품목단가';
COMMENT ON column sale_details.item_tax IS '부가세';
COMMENT ON TABLE sale_details IS '판매품목정보';
CREATE UNIQUE INDEX sale_details_pk ON sale_details(sale_detail_code);
ALTER TABLE sale_details add CONSTRAINT sale_details_pk primary key(sale_detail_code)
    USING INDEX sale_details_pk;

---------------------------------------
-------<기초정보: 구매정보>
---------------------------------------
drop TABLE purchases cascade constraints;
CREATE TABLE purchases(purchase_code CHAR(12) NOT NULL
                      ,purchase_date DATE
                      ,vendor_code CHAR(10) NOT NULL
                      ,purchase_qty NUMBER
                      ,purchase_cost NUMBER
                      ,purchase_item VARCHAR2(100) NOT NULL
                      ,item_tax NUMBER(3
                             ,2));
COMMENT ON column purchases.purchase_code IS '구매코드
구매코드
: P + 구매일자(YYYYMMDD) + 일련번호(3자리) 총 12자리';
COMMENT ON column purchases.purchase_date IS '구매일자';
COMMENT ON column purchases.vendor_code IS '구매처';
COMMENT ON column purchases.purchase_qty IS '구매수량';
COMMENT ON column purchases.purchase_cost IS '결제금액';
COMMENT ON column purchases.purchase_item IS '품목코드';
COMMENT ON column purchases.item_tax IS '부가세';
COMMENT ON TABLE purchases IS '구매정보';
CREATE UNIQUE INDEX purchases_pk ON purchases(purchase_code);
ALTER TABLE purchases add CONSTRAINT purchases_pk primary key(purchase_code)
    USING INDEX purchases_pk;

---------------------------------------
-------<기초정보: 구매상세정보>
---------------------------------------
drop TABLE purchase_details cascade constraints;
CREATE TABLE purchase_details(purchase_detail_code VARCHAR2(15) NOT NULL
                             ,purchase_code VARCHAR2(12) NOT NULL
                             ,purchase_item CHAR(8)
                             ,purchase_qty NUMBER
                             ,purchase_price NUMBER
                             ,item_tax NUMBER(3
                                    ,2));
COMMENT ON column purchase_details.purchase_detail_code IS '구매상세코드
PD + 일련번호';
COMMENT ON column purchase_details.purchase_code IS '구매코드
: P + 구매일자(YYYYMMDD) + 일련번호(3자리) 총 12자리';
COMMENT ON column purchase_details.purchase_item IS '품목코드';
COMMENT ON column purchase_details.purchase_qty IS '품목수량';
COMMENT ON column purchase_details.purchase_price IS '품목단가';
COMMENT ON column purchase_details.item_tax IS '부가세';
COMMENT ON TABLE purchase_details IS '구매품목정보';
CREATE UNIQUE INDEX purchase_details_pk ON purchase_details(purchase_detail_code);
ALTER TABLE purchase_details add CONSTRAINT purchase_details_pk primary key(purchase_detail_code)
    USING INDEX purchase_details_pk;

---------------------------------------
-------<기초정보: 재고정보>
---------------------------------------
drop TABLE stocks cascade constraints;
CREATE TABLE stocks(item_code CHAR(8) NOT NULL
                   ,deal_date DATE
                   ,dealer_code VARCHAR2(12)
                   ,in_qty NUMBER
                   ,out_qty NUMBER
                   ,txn_date DATE);

COMMENT ON column stocks.item_code IS '품목코드';
COMMENT ON column stocks.deal_date IS '거래날짜';
COMMENT ON column stocks.dealer_code IS '구매, 판매번호';
COMMENT ON column stocks.in_qty IS '입고수량';
COMMENT ON column stocks.out_qty IS '출고수량';
--COMMENT ON column stocks.stock_qty IS '재고수량';
--COMMENT ON column stocks.limit_qty IS '재고한도수량';
COMMENT ON TABLE stocks IS '재고정보
재고정보 + 입출고내역정보';

---------------------------------------
-------<기초정보: 재고>
---------------------------------------
drop TABLE stock_onhands purge;
CREATE TABLE stock_onhands(item_code CHAR(8) primary key
                          ,onhand_qty NUMBER
                          ,txn_date DATE);

COMMENT ON column stock_onhands.item_code IS '품목코드';
COMMENT ON column stock_onhands.onhand_qty IS '현재고';
COMMENT ON column stock_onhands.txn_date IS '저장일시';

---------------------------------------
-------<기초정보: 사원정보>
---------------------------------------
drop TABLE employees cascade constraints;
CREATE TABLE employees(id CHAR(10) NOT NULL
                      ,NAME VARCHAR2(20)
                      ,gender CHAR(1)
                      ,birthday DATE
                      ,phone VARCHAR2(15)
                      ,job VARCHAR2(20)
                      ,grade VARCHAR2(20)
                      ,hire_date DATE
                      ,work_day VARCHAR2(30)
                      ,salary NUMBER
                      ,hire_status CHAR(1));
COMMENT ON column employees.id IS '사원번호
입사연월일(YYYYMMDD) + 일련번호(2자리)';
COMMENT ON column employees.name IS '사원이름';
COMMENT ON column employees.gender IS '성별';
COMMENT ON column employees.birthday IS '생년월일';
COMMENT ON column employees.phone IS '전화번호';
COMMENT ON column employees.job IS '직무';
COMMENT ON column employees.grade IS '직급';
COMMENT ON column employees.hire_date IS '입사일';
COMMENT ON column employees.work_day IS '근무요일';
COMMENT ON column employees.salary IS '급여';
COMMENT ON column employees.hire_status IS '재직상태';
COMMENT ON TABLE employees IS '사원';
CREATE UNIQUE INDEX employees_pk ON employees(id);
ALTER TABLE employees add CONSTRAINT employees_pk primary key(id)
    USING INDEX employees_pk;

---------------------------------------
-------<기초정보: 배송정보GPS>
---------------------------------------
drop TABLE delivery_loc cascade constraints;
CREATE TABLE delivery_loc(employee_id CHAR(10) NOT NULL
                         ,location_x VARCHAR2(30)
                         ,location_y VARCHAR2(30)
                         ,location_date DATE);

COMMENT ON column delivery_loc.employee_id IS '사원번호';
COMMENT ON column delivery_loc.location_x IS '위치 X';
COMMENT ON column delivery_loc.location_y IS '위치 Y';
COMMENT ON column delivery_loc.location_date IS '기록시각';
COMMENT ON TABLE delivery_loc IS '배송위치정보';
