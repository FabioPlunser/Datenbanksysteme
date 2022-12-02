-- SELECT
--     person.id as person_id,
--     followed_person_id as following
-- FROM person 
-- JOIN follow ON (person.id = follow.person_id)
-- WHERE person.firstname = 'Victor' AND person.lastname = 'Hall'



WITH RECURSIVE RecRel(person_id, following, path, steps) AS
(
	SELECT 
        person.id, 
        followed_person_id, 
        concat(id,' -> ', followed_person_id),
        1
    FROM person 
    JOIN follow ON (person.id = follow.person_id)
    WHERE person.firstname = 'Victor' AND person.lastname = 'Hall'
	UNION ALL
	SELECT 
        person.id,
        follow.followed_person_id,
        concat(rec.path, ' -> ', follow.followed_person_id),
        rec.steps + 1
	FROM RecRel AS rec 
    JOIN person ON (rec.following = person.id)
    JOIN follow ON (person.id = follow.person_id)
    WHERE rec.steps < 3
)
SELECT * FROM RecRel

