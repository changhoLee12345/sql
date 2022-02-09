SELECT *
FROM   tab;

---------------------------------------
-------<��������: ǰ��>
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
commint ON COLUMN items.min_qty IS '�ּ�������';                  
COMMENT ON column items.item_code IS 'ǰ���ڵ� ���� - ǰ��з� �̴ϼ� �ڵ� 1�ڸ� + ǰ�� �ڵ� 7�ڸ� ';
COMMENT ON column items.item_name IS 'ǰ���';
--COMMENT ON column items.item_group IS 'ǰ��з� �ʱⱸ(PENS), �������(PAPERS), �Ϲݻ繫��ǰ(OFFICES), ���Ϲ��δ�(FILES)';
COMMENT ON column items.supply_price IS '���ް�';
COMMENT ON column items.selling_price IS '�ǸŰ�';
COMMENT ON column items.item_tax IS '�ΰ��� 10% (0.1)';
COMMENT ON column items.expire_date IS '��뿬�� default 5��?';
COMMENT ON column items.vendor_code IS '����ó';
COMMENT ON TABLE items IS 'ǰ������';
CREATE UNIQUE INDEX entity_pk ON items(item_code);
ALTER TABLE items add CONSTRAINT items_pk primary key(item_code)
    USING INDEX entity_pk;

---------------------------------------
-------<��������: ����ó>
---------------------------------------
drop TABLE vendors cascade constraints;
CREATE TABLE vendors(vendor_code CHAR(10) NOT NULL
                    ,vendor_name VARCHAR2(100)
                    ,vendor_owner VARCHAR2(20)
                    ,vendor_loc VARCHAR2(100)
                    ,vendor_phone VARCHAR2(15)
                    ,vendor_bank VARCHAR2(30)
                    ,vendor_account VARCHAR2(30));
COMMENT ON column vendors.vendor_code IS '����ڵ�Ϲ�ȣ';
COMMENT ON column vendors.vendor_name IS '���ü��';
COMMENT ON column vendors.vendor_owner IS '��ǥ�ڸ�';
COMMENT ON column vendors.vendor_loc IS '������';
COMMENT ON column vendors.vendor_phone IS '����ó';
COMMENT ON column vendors.vendor_bank IS '�ŷ�����';
COMMENT ON column vendors.vendor_account IS '�ŷ�����';
COMMENT ON TABLE vendors IS '����ó';
CREATE UNIQUE INDEX vendors_pk ON vendors(vendor_code);
ALTER TABLE vendors add CONSTRAINT vendors_pk primary key(vendor_code)
    USING INDEX vendors_pk;

---------------------------------------
-------<��������: �Ǹ�ó>
---------------------------------------
drop TABLE customers cascade constraints;
CREATE TABLE customers(customer_code CHAR(10) NOT NULL
                      ,customer_name VARCHAR2(100)
                      ,customer_owner VARCHAR2(20)
                      ,customer_loc VARCHAR2(100)
                      ,customer_phone VARCHAR2(15)
                      ,customer_pw    VARCHAR2(50) DEFAULT '1111');
COMMENT ON column customers.customer_code IS '����ڵ�Ϲ�ȣ';
COMMENT ON column customers.customer_name IS '���ü��';
COMMENT ON column customers.customer_owner IS '��ǥ�ڸ�';
COMMENT ON column customers.customer_loc IS '������';
COMMENT ON column customers.customer_phone IS '����ó';
COMMENT ON column customers.customer_pw IS '�н�����';
COMMENT ON TABLE customers IS '�Ǹ�ó';
CREATE UNIQUE INDEX customers_pk ON customers(customer_code);
ALTER TABLE customers add CONSTRAINT customers_pk primary key(customer_code)
    USING INDEX customers_pk;

---------------------------------------
-------<��������: �Ǹ�����>
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
COMMENT ON column sales.sale_code IS '�Ǹ��ڵ�
S + �Ǹ�����(YYYYMMDD) + �Ϸù�ȣ 3�ڸ� = �� 12�ڸ�';
COMMENT ON column sales.sale_date IS '�Ǹ�����';
COMMENT ON column sales.customer_code IS '�Ǹ�ó';
COMMENT ON column sales.sale_cost IS '�����ݾ�';
COMMENT ON column sales.sale_item IS 'ǰ���ڵ�';
COMMENT ON column sales.sale_qty IS 'ǰ�����';
COMMENT ON column sales.sale_price IS 'ǰ��ܰ�';
COMMENT ON column sales.item_tax IS '�ΰ���';
COMMENT ON column sales.delivery_addr IS '�����';
COMMENT ON column sales.delivery_emp IS '��ۻ��
�Ի翬����(YYYYMMDD) + �Ϸù�ȣ(2�ڸ�)';
COMMENT ON column sales.delivery_status IS '��ۻ���';
COMMENT ON column sales.pay_status IS '��������';
COMMENT ON column sales.warehouse IS '����â��';
COMMENT ON TABLE sales IS '�Ǹ�����';
CREATE UNIQUE INDEX sales_pk ON sales(sale_code);
ALTER TABLE sales add CONSTRAINT sales_pk primary key(sale_code)
    USING INDEX sales_pk;

---------------------------------------
-------<��������: �ǸŻ�����>
---------------------------------------
drop TABLE sale_details cascade constraints;
CREATE TABLE sale_details(sale_detail_code VARCHAR2(15) NOT NULL
                         ,sale_code CHAR(12) NOT NULL
                         ,sale_item CHAR(8)
                         ,sale_qty NUMBER
                         ,sale_price NUMBER
                         ,item_tax NUMBER(3
                                ,2));

COMMENT ON column sale_details.sale_detail_code IS '�ǸŻ��ڵ�
SD + ������';
COMMENT ON column sale_details.sale_code IS '�Ǹ��ڵ�
S + �Ǹ�����(YYYYMMDD) + �Ϸù�ȣ 3�ڸ� = �� 12�ڸ�';
COMMENT ON column sale_details.sale_item IS 'ǰ���ڵ�';
COMMENT ON column sale_details.sale_qty IS 'ǰ�����';
COMMENT ON column sale_details.sale_price IS 'ǰ��ܰ�';
COMMENT ON column sale_details.item_tax IS '�ΰ���';
COMMENT ON TABLE sale_details IS '�Ǹ�ǰ������';
CREATE UNIQUE INDEX sale_details_pk ON sale_details(sale_detail_code);
ALTER TABLE sale_details add CONSTRAINT sale_details_pk primary key(sale_detail_code)
    USING INDEX sale_details_pk;

---------------------------------------
-------<��������: ��������>
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
COMMENT ON column purchases.purchase_code IS '�����ڵ�
�����ڵ�
: P + ��������(YYYYMMDD) + �Ϸù�ȣ(3�ڸ�) �� 12�ڸ�';
COMMENT ON column purchases.purchase_date IS '��������';
COMMENT ON column purchases.vendor_code IS '����ó';
COMMENT ON column purchases.purchase_qty IS '���ż���';
COMMENT ON column purchases.purchase_cost IS '�����ݾ�';
COMMENT ON column purchases.purchase_item IS 'ǰ���ڵ�';
COMMENT ON column purchases.item_tax IS '�ΰ���';
COMMENT ON TABLE purchases IS '��������';
CREATE UNIQUE INDEX purchases_pk ON purchases(purchase_code);
ALTER TABLE purchases add CONSTRAINT purchases_pk primary key(purchase_code)
    USING INDEX purchases_pk;

---------------------------------------
-------<��������: ���Ż�����>
---------------------------------------
drop TABLE purchase_details cascade constraints;
CREATE TABLE purchase_details(purchase_detail_code VARCHAR2(15) NOT NULL
                             ,purchase_code VARCHAR2(12) NOT NULL
                             ,purchase_item CHAR(8)
                             ,purchase_qty NUMBER
                             ,purchase_price NUMBER
                             ,item_tax NUMBER(3
                                    ,2));
COMMENT ON column purchase_details.purchase_detail_code IS '���Ż��ڵ�
PD + �Ϸù�ȣ';
COMMENT ON column purchase_details.purchase_code IS '�����ڵ�
: P + ��������(YYYYMMDD) + �Ϸù�ȣ(3�ڸ�) �� 12�ڸ�';
COMMENT ON column purchase_details.purchase_item IS 'ǰ���ڵ�';
COMMENT ON column purchase_details.purchase_qty IS 'ǰ�����';
COMMENT ON column purchase_details.purchase_price IS 'ǰ��ܰ�';
COMMENT ON column purchase_details.item_tax IS '�ΰ���';
COMMENT ON TABLE purchase_details IS '����ǰ������';
CREATE UNIQUE INDEX purchase_details_pk ON purchase_details(purchase_detail_code);
ALTER TABLE purchase_details add CONSTRAINT purchase_details_pk primary key(purchase_detail_code)
    USING INDEX purchase_details_pk;

---------------------------------------
-------<��������: �������>
---------------------------------------
drop TABLE stocks cascade constraints;
CREATE TABLE stocks(item_code CHAR(8) NOT NULL
                   ,deal_date DATE
                   ,dealer_code VARCHAR2(12)
                   ,in_qty NUMBER
                   ,out_qty NUMBER
                   ,txn_date DATE);

COMMENT ON column stocks.item_code IS 'ǰ���ڵ�';
COMMENT ON column stocks.deal_date IS '�ŷ���¥';
COMMENT ON column stocks.dealer_code IS '����, �ǸŹ�ȣ';
COMMENT ON column stocks.in_qty IS '�԰����';
COMMENT ON column stocks.out_qty IS '������';
--COMMENT ON column stocks.stock_qty IS '������';
--COMMENT ON column stocks.limit_qty IS '����ѵ�����';
COMMENT ON TABLE stocks IS '�������
������� + �����������';

---------------------------------------
-------<��������: ���>
---------------------------------------
drop TABLE stock_onhands purge;
CREATE TABLE stock_onhands(item_code CHAR(8) primary key
                          ,onhand_qty NUMBER
                          ,txn_date DATE);

COMMENT ON column stock_onhands.item_code IS 'ǰ���ڵ�';
COMMENT ON column stock_onhands.onhand_qty IS '�����';
COMMENT ON column stock_onhands.txn_date IS '�����Ͻ�';

---------------------------------------
-------<��������: �������>
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
COMMENT ON column employees.id IS '�����ȣ
�Ի翬����(YYYYMMDD) + �Ϸù�ȣ(2�ڸ�)';
COMMENT ON column employees.name IS '����̸�';
COMMENT ON column employees.gender IS '����';
COMMENT ON column employees.birthday IS '�������';
COMMENT ON column employees.phone IS '��ȭ��ȣ';
COMMENT ON column employees.job IS '����';
COMMENT ON column employees.grade IS '����';
COMMENT ON column employees.hire_date IS '�Ի���';
COMMENT ON column employees.work_day IS '�ٹ�����';
COMMENT ON column employees.salary IS '�޿�';
COMMENT ON column employees.hire_status IS '��������';
COMMENT ON TABLE employees IS '���';
CREATE UNIQUE INDEX employees_pk ON employees(id);
ALTER TABLE employees add CONSTRAINT employees_pk primary key(id)
    USING INDEX employees_pk;

---------------------------------------
-------<��������: �������GPS>
---------------------------------------
drop TABLE delivery_loc cascade constraints;
CREATE TABLE delivery_loc(employee_id CHAR(10) NOT NULL
                         ,location_x VARCHAR2(30)
                         ,location_y VARCHAR2(30)
                         ,location_date DATE);

COMMENT ON column delivery_loc.employee_id IS '�����ȣ';
COMMENT ON column delivery_loc.location_x IS '��ġ X';
COMMENT ON column delivery_loc.location_y IS '��ġ Y';
COMMENT ON column delivery_loc.location_date IS '��Ͻð�';
COMMENT ON TABLE delivery_loc IS '�����ġ����';
