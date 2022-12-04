WITH RECURSIVE RecRel(root_person_id, follower_id, steps, follows_since) AS 
(
    SELECT 
        followed_person_id, 
        person_id,
        0, 
        follows_since
    FROM person 
    JOIN follow ON (follow.followed_person_id = person.id)
    WHERE person.year_of_birth = 1990 AND follows_since BETWEEN '2015-06-01' AND '2016-06-01'
    UNION ALL
    SELECT 
        rec.root_person_id,
        step.person_id,
        rec.steps + 1,
        step.follows_since
    FROM RecRel AS rec
    JOIN follow as step ON (rec.follower_id = step.followed_person_id)
    WHERE rec.steps < 5
)


SELECT 
	sub1.root_person_id, 
	sub1.firstname,
	sub1.lastname, 
	sub1.steps, 
	sub1.follower_count 
FROM
(
	SELECT 
		rec.root_person_id,
		person.firstname, 
		person.lastname,
		rec.steps,
		COUNT(DISTINCT rec.follower_id) AS follower_count
	FROM RecRel as rec
	JOIN person ON (rec.root_person_id = person.id)
	GROUP BY rec.root_person_id, rec.steps, person.id
	ORDER BY root_person_id ASC, steps ASC
) AS sub1

JOIN 
(
	SELECT 
		root_person_id
	FROM
	(
		SELECT 
			rec.root_person_id,
			rec.steps,
			COUNT(DISTINCT rec.follower_id) AS follower_count
		FROM RecRel as rec
		GROUP BY rec.root_person_id, rec.steps
		ORDER BY root_person_id ASC, steps ASC
	) AS sub2
	WHERE steps = 5 AND follower_count > 550
) AS sub3 ON (sub1.root_person_id = sub3.root_person_id)

