EXPLAIN WITH languagecounts AS (
    SELECT titleId, COUNT(language) AS no_languages
    FROM title_akas
    GROUP BY titleId
)

SELECT tconst, no_languages
FROM title_ratings
INNER JOIN languagecounts ON title_ratings.tconst = languagecounts.titleId
WHERE no_languages > ( SELECT AVG(no_languages) FROM languagecounts )