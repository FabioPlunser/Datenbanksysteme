SELECT
	first_name,
	last_name,
	COUNT(film.film_id) as movie_count
FROM
	actor
	JOIN film_actor ON actor.actor_id = film_actor.actor_id
	JOIN film ON film_actor.film_id = film.film_id
GROUP BY
	actor.actor_id
ORDER BY
	movie_count DESC,
	last_name DESC,
	first_name DESC