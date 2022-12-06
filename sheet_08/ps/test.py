import psycopg2

conn = psycopg2.connect("host=localhost dbname=discussion user=postgres")
cur = conn.cursor()
cur.execute("SELECT * FROM sales")

records = cur.fetchall()
print(records)