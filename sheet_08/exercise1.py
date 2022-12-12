import psycopg2
from tabulate import tabulate

conn = psycopg2.connect("host=localhost dbname=pagila user=postgres")
cur = conn.cursor()

from_date = ""
to_date = ""

# get the rental report with from and to date and represent it in a table
def rental_report():

    query = f"""SELECT
    category_name,
    SUM(CASE WHEN week_day = 1 THEN _count ELSE 0 END) as mon,
    SUM(CASE WHEN week_day = 2 THEN _count ELSE 0 END) as tue,
    SUM(CASE WHEN week_day = 3 THEN _count ELSE 0 END) as wed,
    SUM(CASE WHEN week_day = 4 THEN _count ELSE 0 END) as thu,
    SUM(CASE WHEN week_day = 5 THEN _count ELSE 0 END) as fri,
    SUM(CASE WHEN week_day = 6 THEN _count ELSE 0 END) as sat,
    SUM(CASE WHEN week_day = 0 THEN _count ELSE 0 END) as sun,
    SUM(_count) as total
FROM (
    SELECT 
        category.name as category_name,
        EXTRACT(DOW FROM rental_date) as week_day,
        COUNT(*) as _count
    FROM rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    JOIN film ON inventory.film_id = film.film_id
    JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    WHERE rental_date BETWEEN %s AND %s
    GROUP BY 
        category.name,
        EXTRACT(DOW FROM rental_date)
) AS innerSelect
GROUP BY category_name
ORDER BY category_name ASC"""

    cur.execute(query, (from_date, to_date))
  
    data = cur.fetchall()
    if(len(data) == 0):
        print("No data found")
        main()
    else:
        print_data(data)
        main()

def rental_report_function():
    query = f"""SELECT * FROM report_function(%s, %s) """

    cur.execute(query, (from_date, to_date))
    

    data = cur.fetchall()
    if(len(data) == 0):
        print("No data found")
        main()
    else:
        print_data(data)
        main()

def print_data(data):
    print(tabulate(data, headers=["category name", "mon", "tue", "wed", "thu", "fri", "sat", "sun", "total"], tablefmt="psql"))

def main():
    user_input = input("(Pagila)> ").strip()
    if user_input == "exit":
        return
    if user_input == "help" or user_input == "h": 
        print("Commands: \n rental_report, rentaL_report_function")
        main()

    if user_input == "rental_report" or user_input == "rental_report_function":
        # get from and to date and check if date is valid to prevent sql injection
        global from_date
        global to_date
        from_date = input("From: ")
        to_date = input("To: ")
        
        if(user_input == "rental_report"):
            rental_report()
        if(user_input == "rental_report_function"):
            rental_report_function()
    else:
        print("Command not found")
        main()
    

if __name__ == "__main__":
    main()