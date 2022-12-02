SELECT DISTINCT customer.email
FROM customer
JOIN rental ON rental.customer_id = customer.customer_id
JOIN staff ON staff.staff_id = rental.staff_id
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country AS customer_country ON city.country_id = customer_country.country_id

JOIN address AS staff_address ON staff.address_id = staff_address.address_id
JOIN city AS staff_city ON staff_address.city_id = staff_city.city_id
JOIN country AS staff_country ON staff_city.country_id = staff_country.country_id
WHERE customer_country.country = staff_country.country