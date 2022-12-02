SELECT
    film.title as title,
    total_payment
FROM
    film
    LEFT JOIN (
        SELECT
            title,
            film.film_id,
            SUM(payment.amount) as total_payment
        FROM
            film
            JOIN inventory ON film.film_id = inventory.film_id
            JOIN rental ON inventory.inventory_id = rental.inventory_id
            JOIN payment ON rental.rental_id = payment.rental_id
        GROUP BY
            film.film_id
        HAVING
            SUM(payment.amount) > 0
    ) AS innerSelect ON film.film_id = innerSelect.film_id
ORDER BY total_payment ASC, title ASC