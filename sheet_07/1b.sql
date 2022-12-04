-- person(id, firstname, lastname, year_of_birth, country_id)
-- friendship(person1_id, person2_id, friends_since)
-- follow(person_id, followed_person_id, follows_since)

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
    WHERE rec.steps < 5 AND step.follows_since BETWEEN '2015-06-01' AND '2016-06-01'
)
SELECT 
    root_person_id,
    person.firstname,
    person.lastname,
    steps,
    COUNT(DISTINCT follower_id) AS follower_count
FROM RecRel
JOIN person ON (RecRel.root_person_id = person.id)
GROUP BY root_person_id, steps, person.id
ORDER BY root_person_id ASC, steps ASC

