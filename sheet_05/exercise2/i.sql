SELECT language.name AS name
FROM language
LEFT JOIN film ON film.language_id = language.language_id
WHERE film.film_id IS NULL
ORDER BY language.name