SELECT customer.last_name AS last_name,
       rental.return_date AS return_date
FROM rental
JOIN customer ON customer.customer_id = rental.customer_id
JOIN staff ON staff.staff_id = rental.staff_id
WHERE staff.last_name ILIKE 'Stephens'
    AND rental.rental_date >= date '2005-05-24 00:00:00'
    AND rental.rental_date <= date '2005-05-24 23:59:59'