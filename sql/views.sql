-- View: public.customer_summary

-- DROP VIEW public.customer_summary;

CREATE OR REPLACE VIEW public.customer_summary
 AS
 SELECT c.id AS customer_id,
    c.name AS customer_name,
    c.email AS customer_email,
    lo.orderid AS last_order_id,
    lo.date_of_order AS last_order_date,
    COALESCE(ts.total_spending, 0::numeric) AS total_spending
   FROM customer c
     LEFT JOIN LATERAL ( SELECT o.orderid,
            o.date_of_order
           FROM orders o
          WHERE o.customerid = c.id
          ORDER BY o.date_of_order DESC
         LIMIT 1) lo ON true
     LEFT JOIN LATERAL ( SELECT sum(io.quantity::numeric * i.selling_price) AS total_spending
           FROM orders o2
             JOIN items_ordered io ON o2.orderid = io.orderid
             JOIN item i ON io.batch_no::text = i.batch_no::text
          WHERE o2.customerid = c.id) ts ON true
  ORDER BY c.id;

ALTER TABLE public.customer_summary
    OWNER TO postgres;

-- View: public.employee_summary

-- DROP VIEW public.employee_summary;

CREATE OR REPLACE VIEW public.employee_summary
 AS
 SELECT empcode,
    first_name,
    middle_name,
    last_name,
    sex,
    phone,
    email,
    COALESCE(( SELECT sum(io.quantity::numeric * i.selling_price) AS sum
           FROM orders o
             JOIN items_ordered io ON o.orderid = io.orderid
             JOIN item i ON io.batch_no::text = i.batch_no::text
          WHERE o.empcode = e.empcode AND o.date_of_order >= (CURRENT_DATE - '1 mon'::interval)), 0::numeric) AS sales_past_month,
    COALESCE(( SELECT sum(io.quantity::numeric * i.selling_price) AS sum
           FROM orders o
             JOIN items_ordered io ON o.orderid = io.orderid
             JOIN item i ON io.batch_no::text = i.batch_no::text
          WHERE o.empcode = e.empcode AND o.date_of_order >= (CURRENT_DATE - '1 year'::interval)), 0::numeric) AS sales_past_year
   FROM employee e
  ORDER BY empcode;

ALTER TABLE public.employee_summary
    OWNER TO postgres;

