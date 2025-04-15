# Supermarket Management System

A database management system for supermarket operations built with Python and PostgreSQL.

## Features

- Customer Management
- Supplier Management
- Manufacturer Management
- Employee Management
- Inventory Management
- Online Partner Integration
- Order Processing
- Reporting and Analytics

## Prerequisites

- Python 3.6 or higher
- PostgreSQL 12 or higher
- psycopg2-binary
- tkinter (usually comes with Python)

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd supermarket_management_system
```

2. Create a virtual environment (recommended):
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Set up the PostgreSQL database:
   - Create a database named `supermarket_db`
   - Run the SQL scripts in the `sql` directory to set up the database schema

5. Configure the database connection:
   - Copy `config/config.template.py` to `config/config.py`
   - Edit `config/config.py` with your database credentials:
     ```python
     DB_HOST = "localhost"  # Your PostgreSQL host
     DB_NAME = "supermarket_db"  # Your database name
     DB_USER = "your_username"  # Your PostgreSQL username
     DB_PASS = "your_password"  # Your PostgreSQL password
     ```

## Usage

Run the application:
```bash
python main.py
```

## Project Structure

```
supermarket_management_system/
├── src/
│   ├── __init__.py
│   ├── database.py
│   └── gui.py
├── config/
│   ├── __init__.py
│   ├── config.template.py  # Template configuration
│   └── config.py  # Your local configuration (not tracked by git)
├── sql/
│   ├── schema.sql
│   ├── functions.sql
│   ├── procedures.sql
│   ├── triggers.sql
│   └── master.sql
├── main.py
├── requirements.txt
└── README.md
```

## Security Note

- Never commit your `config.py` file to version control
- Keep your database credentials secure
- Use environment variables for sensitive information in production

## License

This project is licensed under the MIT License - see the LICENSE file for details. 