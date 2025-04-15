-- PROCEDURE: public.remove_employee(character)

-- DROP PROCEDURE IF EXISTS public.remove_employee(character);

CREATE OR REPLACE PROCEDURE public.remove_employee(
	IN empid character)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
  DELETE FROM employee WHERE empcode = empid;
END;
$BODY$;
ALTER PROCEDURE public.remove_employee(character)
    OWNER TO postgres;

-- PROCEDURE: public.reset_orderid()

-- DROP PROCEDURE IF EXISTS public.reset_orderid();

CREATE OR REPLACE PROCEDURE public.reset_orderid(
	)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
  UPDATE reference_variables SET next_orderid = 'O0001';
END;
$BODY$;
ALTER PROCEDURE public.reset_orderid()
    OWNER TO postgres;

-- PROCEDURE: public.supply_order(character varying, character varying, character varying, date, date, numeric, numeric, integer, character varying)

-- DROP PROCEDURE IF EXISTS public.supply_order(character varying, character varying, character varying, date, date, numeric, numeric, integer, character varying);

CREATE OR REPLACE PROCEDURE public.supply_order(
	IN supp_name character varying,
	IN batch_no character varying,
	IN item_name character varying,
	IN mfd date,
	IN exp date,
	IN cp numeric,
	IN sp numeric,
	IN quantity integer,
	INOUT manufacturer_name character varying)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  manu varchar;
BEGIN
  -- Check if manufacturer exists
  SELECT name INTO manu FROM manufacturer WHERE name = manufacturer_name;

  -- Insert into item
  INSERT INTO item
    (batch_no, item_name, mfd, exp_date, cost_price, selling_price, stock, manufacturer)
  VALUES
    (batch_no, item_name, mfd, exp, cp, sp, quantity, manufacturer_name);

  -- Insert into supply_transactions
  INSERT INTO supply_transactions
    (supplier_name, batchno, date_of_transaction, quantity)
  VALUES
    (supp_name, batch_no, CURRENT_DATE, quantity);

EXCEPTION
  WHEN OTHERS THEN
    manufacturer_name := '-1';
END;
$BODY$;
ALTER PROCEDURE public.supply_order(character varying, character varying, character varying, date, date, numeric, numeric, integer, character varying)
    OWNER TO postgres;
