WITH RECURSIVE RecRel(person_id, following, path, steps) AS
(
	SELECT 
        person_id, 
        followed_person_id, 
        concat(id,'->', followed_person_id),
        1
    FROM person AS p1
    JOIN follow ON (p1.id = follow.person_id)
    WHERE p1.firstname = 'Victor' AND p1.lastname = 'Hall'
    UNION ALL
	SELECT 
        rec.person_id,
        follow.followed_person_id,
        concat(rec.path, '->', follow.followed_person_id),
        rec.steps + 1
	FROM RecRel AS rec 
    JOIN follow ON (following = follow.person_id)
    WHERE rec.steps < 3
)
SELECT * FROM RecRel







