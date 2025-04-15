-- Table: public.address

-- DROP TABLE IF EXISTS public.address;

CREATE TABLE IF NOT EXISTS public.address
(
    id character(5) COLLATE pg_catalog."default" NOT NULL,
    address_line_1 character varying(50) COLLATE pg_catalog."default",
    city character varying(50) COLLATE pg_catalog."default",
    state character varying(50) COLLATE pg_catalog."default",
    pincode integer,
    country character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT address_pkey PRIMARY KEY (id),
    CONSTRAINT address_check CHECK (country::text = 'INDIA'::text AND pincode IS NOT NULL OR country::text <> 'INDIA'::text),
    CONSTRAINT address_country_check CHECK (country::text = ANY (ARRAY['AFGHANISTAN'::character varying, 'ALBANIA'::character varying, 'ALGERIA'::character varying, 'ANDORRA'::character varying, 'ANGOLA'::character varying, 'ANTIGUA AND BARBUDA'::character varying, 'ARGENTINA'::character varying, 'ARMENIA'::character varying, 'AUSTRALIA'::character varying, 'AUSTRIA'::character varying, 'AZERBAIJAN'::character varying, 'BAHAMAS'::character varying, 'BAHRAIN'::character varying, 'BANGLADESH'::character varying, 'BARBADOS'::character varying, 'BELARUS'::character varying, 'BELGIUM'::character varying, 'BELIZE'::character varying, 'BENIN'::character varying, 'BHUTAN'::character varying, 'BOLIVIA'::character varying, 'BOSNIA AND HERZEGOVINA'::character varying, 'BOTSWANA'::character varying, 'BRAZIL'::character varying, 'BRUNEI'::character varying, 'BULGARIA'::character varying, 'BURKINA FASO'::character varying, 'BURUNDI'::character varying, 'CABO VERDE'::character varying, 'CAMBODIA'::character varying, 'CAMEROON'::character varying, 'CANADA'::character varying, 'CENTRAL AFRICAN REPUBLIC'::character varying, 'CHAD'::character varying, 'CHILE'::character varying, 'CHINA'::character varying, 'COLOMBIA'::character varying, 'COMOROS'::character varying, 'CONGO'::character varying, 'COSTA RICA'::character varying, 'CROATIA'::character varying, 'CUBA'::character varying, 'CYPRUS'::character varying, 'CZECH REPUBLIC'::character varying, 'DEMOCRATIC REPUBLIC OF THE CONGO'::character varying, 'DENMARK'::character varying, 'DJIBOUTI'::character varying, 'DOMINICA'::character varying, 'DOMINICAN REPUBLIC'::character varying, 'ECUADOR'::character varying, 'EGYPT'::character varying, 'EL SALVADOR'::character varying, 'EQUATORIAL GUINEA'::character varying, 'ERITREA'::character varying, 'ESTONIA'::character varying, 'ESWATINI'::character varying, 'ETHIOPIA'::character varying, 'FIJI'::character varying, 'FINLAND'::character varying, 'FRANCE'::character varying, 'GABON'::character varying, 'GAMBIA'::character varying, 'GEORGIA'::character varying, 'GERMANY'::character varying, 'GHANA'::character varying, 'GREECE'::character varying, 'GRENADA'::character varying, 'GUATEMALA'::character varying, 'GUINEA'::character varying, 'GUINEA-BISSAU'::character varying, 'GUYANA'::character varying, 'HAITI'::character varying, 'HONDURAS'::character varying, 'HUNGARY'::character varying, 'ICELAND'::character varying, 'INDIA'::character varying, 'INDONESIA'::character varying, 'IRAN'::character varying, 'IRAQ'::character varying, 'IRELAND'::character varying, 'ISRAEL'::character varying, 'ITALY'::character varying, 'JAMAICA'::character varying, 'JAPAN'::character varying, 'JORDAN'::character varying, 'KAZAKHSTAN'::character varying, 'KENYA'::character varying, 'KIRIBATI'::character varying, 'KUWAIT'::character varying, 'KYRGYZSTAN'::character varying, 'LAOS'::character varying, 'LATVIA'::character varying, 'LEBANON'::character varying, 'LESOTHO'::character varying, 'LIBERIA'::character varying, 'LIBYA'::character varying, 'LIECHTENSTEIN'::character varying, 'LITHUANIA'::character varying, 'LUXEMBOURG'::character varying, 'MADAGASCAR'::character varying, 'MALAWI'::character varying, 'MALAYSIA'::character varying, 'MALDIVES'::character varying, 'MALI'::character varying, 'MALTA'::character varying, 'MARSHALL ISLANDS'::character varying, 'MAURITANIA'::character varying, 'MAURITIUS'::character varying, 'MEXICO'::character varying, 'MICRONESIA'::character varying, 'MOLDOVA'::character varying, 'MONACO'::character varying, 'MONGOLIA'::character varying, 'MONTENEGRO'::character varying, 'MOROCCO'::character varying, 'MOZAMBIQUE'::character varying, 'MYANMAR'::character varying, 'NAMIBIA'::character varying, 'NAURU'::character varying, 'NEPAL'::character varying, 'NETHERLANDS'::character varying, 'NEW ZEALAND'::character varying, 'NICARAGUA'::character varying, 'NIGER'::character varying, 'NIGERIA'::character varying, 'NORTH KOREA'::character varying, 'NORTH MACEDONIA'::character varying, 'NORWAY'::character varying, 'OMAN'::character varying, 'PAKISTAN'::character varying, 'PALAU'::character varying, 'PALESTINE'::character varying, 'PANAMA'::character varying, 'PAPUA NEW GUINEA'::character varying, 'PARAGUAY'::character varying, 'PERU'::character varying, 'PHILIPPINES'::character varying, 'POLAND'::character varying, 'PORTUGAL'::character varying, 'QATAR'::character varying, 'ROMANIA'::character varying, 'RUSSIA'::character varying, 'RWANDA'::character varying, 'SAINT KITTS AND NEVIS'::character varying, 'SAINT LUCIA'::character varying, 'SAINT VINCENT AND THE GRENADINES'::character varying, 'SAMOA'::character varying, 'SAN MARINO'::character varying, 'SAO TOME AND PRINCIPE'::character varying, 'SAUDI ARABIA'::character varying, 'SENEGAL'::character varying, 'SERBIA'::character varying, 'SEYCHELLES'::character varying, 'SIERRA LEONE'::character varying, 'SINGAPORE'::character varying, 'SLOVAKIA'::character varying, 'SLOVENIA'::character varying, 'SOLOMON ISLANDS'::character varying, 'SOMALIA'::character varying, 'SOUTH AFRICA'::character varying, 'SOUTH KOREA'::character varying, 'SOUTH SUDAN'::character varying, 'SPAIN'::character varying, 'SRI LANKA'::character varying, 'SUDAN'::character varying, 'SURINAME'::character varying, 'SWEDEN'::character varying, 'SWITZERLAND'::character varying, 'SYRIA'::character varying, 'TAJIKISTAN'::character varying, 'TANZANIA'::character varying, 'THAILAND'::character varying, 'TIMOR-LESTE'::character varying, 'TOGO'::character varying, 'TONGA'::character varying, 'TRINIDAD AND TOBAGO'::character varying, 'TUNISIA'::character varying, 'TURKEY'::character varying, 'TURKMENISTAN'::character varying, 'TUVALU'::character varying, 'UGANDA'::character varying, 'UKRAINE'::character varying, 'UNITED ARAB EMIRATES'::character varying, 'UNITED KINGDOM'::character varying, 'UNITED STATES OF AMERICA'::character varying, 'URUGUAY'::character varying, 'UZBEKISTAN'::character varying, 'VANUATU'::character varying, 'VATICAN CITY'::character varying, 'VENEZUELA'::character varying, 'VIETNAM'::character varying, 'YEMEN'::character varying, 'ZAMBIA'::character varying, 'ZIMBABWE'::character varying]::text[])),
    CONSTRAINT address_id_check CHECK (id ~ '^A[0-9]{4}$'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.address
    OWNER to postgres;

-- Table: public.customer

-- DROP TABLE IF EXISTS public.customer;

CREATE TABLE IF NOT EXISTS public.customer
(
    id character(5) COLLATE pg_catalog."default" NOT NULL,
    name character varying(50) COLLATE pg_catalog."default",
    phone bigint,
    email character varying(254) COLLATE pg_catalog."default",
    CONSTRAINT customer_pkey PRIMARY KEY (id),
    CONSTRAINT customer_email_key UNIQUE (email),
    CONSTRAINT customer_phone_key UNIQUE (phone),
    CONSTRAINT customer_email_check CHECK (email::text ~~ '%@%.%'::text),
    CONSTRAINT customer_id_check CHECK (id ~ '^C[0-9]{4}$'::text),
    CONSTRAINT customer_phone_check CHECK (phone >= 2000000000 AND phone <= '9999999999'::bigint)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer
    OWNER to postgres;

-- Trigger: new_customer

-- DROP TRIGGER IF EXISTS new_customer ON public.customer;

CREATE OR REPLACE TRIGGER new_customer
    BEFORE INSERT
    ON public.customer
    FOR EACH ROW
    EXECUTE FUNCTION public.assign_customer_id();

-- Table: public.employee

-- DROP TABLE IF EXISTS public.employee;

CREATE TABLE IF NOT EXISTS public.employee
(
    empcode character(3) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default",
    middle_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    sex character(1) COLLATE pg_catalog."default",
    phone bigint,
    email character varying(254) COLLATE pg_catalog."default",
    addressid character(5) COLLATE pg_catalog."default",
    CONSTRAINT employee_pkey PRIMARY KEY (empcode),
    CONSTRAINT employee_email_key UNIQUE (email),
    CONSTRAINT employee_phone_key UNIQUE (phone),
    CONSTRAINT employee_addressid_fkey FOREIGN KEY (addressid)
        REFERENCES public.address (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT employee_email_check CHECK (email::text ~~ '%@%.%'::text),
    CONSTRAINT employee_empcode_check CHECK (empcode ~ '^E[0-9]{2}$'::text),
    CONSTRAINT employee_phone_check CHECK (phone >= 2000000000 AND phone <= '9999999999'::bigint),
    CONSTRAINT employee_sex_check CHECK (sex = ANY (ARRAY['M'::bpchar, 'F'::bpchar, 'O'::bpchar]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employee
    OWNER to postgres;

-- Trigger: delete_employee

-- DROP TRIGGER IF EXISTS delete_employee ON public.employee;

CREATE OR REPLACE TRIGGER delete_employee
    AFTER DELETE
    ON public.employee
    FOR EACH ROW
    EXECUTE FUNCTION public.delete_employee_address();

-- Trigger: new_employee

-- DROP TRIGGER IF EXISTS new_employee ON public.employee;

CREATE OR REPLACE TRIGGER new_employee
    BEFORE INSERT
    ON public.employee
    FOR EACH ROW
    EXECUTE FUNCTION public.assign_employee_code();

-- Table: public.item

-- DROP TABLE IF EXISTS public.item;

CREATE TABLE IF NOT EXISTS public.item
(
    batch_no character varying(20) COLLATE pg_catalog."default" NOT NULL,
    item_name character varying(50) COLLATE pg_catalog."default",
    mfd date,
    exp_date date,
    cost_price numeric(7,2),
    selling_price numeric(7,2),
    stock integer,
    manufacturer character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT item_pkey PRIMARY KEY (batch_no),
    CONSTRAINT item_manufacturer_fkey FOREIGN KEY (manufacturer)
        REFERENCES public.manufacturer (name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT item_check CHECK (exp_date > mfd),
    CONSTRAINT item_stock_check CHECK (stock >= 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.item
    OWNER to postgres;

-- Table: public.items_ordered

-- DROP TABLE IF EXISTS public.items_ordered;

CREATE TABLE IF NOT EXISTS public.items_ordered
(
    orderid character(5) COLLATE pg_catalog."default" NOT NULL,
    date_of_order date NOT NULL,
    batch_no character varying(20) COLLATE pg_catalog."default" NOT NULL,
    quantity integer,
    CONSTRAINT pk_orderid_batchno_date PRIMARY KEY (orderid, batch_no, date_of_order),
    CONSTRAINT fk_orderid_date FOREIGN KEY (orderid, date_of_order)
        REFERENCES public.orders (orderid, date_of_order) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT items_ordered_batch_no_fkey FOREIGN KEY (batch_no)
        REFERENCES public.item (batch_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.items_ordered
    OWNER to postgres;

-- Table: public.manufacturer

-- DROP TABLE IF EXISTS public.manufacturer;

CREATE TABLE IF NOT EXISTS public.manufacturer
(
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone bigint,
    email character varying(254) COLLATE pg_catalog."default",
    base_location_address_id character(5) COLLATE pg_catalog."default",
    CONSTRAINT manufacturer_pkey PRIMARY KEY (name),
    CONSTRAINT manufacturer_email_key UNIQUE (email),
    CONSTRAINT manufacturer_phone_key UNIQUE (phone),
    CONSTRAINT manufacturer_base_location_address_id_fkey FOREIGN KEY (base_location_address_id)
        REFERENCES public.address (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT manufacturer_email_check CHECK (email::text ~~ '%@%.%'::text),
    CONSTRAINT manufacturer_phone_check CHECK (phone >= 2000000000 AND phone <= '9999999999'::bigint)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.manufacturer
    OWNER to postgres;

-- Table: public.online_partners

-- DROP TABLE IF EXISTS public.online_partners;

CREATE TABLE IF NOT EXISTS public.online_partners
(
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    commission_percent numeric(4,2),
    CONSTRAINT online_partners_pkey PRIMARY KEY (name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.online_partners
    OWNER to postgres;

-- Table: public.orders

-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    orderid character(5) COLLATE pg_catalog."default" NOT NULL,
    date_of_order date NOT NULL,
    empcode character(3) COLLATE pg_catalog."default",
    online_partner_name character varying(50) COLLATE pg_catalog."default",
    customerid character(5) COLLATE pg_catalog."default",
    CONSTRAINT orders_pkey PRIMARY KEY (orderid, date_of_order),
    CONSTRAINT orders_customerid_fkey FOREIGN KEY (customerid)
        REFERENCES public.customer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT orders_empcode_fkey FOREIGN KEY (empcode)
        REFERENCES public.employee (empcode) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT orders_online_partner_name_fkey FOREIGN KEY (online_partner_name)
        REFERENCES public.online_partners (name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT orders_check CHECK (online_partner_name IS NULL AND empcode IS NOT NULL OR online_partner_name IS NOT NULL AND empcode IS NULL),
    CONSTRAINT orders_orderid_check CHECK (orderid ~ '^O[0-9]{4}$'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;

-- Table: public.reference_variables

-- DROP TABLE IF EXISTS public.reference_variables;

CREATE TABLE IF NOT EXISTS public.reference_variables
(
    next_orderid character(5) COLLATE pg_catalog."default",
    next_customerid character(5) COLLATE pg_catalog."default",
    next_addressid character(5) COLLATE pg_catalog."default",
    next_empcode character(3) COLLATE pg_catalog."default",
    CONSTRAINT reference_variables_next_addressid_check CHECK (next_addressid ~ '^A[0-9]{4}$'::text),
    CONSTRAINT reference_variables_next_customerid_check CHECK (next_customerid ~ '^C[0-9]{4}$'::text),
    CONSTRAINT reference_variables_next_empcode_check CHECK (next_empcode ~ '^E[0-9]{2}$'::text),
    CONSTRAINT reference_variables_next_orderid_check CHECK (next_orderid ~ '^O[0-9]{4}$'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.reference_variables
    OWNER to postgres;

-- Table: public.supplier

-- DROP TABLE IF EXISTS public.supplier;

CREATE TABLE IF NOT EXISTS public.supplier
(
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    phone bigint,
    email character varying(254) COLLATE pg_catalog."default",
    address_id character(5) COLLATE pg_catalog."default",
    CONSTRAINT supplier_pkey PRIMARY KEY (name),
    CONSTRAINT supplier_email_key UNIQUE (email),
    CONSTRAINT supplier_phone_key UNIQUE (phone),
    CONSTRAINT supplier_address_id_fkey FOREIGN KEY (address_id)
        REFERENCES public.address (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT supplier_email_check CHECK (email::text ~~ '%@%.%'::text),
    CONSTRAINT supplier_phone_check CHECK (phone >= 2000000000 AND phone <= '9999999999'::bigint)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.supplier
    OWNER to postgres;

-- Table: public.supply_transactions

-- DROP TABLE IF EXISTS public.supply_transactions;

CREATE TABLE IF NOT EXISTS public.supply_transactions
(
    supplier_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    batchno character varying(20) COLLATE pg_catalog."default" NOT NULL,
    date_of_transaction date,
    quantity integer,
    CONSTRAINT pk_supplier_batchno PRIMARY KEY (supplier_name, batchno),
    CONSTRAINT supply_transactions_batchno_fkey FOREIGN KEY (batchno)
        REFERENCES public.item (batch_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT supply_transactions_supplier_name_fkey FOREIGN KEY (supplier_name)
        REFERENCES public.supplier (name) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.supply_transactions
    OWNER to postgres;