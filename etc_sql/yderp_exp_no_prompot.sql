create table YDERP.CUSTOMERS
(
  customer_code      CHAR(10) not null,
  customer_name      VARCHAR2(100),
  customer_owner     VARCHAR2(20),
  customer_loc       VARCHAR2(100),
  customer_phone     VARCHAR2(15),
  customer_pw        VARCHAR2(50) default '1234',
  use_flag           CHAR(1) default 'Y',
  customer_bank      VARCHAR2(20),
  customer_account   VARCHAR2(20),
  customer_bankowner VARCHAR2(20),
  loc_addr           VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table YDERP.CUSTOMERS
  is '판매처';
comment on column YDERP.CUSTOMERS.customer_code
  is '사업자등록번호';
comment on column YDERP.CUSTOMERS.customer_name
  is '사업체명';
comment on column YDERP.CUSTOMERS.customer_owner
  is '대표자명';
comment on column YDERP.CUSTOMERS.customer_loc
  is '소재지';
comment on column YDERP.CUSTOMERS.customer_phone
  is '연락처';
comment on column YDERP.CUSTOMERS.customer_pw
  is '패스워드';
comment on column YDERP.CUSTOMERS.use_flag
  is '거래중';
comment on column YDERP.CUSTOMERS.customer_bank
  is '계좌 은행명';
comment on column YDERP.CUSTOMERS.customer_account
  is '계좌번호';
comment on column YDERP.CUSTOMERS.customer_bankowner
  is '계좌주
';
comment on column YDERP.CUSTOMERS.loc_addr
  is '상세주소';
alter table YDERP.CUSTOMERS
  add constraint CUSTOMERS_PK primary key (CUSTOMER_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.DELIVERY_LOC
(
  employee_id   CHAR(10) not null,
  location_x    VARCHAR2(30),
  location_y    VARCHAR2(30),
  location_date DATE,
  emp_key       NUMBER
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table YDERP.DELIVERY_LOC
  is '배송위치정보';
comment on column YDERP.DELIVERY_LOC.employee_id
  is '사원번호';
comment on column YDERP.DELIVERY_LOC.location_x
  is '위치 X';
comment on column YDERP.DELIVERY_LOC.location_y
  is '위치 Y';
comment on column YDERP.DELIVERY_LOC.location_date
  is '기록시각';

create table YDERP.DEPARTMENTS
(
  department_id   NUMBER(4) not null,
  department_name VARCHAR2(30),
  manager_id      NUMBER(6),
  location_id     NUMBER(4),
  department_code VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.EMPLOYEES
(
  id          CHAR(10) not null,
  name        VARCHAR2(20),
  gender      CHAR(1),
  birthday    DATE,
  phone       VARCHAR2(15),
  job         VARCHAR2(20),
  grade       VARCHAR2(20),
  hire_date   DATE,
  work_day    VARCHAR2(30),
  salary      NUMBER,
  hire_status CHAR(1),
  pw          VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table YDERP.EMPLOYEES
  is '사원';
comment on column YDERP.EMPLOYEES.id
  is '사원번호
입사연월일(YYYYMMDD) + 일련번호(2자리)';
comment on column YDERP.EMPLOYEES.name
  is '사원이름';
comment on column YDERP.EMPLOYEES.gender
  is '성별';
comment on column YDERP.EMPLOYEES.birthday
  is '생년월일';
comment on column YDERP.EMPLOYEES.phone
  is '전화번호';
comment on column YDERP.EMPLOYEES.job
  is '직무';
comment on column YDERP.EMPLOYEES.grade
  is '직급';
comment on column YDERP.EMPLOYEES.hire_date
  is '입사일';
comment on column YDERP.EMPLOYEES.work_day
  is '근무요일';
comment on column YDERP.EMPLOYEES.salary
  is '급여';
comment on column YDERP.EMPLOYEES.hire_status
  is '재직상태';
comment on column YDERP.EMPLOYEES.pw
  is '관리자 비밀번호';
alter table YDERP.EMPLOYEES
  add constraint EMPLOYEES_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.ITEMS
(
  item_code     CHAR(8) not null,
  item_name     VARCHAR2(100),
  uom           VARCHAR2(10),
  in_qty        NUMBER,
  supply_price  NUMBER,
  selling_price NUMBER,
  item_tax      NUMBER(3,2),
  expire_date   NUMBER default 5,
  vendor_code   CHAR(10),
  min_qty       NUMBER,
  add_date      DATE
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table YDERP.ITEMS
  add constraint ITEMS_PK primary key (ITEM_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.LOOKUPS
(
  lookup             VARCHAR2(20) not null,
  lookup_description VARCHAR2(300)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table YDERP.LOOKUPS
  add primary key (LOOKUP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.LOOKUP_VALUES
(
  lookup        VARCHAR2(20) not null,
  lookup_code   VARCHAR2(10) not null,
  lookup_values VARCHAR2(30),
  descriptions  VARCHAR2(100),
  flag          CHAR(1) default 'Y',
  dff           VARCHAR2(10),
  reflag        CHAR(1) default 'N',
  lookup_idx    NUMBER not null
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index YDERP.UNIQ on YDERP.LOOKUP_VALUES (LOOKUP_IDX)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table YDERP.LOOKUP_VALUES
  add constraint UNIQUE_KEY primary key (LOOKUP, LOOKUP_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.PURCHASES
(
  purchase_code CHAR(12) not null,
  purchase_date DATE,
  vendor_code   CHAR(10),
  purchase_qty  NUMBER,
  purchase_cost NUMBER,
  purchase_item VARCHAR2(100),
  item_tax      NUMBER(3,2),
  in_flag       VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table YDERP.PURCHASES
  is '구매정보';
comment on column YDERP.PURCHASES.purchase_code
  is '구매코드
구매코드
: P + 구매일자(YYYYMMDD) + 일련번호(3자리) 총 12자리';
comment on column YDERP.PURCHASES.purchase_date
  is '구매일자';
comment on column YDERP.PURCHASES.vendor_code
  is '구매처';
comment on column YDERP.PURCHASES.purchase_qty
  is '구매수량';
comment on column YDERP.PURCHASES.purchase_cost
  is '결제금액';
comment on column YDERP.PURCHASES.purchase_item
  is '품목코드';
comment on column YDERP.PURCHASES.item_tax
  is '부가세';
alter table YDERP.PURCHASES
  add constraint PURCHASES_PK primary key (PURCHASE_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.PURCHASE_DETAILS
(
  purchase_detail_code VARCHAR2(15) not null,
  purchase_code        VARCHAR2(12) not null,
  purchase_item        CHAR(8),
  purchase_qty         NUMBER,
  purchase_price       NUMBER,
  item_tax             NUMBER(3,2),
  incoming_flag        CHAR(1)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table YDERP.PURCHASE_DETAILS
  is '구매품목정보';
comment on column YDERP.PURCHASE_DETAILS.purchase_detail_code
  is '구매상세코드
PD + 일련번호';
comment on column YDERP.PURCHASE_DETAILS.purchase_code
  is '구매코드
: P + 구매일자(YYYYMMDD) + 일련번호(3자리) 총 12자리';
comment on column YDERP.PURCHASE_DETAILS.purchase_item
  is '품목코드';
comment on column YDERP.PURCHASE_DETAILS.purchase_qty
  is '품목수량';
comment on column YDERP.PURCHASE_DETAILS.purchase_price
  is '품목단가';
comment on column YDERP.PURCHASE_DETAILS.item_tax
  is '부가세';
alter table YDERP.PURCHASE_DETAILS
  add constraint PURCHASE_DETAILS_PK primary key (PURCHASE_DETAIL_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.PURCHASE_DETAIL_TEMP
(
  tmp_detail_code    VARCHAR2(15),
  tmp_master_code    VARCHAR2(12),
  tmp_vendor_code    VARCHAR2(10),
  tmp_purchase_item  VARCHAR2(8),
  tmp_purchase_qty   NUMBER,
  tmp_purchase_price NUMBER,
  tmp_item_tax       NUMBER(3,2)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.SALES
(
  sale_code       CHAR(12) not null,
  sale_date       DATE,
  customer_code   CHAR(10) not null,
  sale_cost       NUMBER,
  delivery_addr   VARCHAR2(100),
  delivery_emp    CHAR(10),
  delivery_status CHAR(1),
  pay_status      CHAR(1),
  warehouse       CHAR(1),
  order_permit    CHAR(1),
  delivery_date   DATE
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table YDERP.SALES
  is '판매정보';
comment on column YDERP.SALES.sale_code
  is '판매코드
S + 판매일자(YYYYMMDD) + 일련번호 3자리 = 총 12자리';
comment on column YDERP.SALES.sale_date
  is '판매일자';
comment on column YDERP.SALES.customer_code
  is '판매처';
comment on column YDERP.SALES.sale_cost
  is '결제금액';
comment on column YDERP.SALES.delivery_addr
  is '배송지';
comment on column YDERP.SALES.delivery_emp
  is '배송사원
입사연월일(YYYYMMDD) + 일련번호(2자리)';
comment on column YDERP.SALES.delivery_status
  is '배송상태';
comment on column YDERP.SALES.pay_status
  is '결제상태';
comment on column YDERP.SALES.warehouse
  is '출하창고';
comment on column YDERP.SALES.order_permit
  is '주문승인상태';
comment on column YDERP.SALES.delivery_date
  is '배송희망일자';
alter table YDERP.SALES
  add constraint SALES_PK primary key (SALE_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.SALES_TEMP
(
  customer_code VARCHAR2(12),
  item_code     VARCHAR2(8),
  request_qty   NUMBER,
  need_date     DATE,
  create_date   DATE,
  phone         VARCHAR2(20),
  delivery_addr VARCHAR2(100),
  custom_seq    NUMBER not null
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.SALE_DETAILS
(
  sale_detail_code VARCHAR2(15) not null,
  sale_code        CHAR(12) not null,
  sale_item_code   CHAR(8),
  sale_qty         NUMBER,
  sale_price       NUMBER,
  item_tax         NUMBER(3,2),
  sale_item_name   VARCHAR2(100),
  expire_date      NUMBER,
  vendor_code      CHAR(10)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table YDERP.SALE_DETAILS
  is '판매품목정보';
comment on column YDERP.SALE_DETAILS.sale_detail_code
  is '판매상세코드
SD + 시퀀스';
comment on column YDERP.SALE_DETAILS.sale_code
  is '판매코드
S + 주문일자(YYYYMMDD) + 일련번호 3자리 = 총 12자리';
comment on column YDERP.SALE_DETAILS.sale_item_code
  is '품목코드';
comment on column YDERP.SALE_DETAILS.sale_qty
  is '품목수량';
comment on column YDERP.SALE_DETAILS.sale_price
  is '품목단가';
comment on column YDERP.SALE_DETAILS.item_tax
  is '부가세';
comment on column YDERP.SALE_DETAILS.sale_item_name
  is '품목명
';
comment on column YDERP.SALE_DETAILS.expire_date
  is '사용연한';
comment on column YDERP.SALE_DETAILS.vendor_code
  is '구매처';
alter table YDERP.SALE_DETAILS
  add constraint SALE_DETAILS_PK primary key (SALE_DETAIL_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.STOCKS
(
  stock_id    NUMBER not null,
  item_code   CHAR(8) not null,
  deal_date   DATE,
  dealer_code VARCHAR2(12),
  in_qty      NUMBER,
  out_qty     NUMBER,
  txn_date    DATE
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index YDERP.STOCK_ID_UK on YDERP.STOCKS (STOCK_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.STOCKS_IN_OUT
(
  stock_id    NUMBER not null,
  item_code   CHAR(8) not null,
  deal_date   DATE,
  dealer_code VARCHAR2(12),
  in_qty      NUMBER,
  out_qty     NUMBER,
  txn_date    DATE
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index YDERP.STOCKS_ID_UK on YDERP.STOCKS_IN_OUT (STOCK_ID)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.STOCK_ONHANDS
(
  item_code  CHAR(8) not null,
  onhand_qty NUMBER,
  txn_date   DATE
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column YDERP.STOCK_ONHANDS.item_code
  is '품목코드';
comment on column YDERP.STOCK_ONHANDS.onhand_qty
  is '현재고';
comment on column YDERP.STOCK_ONHANDS.txn_date
  is '저장일시';
alter table YDERP.STOCK_ONHANDS
  add primary key (ITEM_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table YDERP.VENDORS
(
  vendor_code      CHAR(10) not null,
  vendor_name      VARCHAR2(100),
  vendor_owner     VARCHAR2(20),
  vendor_loc       VARCHAR2(100),
  vendor_phone     VARCHAR2(15),
  vendor_bank      VARCHAR2(30),
  vendor_account   VARCHAR2(30),
  vendor_bankowner VARCHAR2(20),
  use_flag         CHAR(1),
  loc_addr         VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table YDERP.VENDORS
  is '구매처';
comment on column YDERP.VENDORS.vendor_code
  is '사업자등록번호';
comment on column YDERP.VENDORS.vendor_name
  is '사업체명';
comment on column YDERP.VENDORS.vendor_owner
  is '대표자명';
comment on column YDERP.VENDORS.vendor_loc
  is '소재지';
comment on column YDERP.VENDORS.vendor_phone
  is '연락처';
comment on column YDERP.VENDORS.vendor_bank
  is '거래은행';
comment on column YDERP.VENDORS.vendor_account
  is '거래계좌';
comment on column YDERP.VENDORS.loc_addr
  is '상세주소';
alter table YDERP.VENDORS
  add constraint VENDORS_PK primary key (VENDOR_CODE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create sequence YDERP.DELIVERY_LOC_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

create sequence YDERP.LOOKUP_VALUE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000000101
increment by 1
cache 20;

create sequence YDERP.PURCHASE_DETAIL_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000000841
increment by 1
cache 20;

create sequence YDERP.SALES_DETAIL_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000000480
increment by 1
cache 20;

create sequence YDERP.SALE_TEMP_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000000301
increment by 1
cache 20;

create sequence YDERP.STOCKS_IN_OUT_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000001081
increment by 1
cache 20;

CREATE OR REPLACE FORCE VIEW YDERP.ITEM_GROUP1_V AS
SELECT lv.lookup,
       lv.lookup_code,
       lv.lookup_values,
       lv.descriptions,
       lv.flag,
       lv.dff,
       lv.reflag,
       lv.lookup_idx
FROM   lookup_values lv
WHERE  lv.lookup = 'ITEM_GROUP1';

CREATE OR REPLACE FORCE VIEW YDERP.ITEM_GROUP2_V AS
SELECT "LOOKUP","LOOKUP_CODE","LOOKUP_VALUES","DESCRIPTIONS","FLAG","DFF","REFLAG","LOOKUP_IDX"
FROM   lookup_values lv
WHERE  lv.lookup = 'ITEM_GROUP2';

CREATE OR REPLACE FORCE VIEW YDERP.ITEM_GROUP3_V AS
SELECT "LOOKUP","LOOKUP_CODE","LOOKUP_VALUES","DESCRIPTIONS","FLAG","DFF","REFLAG","LOOKUP_IDX"
FROM   lookup_values lv
WHERE  lv.lookup = 'ITEM_GROUP3';

CREATE OR REPLACE FORCE VIEW YDERP.PURCHASE_DETAIL_TEMP_VO AS
SELECT tmp.tmp_detail_code
      ,tmp.tmp_master_code
      ,tmp.tmp_purchase_qty
      ,tmp.tmp_purchase_price
      ,tmp.tmp_item_tax
      ,itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty
      ,itm.supply_price
      ,itm.selling_price
      ,itm.item_tax
      ,itm.expire_date
      ,itm.min_qty
      ,vend.vendor_code
      ,vend.vendor_name
      ,vend.vendor_owner
      ,vend.vendor_loc
      ,vend.vendor_phone
      ,vend.vendor_bank
      ,vend.vendor_account
FROM   purchase_detail_temp tmp
JOIN   items itm
ON     tmp.tmp_purchase_item = itm.item_code
JOIN   vendors vend
ON     tmp.tmp_vendor_code = vend.vendor_code;

CREATE OR REPLACE FORCE VIEW YDERP.PURCHASE_DETAIL_VO AS
SELECT pr.purchase_code
      ,pr.purchase_date
      ,pr.vendor_code
      ,prl.purchase_detail_code
      ,prl.purchase_item
      ,prl.purchase_qty
      ,prl.purchase_price
      ,prl.item_tax
			,pr.in_flag
      ,NVL(prl.incoming_flag
          ,'N') incoming_flag
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty
      ,itm.supply_price
      ,itm.selling_price
FROM   purchases pr
JOIN   purchase_details prl
ON     pr.purchase_code = prl.purchase_code
JOIN   items itm
ON     prl.purchase_item = itm.item_code;

CREATE OR REPLACE PACKAGE YDERP.common IS

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

    PROCEDURE create_sales_order_test(p_sales_order VARCHAR2
                                     ,p_status      OUT VARCHAR2);

    PROCEDURE create_sales_order(p_vendor_code VARCHAR2
                                ,p_msg         OUT VARCHAR2);

    FUNCTION create_sales_order_no RETURN VARCHAR2;

    FUNCTION get_vendor_name(p_vendor_code VARCHAR2) RETURN VARCHAR2;

    FUNCTION get_customer_name(p_customer_code VARCHAR2) RETURN VARCHAR2;

    FUNCTION get_item_name(p_item_code VARCHAR2) RETURN VARCHAR2;

    PROCEDURE create_purchase_info(p_msg OUT VARCHAR2);

    FUNCTION create_purchase_mast_no RETURN VARCHAR2;

    FUNCTION get_sale_item_qty(p_item_code VARCHAR2) RETURN NUMBER;

    FUNCTION get_onhand_qty(p_item_code VARCHAR2) RETURN NUMBER;

END common;
/

CREATE OR REPLACE FORCE VIEW YDERP.PURCHASE_REQUEST_VO AS
SELECT itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty
      ,itm.supply_price
      ,itm.selling_price
      ,itm.vendor_code
      ,itm.min_qty
      ,itm.item_tax
      ,itm.expire_date
      ,NVL(soh.onhand_qty, 0) onhand_qty
      ,NVL(common.get_sale_item_qty(itm.item_code), 0) sale_req_qty
      ,itm.min_qty - NVL(soh.onhand_qty,0) + NVL(common.get_sale_item_qty(itm.item_code), 0) req_qty
FROM   items itm
LEFT   OUTER JOIN stock_onhands soh
ON     itm.item_code = soh.item_code
WHERE  itm.min_qty + NVL(common.get_sale_item_qty(itm.item_code), 0) > NVL(soh.onhand_qty, 0)
AND    NOT EXISTS (SELECT 1
        FROM   purchase_detail_temp tmp
        WHERE  itm.item_code = tmp.tmp_purchase_item);

CREATE OR REPLACE FORCE VIEW YDERP.SALES_TEMP_VO AS
SELECT tmp.customer_code tcs
      ,tmp.custom_seq
      ,tmp.item_code
      ,tmp.request_qty
      ,tmp.need_date
      ,tmp.create_date
      ,itm.selling_price
      ,itm.item_tax
      ,itm.item_name
      ,itm.expire_date
      ,itm.vendor_code
      ,cs.customer_code
      ,cs.customer_name
      ,cs.customer_owner
      ,cs.customer_loc
      ,cs.customer_phone
      ,cs.customer_pw
      ,cs.use_flag
      ,cs.customer_bank
      ,cs.customer_account
      ,cs.customer_bankowner
      ,common.get_onhand_qty(itm.item_code) onhand_qty
FROM   sales_temp tmp
JOIN   items itm
ON     tmp.item_code = itm.item_code
JOIN   customers cs
ON     tmp.customer_code = cs.customer_code;

CREATE OR REPLACE FORCE VIEW YDERP.STOCK_IN_OUT_VO AS
SELECT sts.stock_id
      ,itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty        quantities
      ,itm.supply_price
      ,itm.selling_price
      ,itm.item_tax
      ,itm.expire_date
      ,itm.vendor_code
      ,itm.min_qty
      ,sts.dealer_code
      ,sts.deal_date
      ,sts.in_qty
      ,sts.out_qty
      ,sts.txn_date
FROM   stocks_in_out sts
JOIN   items itm
ON     sts.item_code = itm.item_code;

CREATE OR REPLACE FORCE VIEW YDERP.STOCK_ONHANDS_VO AS
SELECT itm.item_code
      ,itm.item_name
      ,itm.uom
      ,itm.in_qty quantities
      ,itm.supply_price
      ,itm.selling_price
      ,itm.item_tax
      ,itm.expire_date
      ,itm.vendor_code
      ,itm.min_qty
      ,NVL(sts.onhand_qty
          ,0) onhand_qty
      ,sts.txn_date
FROM   stock_onhands sts
RIGHT  OUTER JOIN items itm
ON     sts.item_code = itm.item_code;

create or replace function yderp.create_purchase_info return varchar2 as
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
            v_new_mast := common.create_purchase_mast_no;
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
        return 's';
end create_purchase_info;
/

CREATE OR REPLACE PROCEDURE YDERP.create_items(p_group1 IN VARCHAR2
                                        ,p_group2 IN VARCHAR2
                                        ,p_group3 IN VARCHAR2) IS

    v_new_no        NUMBER := 0;
    v_new_item_name VARCHAR2(8);

BEGIN

    SELECT NVL(LPAD(MAX(SUBSTR(item_code
                              ,4
                              ,5)) + 1
                   ,5
                   ,'0')
              ,'00001')
    INTO   v_new_no
    FROM   items itm
    WHERE  SUBSTR(item_code
                 ,1
                 ,3) = p_group1 || p_group2 || p_group3;

    v_new_item_name := p_group1 || p_group2 || p_group3 ||
                       LPAD(v_new_no
                           ,5
                           ,'0');

END create_items;
/

CREATE OR REPLACE PROCEDURE YDERP.items_ins_proc(p_group1        IN VARCHAR2
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
                                          ,p_add_date      IN DATE
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
        ,add_date
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
        ,sysdate
        ,p_min_qty);

    p_msg := 'success';

END items_ins_proc;
/

CREATE OR REPLACE PACKAGE BODY YDERP.common IS

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
            WHERE  pr.purchase_code = p_txn_no
            AND    NVL(prl.incoming_flag
                      ,'N') = 'Y'
            AND    NOT EXISTS
             (SELECT 1
                    FROM   stocks_in_out s
                    WHERE  s.dealer_code = prl.purchase_code
                    AND    s.item_code = prl.purchase_item);
    
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
    
        BEGIN
            UPDATE purchases p
            SET    in_flag = 'Y'
            WHERE  p.purchase_code = p_txn_no
            AND    NOT EXISTS (SELECT 1
                    FROM   purchase_details pd
                    WHERE  1 = 1
                    AND    p.purchase_code = pd.purchase_code
                    AND    NVL(pd.incoming_flag
                              ,'N') = 'N');
        END;
    
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
    
        UPDATE sales s
        SET    s.order_permit = 'Y'
        WHERE  s.sale_code = p_txn_no;
    
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

    PROCEDURE create_sales_order_test(p_sales_order IN VARCHAR2
                                     ,p_status      OUT VARCHAR2) IS
        CURSOR c1 IS
            SELECT itm.item_code
                  ,itm.selling_price
                  ,itm.min_qty
                  ,itm.item_tax
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
                    ,r.selling_price
                    ,r.min_qty
                    ,r.item_tax);
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
                ,''
                ,'N'
                ,'N'
                ,''
                ,'N');
        END;
        COMMIT;
        v_status := 'Success';
    
        p_status := v_status;
    
    END create_sales_order_test;

    PROCEDURE create_sales_order(p_vendor_code IN VARCHAR2
                                ,p_msg         OUT VARCHAR2) IS
    
        CURSOR c_main IS
            SELECT tmp.customer_code
                  ,TO_CHAR(tmp.need_date
                          ,'rrrrmmdd') r_date
            FROM   sales_temp tmp
            WHERE  tmp.customer_code = p_vendor_code
            GROUP  BY tmp.customer_code
                     ,TO_CHAR(tmp.need_date
                             ,'rrrrmmdd');
    
        CURSOR c1(v_date VARCHAR2) IS
            SELECT tmp.customer_code
                  ,tmp.item_code
                  ,tmp.request_qty
                  ,tmp.need_date
                  ,tmp.create_date
                  ,itm.selling_price
                  ,itm.item_tax
                  ,itm.item_name
                  ,itm.expire_date
                  ,itm.vendor_code
                  ,cs.customer_loc
            FROM   sales_temp tmp
            JOIN   items itm
            ON     tmp.item_code = itm.item_code
            JOIN   customers cs
            ON     tmp.customer_code = cs.customer_code
            WHERE  1 = 1
            AND    tmp.customer_code = p_vendor_code
            AND    TO_CHAR(tmp.need_date
                          ,'rrrrmmdd') = v_date;
    
        v_status     VARCHAR2(100) := 'Start';
        v_new_sales  VARCHAR2(12);
        v_sale_total NUMBER := 0;
        v_need_date  DATE := SYSDATE;
        v_cust_addr  VARCHAR2(1000);
        v_customer   VARCHAR2(10);
        v_count      NUMBER := 0;
    
    BEGIN
    
        --요청일자가 다른것은 같은 업체라도 다른 주문번호로 생성을 한다.
        FOR r_main IN c_main
        LOOP
            v_new_sales := common.create_sales_order_no;
            v_status    := 'order no';
            v_count     := 0;
            FOR r IN c1(r_main.r_date)
            LOOP
                BEGIN
                    INSERT INTO sale_details
                        (sale_detail_code
                        ,sale_code
                        ,sale_item_code
                        ,sale_qty
                        ,sale_price
                        ,item_tax
                        ,sale_item_name
                        ,expire_date
                        ,vendor_code)
                    VALUES
                        (TO_CHAR(sales_detail_seq.nextval)
                        ,v_new_sales
                        ,r.item_code
                        ,r.request_qty
                        ,r.selling_price
                        ,r.item_tax
                        ,r.item_name
                        ,r.expire_date
                        ,r.vendor_code);
                END;
                v_sale_total := v_sale_total +
                                (r.selling_price * r.request_qty);
                v_need_date  := r.need_date;
                v_cust_addr  := r.customer_loc;
                v_customer   := r.customer_code;
                v_count      := v_count + 1;
            END LOOP;
            v_status := 'order detail';
            IF v_customer IS NOT NULL THEN
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
                        ,order_permit
                        ,delivery_date)
                    VALUES
                        (v_new_sales
                        ,SYSDATE
                        ,v_customer
                        ,v_sale_total
                        ,v_cust_addr
                        ,''
                        ,'N'
                        ,'N'
                        ,''
                        ,'N'
                        ,v_need_date);
                END;
            
                DELETE FROM sales_temp st
                WHERE  st.customer_code = v_customer
                AND    TO_CHAR(st.need_date
                              ,'rrrrmmdd') = r_main.r_date;
            
                --COMMIT;
                v_status := 'Success';
            END IF;
        
        END LOOP;
        p_msg := v_status;
    
    END create_sales_order;

    FUNCTION create_sales_order_no RETURN VARCHAR2 IS
        v_new_no VARCHAR2(12);
    
    BEGIN
        SELECT 'S' || TO_CHAR(SYSDATE
                             ,'rrrrmmdd') ||
               NVL(LPAD(MAX(SUBSTR(s.sale_code
                                  ,10
                                  ,3) + 1)
                       ,3
                       ,'0')
                  ,'001')
        INTO   v_new_no
        FROM   sales s
        WHERE  SUBSTR(s.sale_code
                     ,1
                     ,9) = 'S' || TO_CHAR(SYSDATE
                                         ,'rrrrmmdd');
    
        RETURN v_new_no;
    END create_sales_order_no;

    FUNCTION get_vendor_name(p_vendor_code VARCHAR2) RETURN VARCHAR2 IS
    
        v_vend_name VARCHAR2(30);
    
    BEGIN
    
        SELECT vs.vendor_name
        INTO   v_vend_name
        FROM   vendors vs
        WHERE  vs.vendor_code = p_vendor_code;
        RETURN v_vend_name;
    END get_vendor_name;

    FUNCTION get_customer_name(p_customer_code VARCHAR2) RETURN VARCHAR2 IS
        v_customer_name VARCHAR2(100);
    
    BEGIN
        SELECT cs.customer_name
        INTO   v_customer_name
        FROM   customers cs
        WHERE  cs.customer_code = p_customer_code;
    
        RETURN v_customer_name;
    
    END get_customer_name;

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

    FUNCTION get_sale_item_qty(p_item_code VARCHAR2) RETURN NUMBER IS
        v_sum_qty NUMBER;
    
    BEGIN
    
        SELECT SUM(sd.sale_qty) sale_qty
        INTO   v_sum_qty
        FROM   sales s
        JOIN   sale_details sd
        ON     s.sale_code = sd.sale_code
        WHERE  NVL(s.order_permit
                  ,'N') = 'N'
        AND    sd.sale_item_code = p_item_code;
    
        RETURN v_sum_qty;
    
    END get_sale_item_qty;

    FUNCTION get_onhand_qty(p_item_code VARCHAR2) RETURN NUMBER IS
        v_onhand_qty NUMBER := 0;
    
    BEGIN
        BEGIN
            SELECT s.onhand_qty
            INTO   v_onhand_qty
            FROM   stock_onhands s
            WHERE  s.item_code = p_item_code;
        EXCEPTION
            WHEN OTHERS THEN
                v_onhand_qty := 0;
        END;
    
        RETURN v_onhand_qty;
    
    END get_onhand_qty;
END common;
/


