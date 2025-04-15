import tkinter as tk
from tkinter import ttk, messagebox, simpledialog
from src.database import *
from config.config import APP_TITLE
import tkinter.font as tkFont
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import numpy as np

class SupermarketApp:
    def __init__(self, root):
        self.root = root
        self.root.title(APP_TITLE)
        
        # Configure style
        self.style = ttk.Style()
        self.style.theme_use('clam')  # Use a modern theme
        
        # Configure colors and fonts
        self.primary_color = '#2c3e50'
        self.secondary_color = '#3498db'
        self.success_color = '#2ecc71'
        self.danger_color = '#e74c3c'
        self.bg_color = '#ecf0f1'
        self.text_color = '#2c3e50'
        
        # Configure fonts
        self.title_font = tkFont.Font(family='Helvetica', size=12, weight='bold')
        self.label_font = tkFont.Font(family='Helvetica', size=10)
        self.button_font = tkFont.Font(family='Helvetica', size=10, weight='bold')
        
        # Configure styles
        self.style.configure('TFrame', background=self.bg_color)
        self.style.configure('TLabel', background=self.bg_color, foreground=self.text_color, font=self.label_font)
        self.style.configure('TButton', 
                           background=self.secondary_color, 
                           foreground='white',
                           font=self.button_font,
                           padding=5)
        self.style.map('TButton',
                      background=[('active', self.primary_color)],
                      foreground=[('active', 'white')])
        
        # Main container
        self.main_frame = ttk.Frame(root, padding="10")
        self.main_frame.pack(fill='both', expand=True)
        
        # Vertical tab navigation (Listbox)
        self.tab_names = [
            "Add Customer",
            "Add Supplier",
            "Add Manufacturer",
            "Add Employee",
            "Add Item",
            "Add Online Partner",
            "Place Order",
            "Remove Employee",
            "Find Customer by Phone",
            "Employee Summary",
            "Items Below Stock",
            "Expired Items",
            "Performance Dashboard"
        ]
        self.tab_methods = [
            self.create_customer_tab,
            self.create_supplier_tab,
            self.create_manufacturer_tab,
            self.create_employee_tab,
            self.create_item_tab,
            self.create_online_partner_tab,
            self.create_order_tab,
            self.create_remove_employee_tab,
            self.create_find_customer_tab,
            self.create_employee_summary_tab,
            self.create_items_below_stock_tab,
            self.create_expired_items_tab,
            self.create_dashboard_tab
        ]
        self.tab_frames = {}

        self.left_panel = ttk.Frame(self.main_frame)
        self.left_panel.pack(side='left', fill='y', padx=(0, 10), pady=5)
        self.tab_listbox = tk.Listbox(self.left_panel, exportselection=False, font=self.button_font, width=30, bg=self.primary_color, fg='white', selectbackground=self.secondary_color, selectforeground='white', activestyle='none')
        for name in self.tab_names:
            self.tab_listbox.insert('end', name)
        self.tab_listbox.pack(fill='y', expand=True)
        self.tab_listbox.bind('<<ListboxSelect>>', self.on_tab_selected)

        # Content area
        self.content_panel = ttk.Frame(self.main_frame)
        self.content_panel.pack(side='left', fill='both', expand=True)

        # Create all tab frames (but don't pack them yet)
        for name, method in zip(self.tab_names, self.tab_methods):
            frame = ttk.Frame(self.content_panel)
            self.tab_frames[name] = frame
            method(frame)

        # Show the first tab by default
        self.tab_listbox.selection_set(0)
        self.show_tab(self.tab_names[0])

    def on_tab_selected(self, event):
        idx = self.tab_listbox.curselection()
        if not idx:
            return
        tab_name = self.tab_names[idx[0]]
        self.show_tab(tab_name)

    def show_tab(self, tab_name):
        # Hide all frames
        for frame in self.tab_frames.values():
            frame.pack_forget()
        # Show selected frame
        self.tab_frames[tab_name].pack(fill='both', expand=True)

    def create_form_frame(self, parent, title):
        """Create a consistent form frame with title"""
        frame = ttk.Frame(parent, padding="10")
        frame.pack(fill='both', expand=True)
        # Add title
        title_label = ttk.Label(frame, text=title, font=self.title_font)
        title_label.grid(row=0, column=0, columnspan=2, pady=(0, 20), sticky='w')
        return frame

    def create_input_field(self, parent, label_text, row):
        """Create a consistent input field with label"""
        label = ttk.Label(parent, text=label_text)
        label.grid(row=row, column=0, sticky='w', padx=5, pady=5)
        entry = ttk.Entry(parent)
        entry.grid(row=row, column=1, sticky='ew', padx=5, pady=5)
        return entry

    def create_button(self, parent, text, command, row, columnspan=2):
        """Create a consistent button"""
        button = ttk.Button(parent, text=text, command=command)
        button.grid(row=row, column=0, columnspan=columnspan, pady=10, sticky='ew')
        return button

    def create_customer_tab(self, parent):
        frame = self.create_form_frame(parent, "Add Customer")
        self.entry_cust_name = self.create_input_field(frame, "Name", 1)
        self.entry_cust_email = self.create_input_field(frame, "Email", 2)
        self.entry_cust_phone = self.create_input_field(frame, "Phone", 3)
        self.create_button(frame, "Add Customer", self.add_customer, 4)

    def create_supplier_tab(self, parent):
        frame = self.create_form_frame(parent, "Add Supplier")
        labels = ["Name", "Phone", "Email", "Address Line 1", "City", "State", "Pincode", "Country"]
        self.entries_supplier = []
        for i, label in enumerate(labels):
            entry = self.create_input_field(frame, label, i + 1)
            self.entries_supplier.append(entry)
        self.create_button(frame, "Add Supplier", self.add_supplier, len(labels) + 1)

    def create_manufacturer_tab(self, parent):
        frame = self.create_form_frame(parent, "Add Manufacturer")
        labels = ["Name", "Phone", "Email", "Address Line 1", "City", "State", "Pincode", "Country"]
        self.entries_manufacturer = []
        for i, label in enumerate(labels):
            entry = self.create_input_field(frame, label, i + 1)
            self.entries_manufacturer.append(entry)
        self.create_button(frame, "Add Manufacturer", self.add_manufacturer, len(labels) + 1)

    def create_employee_tab(self, parent):
        frame = self.create_form_frame(parent, "Add Employee")
        labels = ["First Name", "Middle Name", "Last Name", "Sex", "Phone", "Email", 
                 "Address Line 1", "City", "State", "Pincode", "Country"]
        self.entries_employee = []
        for i, label in enumerate(labels):
            entry = self.create_input_field(frame, label, i + 1)
            self.entries_employee.append(entry)
        self.create_button(frame, "Add Employee", self.add_employee, len(labels) + 1)

    def create_item_tab(self, parent):
        frame = self.create_form_frame(parent, "Add Item")
        labels = ["Batch No", "Item Name", "MFD (YYYY-MM-DD)", "EXP Date (YYYY-MM-DD)", 
                 "Cost Price", "Selling Price", "Stock", "Manufacturer"]
        self.entries_item = []
        for i, label in enumerate(labels):
            entry = self.create_input_field(frame, label, i + 1)
            self.entries_item.append(entry)
        self.create_button(frame, "Add Item", self.add_item, len(labels) + 1)

    def create_online_partner_tab(self, parent):
        frame = self.create_form_frame(parent, "Add Online Partner")
        self.entry_partner_name = self.create_input_field(frame, "Name", 1)
        self.entry_partner_comm = self.create_input_field(frame, "Commission %", 2)
        self.create_button(frame, "Add Online Partner", self.add_online_partner, 3)

    def create_order_tab(self, parent):
        frame = self.create_form_frame(parent, "Place Order")
        self.entry_order_empid = self.create_input_field(frame, "Employee ID (or leave blank)", 1)
        self.entry_order_partner = self.create_input_field(frame, "Online Partner (or leave blank)", 2)
        self.entry_order_custid = self.create_input_field(frame, "Customer ID", 3)
        self.entry_order_item = self.create_input_field(frame, "Item Name", 4)
        self.entry_order_qty = self.create_input_field(frame, "Quantity", 5)
        self.create_button(frame, "Place Order", self.place_order, 6)

    def create_remove_employee_tab(self, parent):
        frame = self.create_form_frame(parent, "Remove Employee")
        self.entry_remove_empid = self.create_input_field(frame, "Employee ID", 1)
        self.create_button(frame, "Remove Employee", self.remove_employee, 2)

    def create_find_customer_tab(self, parent):
        frame = self.create_form_frame(parent, "Find Customer by Phone")
        self.entry_find_cust_phone = self.create_input_field(frame, "Phone", 1)
        self.create_button(frame, "Find Customer Details", self.find_customer, 2)

    def create_employee_summary_tab(self, parent):
        frame = self.create_form_frame(parent, "Employee Summary")
        self.create_button(frame, "Show Employee Summary", self.show_employee_summary, 1)

    def create_items_below_stock_tab(self, parent):
        frame = self.create_form_frame(parent, "Items Below Stock")
        self.entry_stock_limit = self.create_input_field(frame, "Stock Limit", 1)
        self.create_button(frame, "Show Items Below Stock", self.show_items_below_stock, 2)

    def create_expired_items_tab(self, parent):
        frame = self.create_form_frame(parent, "Expired Items")
        self.create_button(frame, "Show Expired Items", self.show_expired_items, 1)

    def create_dashboard_tab(self, parent):
        frame = self.create_form_frame(parent, "Performance Dashboard")
        self.create_button(frame, "Show Performance Dashboard", self.show_performance_dashboard, 1)

    def show_text_window(self, parent, title, content):
        win = tk.Toplevel(parent)
        win.title(title)
        win.geometry("600x400")
        win.configure(bg=self.bg_color)
        frame = ttk.Frame(win, padding="10")
        frame.pack(fill='both', expand=True)
        scrollbar = ttk.Scrollbar(frame)
        scrollbar.pack(side='right', fill='y')
        text = tk.Text(frame, 
                      wrap='word',
                      yscrollcommand=scrollbar.set,
                      font=self.label_font,
                      bg='white',
                      fg=self.text_color)
        text.pack(expand=True, fill='both')
        scrollbar.config(command=text.yview)
        text.insert('1.0', content)
        text.config(state='disabled')

    # Button command methods
    def add_customer(self):
        add_customer(
            self.entry_cust_name.get(),
            self.entry_cust_email.get(),
            self.entry_cust_phone.get()
        )

    def add_supplier(self):
        add_supplier(
            self.entries_supplier[0].get(),
            self.entries_supplier[1].get(),
            self.entries_supplier[2].get(),
            self.entries_supplier[3].get(),
            self.entries_supplier[4].get(),
            self.entries_supplier[5].get(),
            self.entries_supplier[6].get(),
            self.entries_supplier[7].get()
        )

    def add_manufacturer(self):
        add_manufacturer(
            self.entries_manufacturer[0].get(),
            self.entries_manufacturer[1].get(),
            self.entries_manufacturer[2].get(),
            self.entries_manufacturer[3].get(),
            self.entries_manufacturer[4].get(),
            self.entries_manufacturer[5].get(),
            self.entries_manufacturer[6].get(),
            self.entries_manufacturer[7].get()
        )

    def add_employee(self):
        add_employee(
            self.entries_employee[0].get(),
            self.entries_employee[1].get(),
            self.entries_employee[2].get(),
            self.entries_employee[3].get(),
            self.entries_employee[4].get(),
            self.entries_employee[5].get(),
            self.entries_employee[6].get(),
            self.entries_employee[7].get(),
            self.entries_employee[8].get(),
            self.entries_employee[9].get(),
            self.entries_employee[10].get()
        )

    def add_item(self):
        add_item(
            self.entries_item[0].get(),
            self.entries_item[1].get(),
            self.entries_item[2].get(),
            self.entries_item[3].get(),
            self.entries_item[4].get(),
            self.entries_item[5].get(),
            self.entries_item[6].get(),
            self.entries_item[7].get()
        )

    def add_online_partner(self):
        add_online_partner(
            self.entry_partner_name.get(),
            self.entry_partner_comm.get()
        )

    def place_order(self):
        empid = self.entry_order_empid.get() or None
        partner = self.entry_order_partner.get() or None
        custid = self.entry_order_custid.get()
        item = self.entry_order_item.get()
        qty = self.entry_order_qty.get()
        order_id = add_order(empid, partner, custid)
        if order_id and item and qty:
            add_item_ordered(order_id, item, qty)

    def remove_employee(self):
        remove_employee(self.entry_remove_empid.get())

    def find_customer(self):
        find_customer_by_phone(self.entry_find_cust_phone.get())

    def show_employee_summary(self):
        summary = show_employee_summary()
        if summary:
            self.show_text_window(self.root, "Employee Summary", summary)

    def show_items_below_stock(self):
        stock_limit_str = self.entry_stock_limit.get()
        try:
            stock_limit = int(stock_limit_str)
        except ValueError:
            messagebox.showerror("Invalid Input", "Please enter a valid integer for stock limit.")
            return
        result = show_items_below_stock(stock_limit)
        if result:
            self.show_text_window(self.root, "Items Below Stock", result)

    def show_expired_items(self):
        result = show_expired_items()
        if result:
            self.show_text_window(self.root, "Expired Items", result)

    def show_performance_dashboard(self):
        result = show_performance_dashboard()
        if result:
            win = tk.Toplevel(self.root)
            win.title("Performance Dashboard")
            win.geometry("1200x800")
            win.configure(bg=self.bg_color)
            main_frame = ttk.Frame(win, padding="10")
            main_frame.pack(fill='both', expand=True)
            kpi_frame = ttk.Frame(main_frame)
            kpi_frame.pack(fill='x', pady=10)
            kpis = result['kpis']
            kpi_labels = [
                f"Total Sales Revenue: ₹{kpis[0]:,.2f}",
                f"Gross Profit: ₹{kpis[1]:,.2f}",
                f"Current Inventory Value: ₹{kpis[2]:,.2f}",
                f"Expired Inventory Value: ₹{kpis[3]:,.2f}",
                f"Average Transaction Value: ₹{kpis[4]:,.2f}"
            ]
            for i, label_text in enumerate(kpi_labels):
                label = ttk.Label(kpi_frame, text=label_text, font=self.label_font)
                label.grid(row=0, column=i, padx=10, pady=5)
            graphs_frame = ttk.Frame(main_frame)
            graphs_frame.pack(fill='both', expand=True, pady=10)
            left_frame = ttk.Frame(graphs_frame)
            left_frame.pack(side='left', fill='both', expand=True, padx=5)
            top_items = result['top_items']
            if top_items:
                fig1 = plt.Figure(figsize=(5, 4))
                ax1 = fig1.add_subplot(111)
                items = [item[0] for item in top_items]
                quantities = [item[1] for item in top_items]
                ax1.bar(items, quantities)
                ax1.set_title('Top 5 Selling Items')
                ax1.set_ylabel('Quantity Sold')
                plt.xticks(rotation=45)
                fig1.tight_layout()
                canvas1 = FigureCanvasTkAgg(fig1, master=left_frame)
                canvas1.draw()
                canvas1.get_tk_widget().pack(fill='both', expand=True, pady=5)
            category_sales = result['category_sales']
            if category_sales:
                fig2 = plt.Figure(figsize=(5, 3))
                ax2 = fig2.add_subplot(111)
                categories = [item[0] for item in category_sales]
                sales = [item[1] for item in category_sales]
                wedges, texts, autotexts = ax2.pie(sales, labels=categories, autopct='%1.1f%%',
                                                 textprops={'fontsize': 8})
                ax2.set_title('Sales Distribution by Category')
                fig2.tight_layout()
                canvas2 = FigureCanvasTkAgg(fig2, master=left_frame)
                canvas2.draw()
                canvas2.get_tk_widget().pack(fill='both', expand=True, pady=5)
            right_frame = ttk.Frame(graphs_frame)
            right_frame.pack(side='right', fill='both', expand=True, padx=5)
            monthly_sales = result['monthly_sales']
            if monthly_sales:
                fig3 = plt.Figure(figsize=(8, 7))
                ax3 = fig3.add_subplot(111)
                months = [sale[0] for sale in monthly_sales]
                sales = [sale[1] for sale in monthly_sales]
                ax3.plot(months, sales, marker='o')
                ax3.set_title('Monthly Sales (Last 12 Months)')
                ax3.set_ylabel('Total Sales (₹)')
                plt.xticks(rotation=45)
                fig3.tight_layout()
                canvas3 = FigureCanvasTkAgg(fig3, master=right_frame)
                canvas3.draw()
                canvas3.get_tk_widget().pack(fill='both', expand=True)

def main():
    root = tk.Tk()
    app = SupermarketApp(root)
    root.mainloop()

if __name__ == "__main__":
    main()
