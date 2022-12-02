SELECT
	film.title as title,
	SUM(payment.amount) as total_payment
FROM film
JOIN inventory
	 ON film.film_id = inventory.film_id
JOIN rental
	 ON inventory.inventory_id = rental.inventory_id
JOIN payment
	 ON rental.rental_id = payment.rental_id
GROUP BY film.film_id
HAVING SUM(payment.amount) > 210 
ORDER BY total_payment DESC
