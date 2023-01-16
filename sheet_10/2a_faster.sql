EXPLAIN SELECT first_name, last_name, count(film.film_id)
FROM film_actor
    INNER JOIN actor ON actor.actor_id = film_actor.actor_id
    INNER JOIN film ON film.film_id = film_actor.film_id
    WHERE length >= 120
GROUP BY first_name, last_name
ORDER BY first_name, last_name