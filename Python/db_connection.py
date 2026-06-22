# db_connection.py
import mysql.connector

def get_connection():
    conn = mysql.connector.connect(
        host     = "localhost",
        user     = "root",          # your MySQL username
        password = "Shau22", # your MySQL password
        database = "gicci_db"
    )
    return conn

# Test the connection
if __name__ == "__main__":
    try:
        conn = get_connection()
        print(" Connected to MySQL successfully!")
        conn.close()
    except Exception as e:
        print(f" Connection failed: {e}")