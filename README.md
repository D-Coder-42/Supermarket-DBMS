# Supermarket Database Management System

A Java-based application for managing grocery store operations including inventory, orders, customers, employees, and suppliers.

## Features

- Customer management
- Employee management
- Supplier management
- Inventory tracking
- Order processing
- Stock management
- Online partner integration

## Database Setup

The database schema and objects are defined in the following SQL files:

- `sql/schema.sql` - Creates all tables and constraints
- `sql/functions.sql` - Creates all PL/SQL functions
- `sql/procedures.sql` - Creates all PL/SQL procedures
- `sql/triggers.sql` - Creates all database triggers
- `sql/master.sql` - Runs all SQL scripts in the correct order

To set up the database, run the master.sql file in SQL*Plus:
```bash
sqlplus system/your_password@localhost:1521/ORCL @sql/master.sql
```


## Setup Instructions

1. Install Oracle Database
2. Run the SQL scripts in the `sql` folder to set up the database schema
3. Download Oracle JDBC driver and place it in the `lib` folder
4. Create a `config.properties` file based on the template
5. Run the application using `run.bat`

## Requirements

- Java 8 or higher
- Oracle Database
- Oracle JDBC Driver