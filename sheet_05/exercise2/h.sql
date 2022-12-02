SELECT 
	COUNT(film.film_id) as returned_friday_13
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE EXTRACT(DAY FROM date (rental.return_date)) = 13 AND EXTRACT(ISODOW FROM date (rental.return_date)) = 5
GROUP BY film.film_id

