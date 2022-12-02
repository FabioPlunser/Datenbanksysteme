SELECT DISTINCT film.title AS title,
                film.length AS length
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.first_name ILIKE 'Audrey'