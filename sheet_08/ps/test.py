import psycopg2

conn = psycopg2.connect("host=localhost dbname=discussion user=postgres")
cur = conn.cursor()
cur.execute("SELECT * FROM sales")

records = cur.fetchall()

print("Date       | Amount")
print("-----------+--------")
total_amount = 0
for sale in records: 
        date = sale[0]
        amount = sale[1]

        print(date, "|", amount)
        total_amount += amount
print("\nTotal sales: ", total_amount)