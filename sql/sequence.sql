-- For address IDs (used in add_supplier, add_manufacturer, add_employee)
CREATE SEQUENCE addressid_seq START 1 MINVALUE 1 MAXVALUE 9999 CYCLE;

-- For order IDs (used in add_order)
CREATE SEQUENCE orderid_seq START 1 MINVALUE 1 MAXVALUE 9999 CYCLE;

-- For customer IDs (used in add_customer)
CREATE SEQUENCE customerid_seq START 1 MINVALUE 1 MAXVALUE 9999 CYCLE;

-- For employee codes (used in add_employee)
CREATE SEQUENCE empcode_seq START 1 MINVALUE 1 MAXVALUE 99 CYCLE;


