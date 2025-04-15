import psycopg2
from tkinter import messagebox
from config.config import DB_HOST, DB_NAME, DB_USER, DB_PASS

def connect_to_db():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASS
        )
        return conn
    except Exception as e:
        messagebox.showerror("Database Error", str(e))
        return None

def add_customer(name, email, phone):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT add_customer(%s, %s, %s);", (name, email, int(phone)))
        result = cur.fetchone()[0]
        conn.commit()
        if result == 1:
            messagebox.showinfo("Success", "Customer added successfully!")
        else:
            messagebox.showerror("Error", "Failed to add customer.")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def add_supplier(name, phone, email, address_line1, city, state, pincode, country):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT add_supplier(%s, %s, %s, %s, %s, %s, %s, %s);",
                    (name, int(phone), email, address_line1, city, state, int(pincode), country))
        result = cur.fetchone()[0]
        conn.commit()
        if result == 1:
            messagebox.showinfo("Success", "Supplier added successfully!")
        else:
            messagebox.showerror("Error", "Failed to add supplier.")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def add_manufacturer(name, phone, email, address_line1, city, state, pincode, country):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT add_manufacturer(%s, %s, %s, %s, %s, %s, %s, %s);",
                    (name, int(phone), email, address_line1, city, state, int(pincode), country))
        result = cur.fetchone()[0]
        conn.commit()
        if result == 1:
            messagebox.showinfo("Success", "Manufacturer added successfully!")
        else:
            messagebox.showerror("Error", "Failed to add manufacturer.")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def add_employee(first_name, middle_name, last_name, sex, phone, email, address_line1, city, state, pincode, country):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT add_employee(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);",
                    (first_name, middle_name, last_name, sex, int(phone), email, address_line1, city, state, int(pincode), country))
        result = cur.fetchone()[0]
        conn.commit()
        if result == 1:
            messagebox.showinfo("Success", "Employee added successfully!")
        else:
            messagebox.showerror("Error", "Failed to add employee.")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def add_item(batch_no, item_name, mfd, exp_date, cost_price, selling_price, stock, manufacturer):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT add_item(%s, %s, %s, %s, %s, %s, %s, %s);",
                    (batch_no, item_name, mfd, exp_date, float(cost_price), float(selling_price), int(stock), manufacturer))
        result = cur.fetchone()[0]
        conn.commit()
        if result:
            messagebox.showinfo("Success", "Item added successfully!")
        else:
            messagebox.showerror("Error", "Failed to add item.")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def add_online_partner(name, commission_percent):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT add_online_partner(%s, %s);", (name, float(commission_percent)))
        result = cur.fetchone()[0]
        conn.commit()
        if result == 1:
            messagebox.showinfo("Success", "Online partner added successfully!")
        else:
            messagebox.showerror("Error", "Failed to add online partner.")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def add_order(empid, online_partner, custid):
    conn = connect_to_db()
    if not conn: return None
    try:
        cur = conn.cursor()
        cur.execute("SELECT add_order(%s, %s, %s);", (empid if empid else None, online_partner if online_partner else None, custid))
        order_id = cur.fetchone()[0]
        conn.commit()
        messagebox.showinfo("Order Placed", f"Order ID: {order_id}")
        return order_id
    except Exception as e:
        messagebox.showerror("Error", str(e))
        return None
    finally:
        conn.close()

def add_item_ordered(order_id, item_name, quantity):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT add_item_ordered(%s, %s, %s);", (order_id, item_name, int(quantity)))
        price = cur.fetchone()[0]
        conn.commit()
        if price > 0:
            messagebox.showinfo("Success", f"Item added to order. Total price: {price}")
        else:
            messagebox.showerror("Error", "Failed to add item to order or insufficient stock.")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def remove_employee(empid):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("CALL remove_employee(%s);", (empid,))
        conn.commit()
        messagebox.showinfo("Success", "Employee removed successfully!")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def find_customer_by_phone(phone):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("""
            SELECT cs.customer_id, cs.customer_name, cs.customer_email, c.phone, 
                   cs.last_order_id, cs.last_order_date, cs.total_spending
            FROM customer_summary cs
            JOIN customer c ON cs.customer_id = c.id
            WHERE c.phone = %s;
        """, (int(phone),))
        result = cur.fetchone()
        if result:
            messagebox.showinfo(
                "Customer Details",
                f"ID: {result[0]}\nName: {result[1]}\nEmail: {result[2]}\nPhone: {result[3]}"
                f"\nLast Order ID: {result[4]}\nLast Order Date: {result[5]}\nTotal Spending: {result[6]}"
            )
        else:
            messagebox.showerror("Not Found", "Customer not found.")
    except Exception as e:
        messagebox.showerror("Error", str(e))
    finally:
        conn.close()

def show_employee_summary():
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT * FROM employee_summary;")
        rows = cur.fetchall()
        summary = ""
        for row in rows:
            summary += (
                f"EmpCode: {row[0]}, Name: {row[1]} {row[2]} {row[3]}, Sex: {row[4]}, Phone: {row[5]}, Email: {row[6]}\n"
                f"Sales Past Month: {row[7]}, Sales Past Year: {row[8]}\n\n"
            )
        if summary:
            return summary
        else:
            return "No data found."
    except Exception as e:
        messagebox.showerror("Error", str(e))
        return None
    finally:
        conn.close()

def show_items_below_stock(stock_limit):
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT batch_no, item_name, stock FROM item WHERE stock < %s;", (stock_limit,))
        rows = cur.fetchall()
        result = ""
        for row in rows:
            result += f"Batch No: {row[0]}, Item Name: {row[1]}, Stock: {row[2]}\n"
        if result:
            return result
        else:
            return "No items found below the given stock."
    except Exception as e:
        messagebox.showerror("Error", str(e))
        return None
    finally:
        conn.close()

def show_expired_items():
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute("SELECT batch_no, item_name, exp_date FROM item WHERE exp_date < CURRENT_DATE;")
        rows = cur.fetchall()
        result = ""
        for row in rows:
            result += f"Batch No: {row[0]}, Item Name: {row[1]}, Expiry Date: {row[2]}\n"
        if result:
            return result
        else:
            return "No expired items found."
    except Exception as e:
        messagebox.showerror("Error", str(e))
        return None
    finally:
        conn.close() 

def show_performance_dashboard():
    conn = connect_to_db()
    if not conn: return
    try:
        cur = conn.cursor()
        # Main KPIs
        cur.execute("""
            SELECT
              COALESCE((SELECT SUM(io.quantity * i.selling_price) FROM items_ordered io JOIN item i ON io.batch_no = i.batch_no), 0) AS total_sales_revenue,
              COALESCE((SELECT SUM(io.quantity * (i.selling_price - i.cost_price)) FROM items_ordered io JOIN item i ON io.batch_no = i.batch_no), 0) AS gross_profit,
              COALESCE((SELECT SUM(stock * cost_price) FROM item), 0) AS total_inventory_value,
              COALESCE((SELECT SUM(stock * cost_price) FROM item WHERE exp_date < CURRENT_DATE), 0) AS expired_inventory_value,
              COALESCE((SELECT ROUND(SUM(io.quantity * i.selling_price) * 1.0 / NULLIF(COUNT(DISTINCT io.orderid),0), 2) FROM items_ordered io JOIN item i ON io.batch_no = i.batch_no), 0) AS avg_transaction_value
        """)
        kpis = cur.fetchone()
        
        # Top 5 items
        cur.execute("""
            SELECT i.item_name, SUM(io.quantity) AS total_sold
            FROM items_ordered io JOIN item i ON io.batch_no = i.batch_no
            GROUP BY i.item_name
            ORDER BY total_sold DESC
            LIMIT 5;
        """)
        top_items = cur.fetchall()
        
        # Most profitable item
        cur.execute("""
            SELECT item_name, 
                   SUM(quantity * (i.selling_price - i.cost_price)) AS total_profit
            FROM items_ordered io
            JOIN item i ON io.batch_no = i.batch_no
            GROUP BY item_name
            ORDER BY total_profit DESC
            LIMIT 1;
        """)
        most_profitable = cur.fetchone()
        
        # Sales distribution by category
        cur.execute("""
            SELECT 
              CASE 
                WHEN i.item_name ILIKE '%milk%' OR i.item_name ILIKE '%cheese%' OR i.item_name ILIKE '%yogurt%' THEN 'Dairy'
                WHEN i.item_name ILIKE '%bread%' OR i.item_name ILIKE '%cake%' OR i.item_name ILIKE '%cookie%' THEN 'Bakery'
                WHEN i.item_name ILIKE '%fruit%' OR i.item_name ILIKE '%vegetable%' THEN 'Produce'
                WHEN i.item_name ILIKE '%meat%' OR i.item_name ILIKE '%chicken%' OR i.item_name ILIKE '%fish%' THEN 'Meat'
                WHEN i.item_name ILIKE '%cereal%' OR i.item_name ILIKE '%pasta%' OR i.item_name ILIKE '%rice%' THEN 'Grains'
                ELSE 'Other'
              END AS category,
              SUM(io.quantity * i.selling_price) AS total_sales
            FROM items_ordered io
            JOIN item i ON io.batch_no = i.batch_no
            GROUP BY category
            ORDER BY total_sales DESC;
        """)
        category_sales = cur.fetchall()
        
        # Monthly sales for last year
        cur.execute("""
            SELECT 
              TO_CHAR(o.date_of_order, 'YYYY-MM') AS month,
              SUM(io.quantity * i.selling_price) AS total_sales
            FROM orders o
            JOIN items_ordered io ON o.orderid = io.orderid
            JOIN item i ON io.batch_no = i.batch_no
            WHERE o.date_of_order >= date_trunc('month', CURRENT_DATE) - INTERVAL '12 months'
            GROUP BY TO_CHAR(o.date_of_order, 'YYYY-MM')
            ORDER BY month;
        """)
        monthly_sales = cur.fetchall()
        
        result = {
            'kpis': kpis,
            'top_items': top_items,
            'most_profitable': most_profitable,
            'category_sales': category_sales,
            'monthly_sales': monthly_sales
        }
        return result
    except Exception as e:
        messagebox.showerror("Error", str(e))
        return None
    finally:
        conn.close()
