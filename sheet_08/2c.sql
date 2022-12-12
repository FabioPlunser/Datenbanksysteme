INSERT INTO nation(nation_id, name, flag) VALUES
    ( gen_random_uuid(), 'Austria', 'flag1'),
    ( gen_random_uuid(), 'Germany', 'flag2'),
    ( gen_random_uuid(), 'USA', 'flag3');

INSERT INTO team(team_id, nation_id, name) VALUES
    (gen_random_uuid(), (SELECT nation_id from nation where name = 'Austria'), 'team1'),
    (gen_random_uuid(), (SELECT nation_id from nation where name = 'Germany'), 'team2'),
    (gen_random_uuid(), (SELECT nation_id from nation where name = 'USA'), 'team3');

INSERT INTO athlete(athlete_id, name, age) VALUES 
    -- create 21 athletes
    (gen_random_uuid(), 'athlete1', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete2', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete3', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete4', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete5', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete6', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete7', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete8', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete9', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete10', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete11', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete12', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete13', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete14', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete15', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete16', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete17', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete18', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete19', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete20', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete21', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete22', (SELECT floor(random() * 45 + 1))),
    (gen_random_uuid(), 'athlete23', (SELECT floor(random() * 45 + 1)));

INSERT INTO is_part_of(athlete_id, team_id) VALUES 
    





        
        