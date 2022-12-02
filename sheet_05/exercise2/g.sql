SELECT COUNT(DISTINCT film.rating) as different_ratings
FROM film
WHERE 'Deleted Scenes' = ANY (film.special_features)
-- GROUP BY film.rating