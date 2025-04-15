-- Sample data for supermarket management system
-- Data spread over the past 10 months

-- Insert manufacturers
INSERT INTO manufacturer (name, phone, email, address_line1, city, state, pincode, country) VALUES
('Amul Dairy', 9876543210, 'contact@amul.com', '123 Dairy Road', 'Anand', 'Gujarat', 388001, 'India'),
('Britannia Industries', 9876543211, 'info@britannia.com', '456 Biscuit Lane', 'Mumbai', 'Maharashtra', 400001, 'India'),
('Nestle India', 9876543212, 'contact@nestle.in', '789 Chocolate Street', 'Gurgaon', 'Haryana', 122002, 'India'),
('ITC Limited', 9876543213, 'info@itc.in', '321 Food Court', 'Kolkata', 'West Bengal', 700001, 'India'),
('Hindustan Unilever', 9876543214, 'contact@hul.com', '654 FMCG Avenue', 'Mumbai', 'Maharashtra', 400001, 'India'),
('Parle Products', 9876543215, 'info@parle.com', '789 Biscuit Road', 'Mumbai', 'Maharashtra', 400001, 'India'),
('Dabur India', 9876543216, 'contact@dabur.com', '456 Ayurveda Lane', 'Ghaziabad', 'Uttar Pradesh', 201010, 'India'),
('Marico Limited', 9876543217, 'info@marico.com', '123 Oil Street', 'Mumbai', 'Maharashtra', 400001, 'India'),
('Godrej Consumer', 9876543218, 'contact@godrej.com', '789 Consumer Road', 'Mumbai', 'Maharashtra', 400001, 'India'),
('Patanjali Ayurved', 9876543219, 'info@patanjali.com', '456 Ayurveda Avenue', 'Haridwar', 'Uttarakhand', 249401, 'India');

-- Insert suppliers
INSERT INTO supplier (name, phone, email, address_line1, city, state, pincode, country) VALUES
('Fresh Foods Distributors', 9876543220, 'info@freshfoods.com', '123 Supply Road', 'Delhi', 'Delhi', 110001, 'India'),
('Quality Grocers', 9876543221, 'contact@qualitygrocers.com', '456 Wholesale Lane', 'Mumbai', 'Maharashtra', 400001, 'India'),
('Metro Cash & Carry', 9876543222, 'info@metro.in', '789 Bulk Street', 'Bangalore', 'Karnataka', 560001, 'India'),
('Reliance Retail', 9876543223, 'contact@reliance.in', '321 Retail Avenue', 'Mumbai', 'Maharashtra', 400001, 'India'),
('Future Supply Chain', 9876543224, 'info@future.in', '654 Logistics Park', 'Delhi', 'Delhi', 110001, 'India'),
('Spencer Retail', 9876543225, 'contact@spencer.in', '789 Retail Road', 'Kolkata', 'West Bengal', 700001, 'India'),
('More Retail', 9876543226, 'info@more.in', '456 Supermarket Lane', 'Bangalore', 'Karnataka', 560001, 'India'),
('Vishal Mega Mart', 9876543227, 'contact@vishal.in', '123 Mart Street', 'Delhi', 'Delhi', 110001, 'India'),
('Easyday Club', 9876543228, 'info@easyday.in', '789 Club Road', 'Gurgaon', 'Haryana', 122002, 'India'),
('Star Bazaar', 9876543229, 'contact@starbazaar.in', '456 Bazaar Lane', 'Mumbai', 'Maharashtra', 400001, 'India');

-- Insert online partners
INSERT INTO online_partner (name, commission_percent) VALUES
('Swiggy Instamart', 15.00),
('Zomato', 12.50),
('BigBasket', 10.00),
('Blinkit', 13.00),
('Amazon Fresh', 11.50),
('Flipkart Grocery', 12.00),
('JioMart', 10.50),
('Grofers', 11.00),
('Dunzo', 14.00),
('Zepto', 13.50);

-- Insert employees
INSERT INTO employee (first_name, middle_name, last_name, sex, phone, email, address_line1, city, state, pincode, country) VALUES
('Rahul', 'Kumar', 'Sharma', 'M', 9876543230, 'rahul.sharma@store.com', '123 Staff Quarters', 'Delhi', 'Delhi', 110001, 'India'),
('Priya', 'Singh', 'Patel', 'F', 9876543231, 'priya.patel@store.com', '456 Employee Colony', 'Mumbai', 'Maharashtra', 400001, 'India'),
('Amit', 'Raj', 'Verma', 'M', 9876543232, 'amit.verma@store.com', '789 Worker Lane', 'Bangalore', 'Karnataka', 560001, 'India'),
('Neha', 'Kumari', 'Gupta', 'F', 9876543233, 'neha.gupta@store.com', '321 Staff Street', 'Kolkata', 'West Bengal', 700001, 'India'),
('Vikram', 'Singh', 'Yadav', 'M', 9876543234, 'vikram.yadav@store.com', '654 Employee Road', 'Chennai', 'Tamil Nadu', 600001, 'India'),
('Anjali', 'Devi', 'Joshi', 'F', 9876543235, 'anjali.joshi@store.com', '789 Staff Lane', 'Pune', 'Maharashtra', 411001, 'India'),
('Rajesh', 'Kumar', 'Malhotra', 'M', 9876543236, 'rajesh.malhotra@store.com', '123 Employee Street', 'Hyderabad', 'Telangana', 500001, 'India'),
('Sneha', 'Kumari', 'Reddy', 'F', 9876543237, 'sneha.reddy@store.com', '456 Staff Road', 'Bangalore', 'Karnataka', 560001, 'India'),
('Arjun', 'Singh', 'Mehta', 'M', 9876543238, 'arjun.mehta@store.com', '789 Worker Street', 'Ahmedabad', 'Gujarat', 380001, 'India'),
('Pooja', 'Devi', 'Sharma', 'F', 9876543239, 'pooja.sharma@store.com', '123 Employee Lane', 'Lucknow', 'Uttar Pradesh', 226001, 'India');

-- Insert customers
INSERT INTO customer (name, email, phone) VALUES
('Arjun Mehta', 'arjun.mehta@email.com', 9876543240),
('Sneha Patel', 'sneha.patel@email.com', 9876543241),
('Rajesh Kumar', 'rajesh.kumar@email.com', 9876543242),
('Priya Sharma', 'priya.sharma@email.com', 9876543243),
('Vikram Singh', 'vikram.singh@email.com', 9876543244),
('Ananya Gupta', 'ananya.gupta@email.com', 9876543245),
('Rahul Verma', 'rahul.verma@email.com', 9876543246),
('Neha Yadav', 'neha.yadav@email.com', 9876543247),
('Amit Patel', 'amit.patel@email.com', 9876543248),
('Pooja Sharma', 'pooja.sharma@email.com', 9876543249),
('Ravi Kumar', 'ravi.kumar@email.com', 9876543250),
('Suman Devi', 'suman.devi@email.com', 9876543251),
('Vishal Singh', 'vishal.singh@email.com', 9876543252),
('Kavita Sharma', 'kavita.sharma@email.com', 9876543253),
('Sanjay Gupta', 'sanjay.gupta@email.com', 9876543254),
('Meera Patel', 'meera.patel@email.com', 9876543255),
('Anil Kumar', 'anil.kumar@email.com', 9876543256),
('Sunita Devi', 'sunita.devi@email.com', 9876543257),
('Rajiv Verma', 'rajiv.verma@email.com', 9876543258),
('Preeti Singh', 'preeti.singh@email.com', 9876543259);

-- Insert items with various categories
INSERT INTO item (batch_no, item_name, mfd, exp_date, cost_price, selling_price, stock, manufacturer) VALUES
-- Dairy Products
('D001', 'Amul Milk 1L', '2023-01-01', '2023-01-07', 45.00, 50.00, 100, 1),
('D002', 'Amul Cheese 200g', '2023-01-01', '2023-02-01', 120.00, 140.00, 50, 1),
('D003', 'Amul Butter 100g', '2023-01-01', '2023-03-01', 45.00, 55.00, 75, 1),
('D004', 'Amul Yogurt 500g', '2023-01-01', '2023-01-10', 35.00, 45.00, 60, 1),
('D005', 'Amul Paneer 200g', '2023-01-01', '2023-01-05', 80.00, 100.00, 40, 1),
('D006', 'Nestle Milk 1L', '2023-01-01', '2023-01-07', 48.00, 55.00, 90, 3),
('D007', 'Nestle Yogurt 500g', '2023-01-01', '2023-01-10', 38.00, 48.00, 55, 3),
('D008', 'Mother Dairy Milk 1L', '2023-01-01', '2023-01-07', 44.00, 52.00, 85, 1),
('D009', 'Mother Dairy Paneer 200g', '2023-01-01', '2023-01-05', 82.00, 102.00, 35, 1),
('D010', 'Mother Dairy Butter 100g', '2023-01-01', '2023-03-01', 46.00, 56.00, 70, 1),

-- Bakery Products
('B001', 'Britannia Bread', '2023-01-01', '2023-01-07', 30.00, 40.00, 80, 2),
('B002', 'Britannia Cake', '2023-01-01', '2023-01-15', 80.00, 100.00, 30, 2),
('B003', 'Britannia Cookies', '2023-01-01', '2023-03-01', 50.00, 65.00, 100, 2),
('B004', 'Britannia Rusk', '2023-01-01', '2023-02-01', 40.00, 55.00, 60, 2),
('B005', 'Britannia Bun', '2023-01-01', '2023-01-05', 25.00, 35.00, 50, 2),
('B006', 'Parle Biscuits', '2023-01-01', '2023-03-01', 45.00, 60.00, 120, 6),
('B007', 'Parle Cake', '2023-01-01', '2023-01-15', 75.00, 95.00, 25, 6),
('B008', 'HUL Bread', '2023-01-01', '2023-01-07', 32.00, 42.00, 75, 5),
('B009', 'HUL Cookies', '2023-01-01', '2023-03-01', 52.00, 67.00, 90, 5),
('B010', 'HUL Rusk', '2023-01-01', '2023-02-01', 42.00, 57.00, 55, 5),

-- Produce
('P001', 'Fresh Apples 1kg', '2023-01-01', '2023-01-10', 80.00, 100.00, 40, 3),
('P002', 'Fresh Bananas 1kg', '2023-01-01', '2023-01-05', 40.00, 50.00, 60, 3),
('P003', 'Fresh Tomatoes 1kg', '2023-01-01', '2023-01-07', 30.00, 40.00, 50, 3),
('P004', 'Fresh Potatoes 1kg', '2023-01-01', '2023-01-15', 25.00, 35.00, 70, 3),
('P005', 'Fresh Onions 1kg', '2023-01-01', '2023-01-10', 20.00, 30.00, 80, 3),
('P006', 'Fresh Oranges 1kg', '2023-01-01', '2023-01-08', 60.00, 75.00, 45, 3),
('P007', 'Fresh Grapes 500g', '2023-01-01', '2023-01-05', 50.00, 65.00, 30, 3),
('P008', 'Fresh Carrots 1kg', '2023-01-01', '2023-01-10', 35.00, 45.00, 55, 3),
('P009', 'Fresh Cucumbers 1kg', '2023-01-01', '2023-01-07', 30.00, 40.00, 40, 3),
('P010', 'Fresh Bell Peppers 500g', '2023-01-01', '2023-01-06', 45.00, 60.00, 35, 3),

-- Meat
('M001', 'Chicken Breast 500g', '2023-01-01', '2023-01-03', 150.00, 180.00, 30, 4),
('M002', 'Mutton 500g', '2023-01-01', '2023-01-03', 300.00, 350.00, 20, 4),
('M003', 'Fish Fillet 500g', '2023-01-01', '2023-01-02', 200.00, 250.00, 25, 4),
('M004', 'Pork Chops 500g', '2023-01-01', '2023-01-03', 250.00, 300.00, 15, 4),
('M005', 'Minced Meat 500g', '2023-01-01', '2023-01-02', 180.00, 220.00, 20, 4),
('M006', 'Chicken Drumsticks 500g', '2023-01-01', '2023-01-03', 140.00, 170.00, 25, 4),
('M007', 'Chicken Wings 500g', '2023-01-01', '2023-01-03', 130.00, 160.00, 20, 4),
('M008', 'Lamb Chops 500g', '2023-01-01', '2023-01-03', 320.00, 380.00, 15, 4),
('M009', 'Prawns 500g', '2023-01-01', '2023-01-02', 220.00, 270.00, 18, 4),
('M010', 'Sausages 500g', '2023-01-01', '2023-01-05', 160.00, 200.00, 22, 4),

-- Grains
('G001', 'Basmati Rice 5kg', '2023-01-01', '2023-12-31', 300.00, 350.00, 40, 5),
('G002', 'Wheat Flour 5kg', '2023-01-01', '2023-12-31', 200.00, 250.00, 50, 5),
('G003', 'Pasta 500g', '2023-01-01', '2023-12-31', 60.00, 80.00, 60, 5),
('G004', 'Oats 1kg', '2023-01-01', '2023-12-31', 80.00, 100.00, 45, 5),
('G005', 'Cereal 500g', '2023-01-01', '2023-12-31', 120.00, 150.00, 35, 5),
('G006', 'Brown Rice 5kg', '2023-01-01', '2023-12-31', 350.00, 400.00, 30, 5),
('G007', 'Whole Wheat Flour 5kg', '2023-01-01', '2023-12-31', 220.00, 270.00, 40, 5),
('G008', 'Quinoa 500g', '2023-01-01', '2023-12-31', 180.00, 220.00, 25, 5),
('G009', 'Muesli 500g', '2023-01-01', '2023-12-31', 150.00, 180.00, 30, 5),
('G010', 'Corn Flakes 500g', '2023-01-01', '2023-12-31', 100.00, 130.00, 40, 5);

-- Insert orders spread over the past 10 months
-- Function to generate random dates within the last 10 months
CREATE OR REPLACE FUNCTION random_date() RETURNS date AS $$
BEGIN
    RETURN (CURRENT_DATE - (random() * 300)::integer);
END;
$$ LANGUAGE plpgsql;

-- Insert 200 orders with random dates
DO $$
DECLARE
    i INTEGER;
    order_date DATE;
    emp_id INTEGER;
    partner_id INTEGER;
    cust_id INTEGER;
BEGIN
    FOR i IN 1..200 LOOP
        order_date := random_date();
        emp_id := (random() * 9 + 1)::integer;
        partner_id := (random() * 9 + 1)::integer;
        cust_id := (random() * 19 + 1)::integer;
        
        -- Insert order
        INSERT INTO orders (empid, online_partner, custid, date_of_order)
        VALUES (emp_id, partner_id, cust_id, order_date);
        
        -- Insert items for each order (1-5 items per order)
        FOR j IN 1..(random() * 4 + 1)::integer LOOP
            INSERT INTO items_ordered (orderid, batch_no, quantity)
            VALUES (currval('orders_orderid_seq'), 
                   (SELECT batch_no FROM item ORDER BY random() LIMIT 1),
                   (random() * 4 + 1)::integer);
        END LOOP;
    END LOOP;
END $$;

-- Update stock levels based on orders
UPDATE item i
SET stock = stock - (
    SELECT COALESCE(SUM(io.quantity), 0)
    FROM items_ordered io
    WHERE io.batch_no = i.batch_no
); 