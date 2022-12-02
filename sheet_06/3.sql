(
	SELECT
		title,
		category.name AS category_name,
		SUM(payment.amount) AS total_earnings,
		SUM(payment.amount) / COUNT(DISTINCT rental.rental_id) AS avg_payment
	FROM
		film
		JOIN film_category ON film.film_id = film_category.film_id
		JOIN category ON film_category.category_id = category.category_id
		JOIN inventory ON film.film_id = inventory.film_id
		JOIN rental ON inventory.inventory_id = rental.inventory_id
		JOIN payment ON rental.rental_id = payment.rental_id
	GROUP BY
		film.film_id,
		category.category_id
)
UNION ALL 
(
	SELECT
		'Category Pricings' AS title,
		category.name AS category_name,
		SUM(payment.amount) AS total_earnings,
		SUM(payment.amount) / COUNT(DISTINCT rental.rental_id) AS avg_payment
	FROM
		category
		JOIN film_category ON category.category_id = film_category.category_id
		JOIN film ON film_category.film_id = film.film_id
		JOIN inventory ON film.film_id = inventory.film_id
		JOIN rental ON inventory.inventory_id = rental.inventory_id
		JOIN payment ON rental.rental_id = payment.rental_id
	GROUP BY
		category.category_id
)
ORDER BY
	total_earnings DESC,
	category_name ASC,
	title ASC