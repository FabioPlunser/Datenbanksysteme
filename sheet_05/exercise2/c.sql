SELECT CONCAT(customer.first_name, ' ', customer.last_name) as name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country ILIKE '%land';