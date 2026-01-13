"""
Script to create the database if it doesn't exist.
Run this before starting the FastAPI server if the database doesn't exist.
"""
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

DATABASE_URL = "postgresql://postgres:mini929203@localhost:5432/"
DB_NAME = "tododb"

try:
    # Connect to PostgreSQL server (default postgres database)
    conn = psycopg2.connect(DATABASE_URL + "postgres")
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cursor = conn.cursor()
    
    # Check if database exists
    cursor.execute("SELECT 1 FROM pg_database WHERE datname = %s", (DB_NAME,))
    exists = cursor.fetchone()
    
    if not exists:
        # Create database
        cursor.execute(f"CREATE DATABASE {DB_NAME}")
        print(f"Database '{DB_NAME}' created successfully!")
    else:
        print(f"Database '{DB_NAME}' already exists.")
    
    cursor.close()
    conn.close()
    
except psycopg2.Error as e:
    print(f"Error creating database: {e}")
    print("\nPlease make sure PostgreSQL is running and credentials are correct.")
    print("You can also create the database manually using psql:")
    print(f"  psql -U postgres -c 'CREATE DATABASE {DB_NAME};'")

