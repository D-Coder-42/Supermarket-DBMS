-- FUNCTION: public.assign_customer_id()

-- DROP FUNCTION IF EXISTS public.assign_customer_id();

CREATE OR REPLACE FUNCTION public.assign_customer_id()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
  next_num integer;
BEGIN
  IF NEW.id = 'C0000' THEN
    next_num := nextval('customerid_seq');
    IF next_num > 9999 THEN
      RAISE EXCEPTION 'Customer ID overflow: reached C9999';
    END IF;
    NEW.id := 'C' || LPAD(next_num::text, 4, '0');
  END IF;
  RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.assign_customer_id()
    OWNER TO postgres;

-- FUNCTION: public.assign_employee_code()

-- DROP FUNCTION IF EXISTS public.assign_employee_code();

CREATE OR REPLACE FUNCTION public.assign_employee_code()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
  next_num integer;
BEGIN
  IF NEW.empcode = 'E00' THEN
    next_num := nextval('empcode_seq');
    IF next_num > 99 THEN
      RAISE EXCEPTION 'Employee code overflow: reached E99';
    END IF;
    NEW.empcode := 'E' || LPAD(next_num::text, 2, '0');
  END IF;
  RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.assign_employee_code()
    OWNER TO postgres;

-- FUNCTION: public.delete_employee_address()

-- DROP FUNCTION IF EXISTS public.delete_employee_address();

CREATE OR REPLACE FUNCTION public.delete_employee_address()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
  address_count integer;
BEGIN
  IF OLD.addressid IS NOT NULL THEN
    -- Count how many employees still use this address (excluding the one just deleted)
    SELECT COUNT(*) INTO address_count FROM employee WHERE addressid = OLD.addressid;
    IF address_count = 0 THEN
      -- No other employee uses this address, safe to delete
      DELETE FROM address WHERE id = OLD.addressid;
    END IF;
  END IF;
  RETURN NULL;
EXCEPTION
  WHEN OTHERS THEN
    RAISE NOTICE 'Error occurred: %', SQLERRM;
    RETURN NULL;
END;
$BODY$;

ALTER FUNCTION public.delete_employee_address()
    OWNER TO postgres;