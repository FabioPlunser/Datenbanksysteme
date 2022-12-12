-- create function rental_report
CREATE or REPLACE FUNCTION report_function (from_date date, to_date date)
RETURNS TABLE (
    category_name varchar(25),
    mon INT,
    tue INT,
    wed INT,
    thu INT,
    fri INT,
    sat INT,
    sun INT,
    total INT
)
AS $$
    SELECT
        innerSelect.category_name as category_name,
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
        WHERE rental_date BETWEEN $1 AND $2
        GROUP BY 
            category.name,
            EXTRACT(DOW FROM rental_date)
    ) AS innerSelect
    GROUP BY innerSelect.category_name
    ORDER BY category_name ASC;
$$
language 'sql'



 