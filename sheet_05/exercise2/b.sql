SELECT film.title AS title,
       category.name AS category
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
WHERE (
         category.name ILIKE 'Documentary'
         OR category.name ILIKE 'Comedy'
      ) AND film.replacement_cost < 10