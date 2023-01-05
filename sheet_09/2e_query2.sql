Select tconst, COUNT(language) AS no_languages
FROM title_akas
INNER JOIN title_ratings ON title_ratings.tconst = title_akas.titleId
GROUP BY tconst
HAVING COUNT(language) > (
    SELECT AVG(languagecount)
    FROM ( 
        SELECT COUNT(language) AS languagecount
        FROM title_akas
        GROUP BY titleId
    ) as tmp
)