INSERT INTO nation(nation_id, nation_name, flag) VALUES
    ( gen_random_uuid(), 'Austria', 'flag1'),
    ( gen_random_uuid(), 'Germany', 'flag2'),
    ( gen_random_uuid(), 'USA', 'flag3');

INSERT INTO team(team_id, nation_id, team_name) VALUES
    (gen_random_uuid(), (SELECT nation_id from nation where nation_name = 'Austria'), 'team1'),
    (gen_random_uuid(), (SELECT nation_id from nation where nation_name = 'Germany'), 'team2'),
    (gen_random_uuid(), (SELECT nation_id from nation where nation_name = 'USA'), 'team3');

INSERT INTO athlete(athlete_id, athlete_name, age) VALUES 
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
    ((SELECT athlete_id from athlete where athlete_name = 'athlete1'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete2'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete3'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete4'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete5'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete6'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete7'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete8'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete9'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete10'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete11'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete12'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete13'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete14'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete15'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete16'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete17'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete18'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete19'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete20'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete21'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete22'), (SELECT team_id from team where team_name = 'team1')),
    ((SELECT athlete_id from athlete where athlete_name = 'athlete23'), (SELECT team_id from team where team_name = 'team1'));





        
        