-- FUNCTION: public.add_customer(character varying, character varying, bigint)

-- DROP FUNCTION IF EXISTS public.add_customer(character varying, character varying, bigint);

CREATE OR REPLACE FUNCTION public.add_customer(
	v_name character varying,
	v_email character varying,
	v_phone bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
  return_val integer := 1;
BEGIN
  BEGIN
    INSERT INTO customer (id, name, phone, email)
    VALUES ('C0000', v_name, v_phone, v_email);
  EXCEPTION
    WHEN OTHERS THEN
      return_val := 0;
  END;
  RETURN return_val;
END;
$BODY$;

ALTER FUNCTION public.add_customer(character varying, character varying, bigint)
    OWNER TO postgres;

-- FUNCTION: public.add_employee(character varying, character varying, character varying, character, bigint, character varying, character varying, character varying, character varying, integer, character varying)

-- DROP FUNCTION IF EXISTS public.add_employee(character varying, character varying, character varying, character, bigint, character varying, character varying, character varying, character varying, integer, character varying);

CREATE OR REPLACE FUNCTION public.add_employee(
	v_first_name character varying,
	v_middle_name character varying,
	v_last_name character varying,
	v_sex character,
	v_phone bigint,
	v_email character varying,
	v_address_line1 character varying,
	v_city character varying,
	v_state character varying,
	v_pincode integer,
	v_country character varying)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    v_next_address_id char(5);
    return_val integer := 1;
    next_num integer;
BEGIN
    BEGIN
        -- Generate the next address ID (e.g., 'A0001', 'A0002', ...)
        next_num := nextval('addressid_seq');
        IF next_num > 9999 THEN
            RAISE EXCEPTION 'Address ID overflow: reached A9999';
        END IF;
        v_next_address_id := 'A' || LPAD(next_num::text, 4, '0');

        -- Insert into address
        INSERT INTO address (id, address_line_1, city, state, pincode, country)
        VALUES (v_next_address_id, v_address_line1, v_city, v_state, v_pincode, v_country);

        -- Insert into employee (empcode will be set by trigger if 'E00')
        INSERT INTO employee (
            empcode, first_name, middle_name, last_name, sex, phone, email, addressid
        ) VALUES (
            'E00', v_first_name, v_middle_name, v_last_name, v_sex, v_phone, v_email, v_next_address_id
        );

    EXCEPTION
        WHEN OTHERS THEN
            return_val := 0;
    END;
    RETURN return_val;
END;
$BODY$;

ALTER FUNCTION public.add_employee(character varying, character varying, character varying, character, bigint, character varying, character varying, character varying, character varying, integer, character varying)
    OWNER TO postgres;

-- FUNCTION: public.add_item(character varying, character varying, date, date, numeric, numeric, integer, character varying)

-- DROP FUNCTION IF EXISTS public.add_item(character varying, character varying, date, date, numeric, numeric, integer, character varying);

CREATE OR REPLACE FUNCTION public.add_item(
	v_batch_no character varying,
	v_item_name character varying,
	v_mfd date,
	v_exp_date date,
	v_cost_price numeric,
	v_selling_price numeric,
	v_stock integer,
	v_manufacturer character varying)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    return_val boolean := TRUE;
BEGIN
    BEGIN
        INSERT INTO item (
            batch_no, item_name, mfd, exp_date, cost_price, selling_price, stock, manufacturer
        ) VALUES (
            v_batch_no, v_item_name, v_mfd, v_exp_date, v_cost_price, v_selling_price, v_stock, v_manufacturer
        );
    EXCEPTION
        WHEN OTHERS THEN
            return_val := FALSE;
    END;
    RETURN return_val;
END;
$BODY$;

ALTER FUNCTION public.add_item(character varying, character varying, date, date, numeric, numeric, integer, character varying)
    OWNER TO postgres;

-- FUNCTION: public.add_item_ordered(character, character varying, integer)

-- DROP FUNCTION IF EXISTS public.add_item_ordered(character, character varying, integer);

CREATE OR REPLACE FUNCTION public.add_item_ordered(
	order_id character,
	name character varying,
	quantity integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    batchno          varchar(20);
    price            numeric := 0;
    available_stock  integer;
    exp_date_limit   date := CURRENT_DATE + interval '1 month';
BEGIN
    BEGIN
        -- Find the batch with the earliest expiry date at least one month from now
        SELECT batch_no INTO batchno
        FROM item
        WHERE item_name = name
          AND exp_date >= exp_date_limit
        ORDER BY exp_date
        LIMIT 1;

        -- Get available stock
        SELECT stock INTO available_stock FROM item WHERE batch_no = batchno;

        IF available_stock >= quantity THEN
            -- Get selling price
            SELECT selling_price INTO price FROM item WHERE batch_no = batchno;
            price := price * quantity;

            -- Insert into items_ordered
            INSERT INTO items_ordered (orderid, date_of_order, batch_no, quantity)
            VALUES (order_id, CURRENT_DATE, batchno, quantity);

            -- Update or delete item stock
            IF available_stock = quantity THEN
                DELETE FROM item WHERE batch_no = batchno;
            ELSE
                UPDATE item SET stock = stock - quantity WHERE batch_no = batchno;
            END IF;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'Item not found or error occurred';
    END;
    RETURN price;
END;
$BODY$;

ALTER FUNCTION public.add_item_ordered(character, character varying, integer)
    OWNER TO postgres;

-- FUNCTION: public.add_manufacturer(character varying, bigint, character varying, character varying, character varying, character varying, integer, character varying)

-- DROP FUNCTION IF EXISTS public.add_manufacturer(character varying, bigint, character varying, character varying, character varying, character varying, integer, character varying);

CREATE OR REPLACE FUNCTION public.add_manufacturer(
	v_name character varying,
	v_phone bigint,
	v_email character varying,
	v_address_line1 character varying,
	v_city character varying,
	v_state character varying,
	v_pincode integer,
	v_country character varying)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    v_next_address_id char(5);
    return_val integer := 1;
    next_num integer;
BEGIN
    BEGIN
        -- Generate the next address ID (e.g., 'A0001', 'A0002', ...)
        next_num := nextval('addressid_seq');
        IF next_num > 9999 THEN
            RAISE EXCEPTION 'Address ID overflow: reached A9999';
        END IF;
        v_next_address_id := 'A' || LPAD(next_num::text, 4, '0');

        -- Insert into address
        INSERT INTO address (id, address_line_1, city, state, pincode, country)
        VALUES (v_next_address_id, v_address_line1, v_city, v_state, v_pincode, v_country);

        -- Insert into manufacturer
        INSERT INTO manufacturer (name, phone, email, base_location_address_id)
        VALUES (v_name, v_phone, v_email, v_next_address_id);

    EXCEPTION
        WHEN OTHERS THEN
            return_val := 0;
    END;
    RETURN return_val;
END;
$BODY$;

ALTER FUNCTION public.add_manufacturer(character varying, bigint, character varying, character varying, character varying, character varying, integer, character varying)
    OWNER TO postgres;

-- FUNCTION: public.add_online_partner(character varying, numeric)

-- DROP FUNCTION IF EXISTS public.add_online_partner(character varying, numeric);

CREATE OR REPLACE FUNCTION public.add_online_partner(
	v_name character varying,
	v_commission_percent numeric)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    return_val integer := 1;
BEGIN
    BEGIN
        INSERT INTO online_partners (name, commission_percent)
        VALUES (v_name, v_commission_percent);
    EXCEPTION
        WHEN OTHERS THEN
            return_val := 0;
    END;
    RETURN return_val;
END;
$BODY$;

ALTER FUNCTION public.add_online_partner(character varying, numeric)
    OWNER TO postgres;

-- FUNCTION: public.add_order(character, character varying, character)

-- DROP FUNCTION IF EXISTS public.add_order(character, character varying, character);

CREATE OR REPLACE FUNCTION public.add_order(
	empid character,
	online_partner character varying,
	custid character)
    RETURNS character
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    order_id char(5);
    next_num integer;
BEGIN
    -- Generate the next order ID (e.g., 'O0001', 'O0002', ...)
    next_num := nextval('orderid_seq');
    IF next_num > 9999 THEN
        RAISE EXCEPTION 'Order ID overflow: reached O9999';
    END IF;
    order_id := 'O' || LPAD(next_num::text, 4, '0');

    -- Insert into orders
    INSERT INTO orders (
        orderid, date_of_order, empcode, online_partner_name, customerid
    ) VALUES (
        order_id, CURRENT_DATE, empid, online_partner, custid
    );

    RETURN order_id;
END;
$BODY$;

ALTER FUNCTION public.add_order(character, character varying, character)
    OWNER TO postgres;

-- FUNCTION: public.add_supplier(character varying, bigint, character varying, character varying, character varying, character varying, integer, character varying)

-- DROP FUNCTION IF EXISTS public.add_supplier(character varying, bigint, character varying, character varying, character varying, character varying, integer, character varying);

CREATE OR REPLACE FUNCTION public.add_supplier(
	v_name character varying,
	v_phone bigint,
	v_email character varying,
	v_address_line1 character varying,
	v_city character varying,
	v_state character varying,
	v_pincode integer,
	v_country character varying)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
  v_next_address_id char(5);
  return_val integer := 1;
  next_num integer;
BEGIN
  BEGIN
    -- Generate the next address ID (e.g., 'A0001', 'A0002', ...)
    next_num := nextval('addressid_seq');
    IF next_num > 9999 THEN
      RAISE EXCEPTION 'Address ID overflow: reached A9999';
    END IF;
    v_next_address_id := 'A' || LPAD(next_num::text, 4, '0');

    -- Insert into address
    INSERT INTO address (id, address_line_1, city, state, pincode, country)
    VALUES (v_next_address_id, v_address_line1, v_city, v_state, v_pincode, v_country);

    -- Insert into supplier
    INSERT INTO supplier (name, phone, email, address_id)
    VALUES (v_name, v_phone, v_email, v_next_address_id);

  EXCEPTION
    WHEN OTHERS THEN
      return_val := 0;
  END;
  RETURN return_val;
END;
$BODY$;

ALTER FUNCTION public.add_supplier(character varying, bigint, character varying, character varying, character varying, character varying, integer, character varying)
    OWNER TO postgres;

-- FUNCTION: public.find_customer_id(bigint)

-- DROP FUNCTION IF EXISTS public.find_customer_id(bigint);

CREATE OR REPLACE FUNCTION public.find_customer_id(
	v_phone bigint)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    c_id varchar := 'C0000';
BEGIN
    BEGIN
        SELECT id INTO c_id FROM customer WHERE phone = v_phone;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'Customer Not Found';
    END;
    RETURN c_id;
END;
$BODY$;

ALTER FUNCTION public.find_customer_id(bigint)
    OWNER TO postgres;
