SELECT
	category.name as category_name,
	AVG(film.length) as avg_film_length
FROM
	category
	JOIN film_category ON category.category_id = film_category.category_id
	JOIN film ON film_category.film_id = film.film_id
GROUP BY
	category.category_id
ORDER BY
	avg_film_length DESC