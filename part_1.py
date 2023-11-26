import psycopg2
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

def create_database(dbname):
    conn_string = "host='localhost' dbname='postgres' user='postgres' password='akhila123'"
    conn = psycopg2.connect(conn_string)
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cursor = conn.cursor()
    
    #Code to create database
    sql_create_database = f"CREATE DATABASE {dbname};"
    cursor.execute(sql_create_database)
  
    print("Database has been created successfully!")
    conn.close()

def connect_postgres(dbname):
    conn_string = f"host='localhost' dbname={dbname} user='postgres' password='akhila123'"
    conn = psycopg2.connect(conn_string)
    return conn

def execute_schema_script(conn, script_path):
    with conn.cursor() as cursor:
        with open(script_path, 'r') as f:
            sql_script = f.read()
            cursor.execute(sql_script)
    conn.commit()
    print("Schema has been created successfully!")

def execute_insert_script(conn, script_path):
    with conn.cursor() as cursor:
        with open(script_path, 'r') as f:
            sql_script = f.read()
            cursor.execute(sql_script)
    conn.commit()
    print("Data has been inserted successfully!")
    
def retrieve_data(conn):
    
    cursor = conn.cursor()

    # Select data from the Products table
    cursor.execute(f"SELECT * FROM Products;")
    products_data = cursor.fetchall()
    print("Data from Products table:")
    for row in products_data:
        print(row)

    # Select data from the warehouses table
    cursor.execute(f"SELECT * FROM Warehouses;")
    warehouse_data = cursor.fetchall()
    print("\nData from warehouses table:")
    for row in warehouse_data:
        print(row)
        

if __name__ == '__main__':
    # Specify the name of the database
    dbname = "mykeyspace"

    # Create the database
    create_database(dbname)

    # Connect to the newly created database
    conn = connect_postgres(dbname)

    # Specify the path to the SQL schema file
    schema_file_path = "schema.sql"

    # Execute the schema script to create tables
    execute_schema_script(conn, schema_file_path)

    # Specify the path to the SQL data insertion file
    insert_data_file_path = "insert_data.sql"

    # Execute the data insertion script
    execute_insert_script(conn, insert_data_file_path)
    
    #Retrieve the data 
    retrieve_data(conn)

    # Close the database connection
    conn.close()