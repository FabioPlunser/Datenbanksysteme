CREATE TABLE IF NOT EXISTS nation(
    nation_id UUID NOT NULL DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    flag VARCHAR(255) NOT NULL,
    PRIMARY KEY(nation_id)
);

CREATE TABLE IF NOT EXISTS team(
    team_id UUID NOT NULL DEFAULT gen_random_uuid(),
    nation_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(team_id),
    FOREIGN KEY(nation_id) REFERENCES nation(nation_id)

);

CREATE TABLE IF NOT EXISTs athlete(
    athlete_id UUID NOT NULL DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(athlete_id)
);

CREATE TABLE IF NOT EXISTS event(
    event_id UUID NOT NULL DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    is_team_event BOOLEAN NOT NULL,
    PRIMARY KEY(event_id)
);

CREATE TABLE IF NOT EXISTS participates(
    athlete_id UUID NOT NULL,
    event_id UUID NOT NULL,
    team_id UUID NOT NULL,
    rank INT NOT NULL,
    PRIMARY KEY(athlete_id, event_id, team_id),
    FOREIGN KEY(athlete_id) REFERENCES athlete(athlete_id),
    FOREIGN KEY(event_id) REFERENCES event(event_id),
    FOREIGN KEY(team_id) REFERENCES team(team_id)
);

CREATE TABLE IF NOT EXISTS is_part_of(
    athlete_id UUID NOT NULL,
    team_id UUID NOT NULL,
    PRIMARY KEY(athlete_id, team_id),
    FOREIGN KEY(athlete_id) REFERENCES athlete(athlete_id),
    FOREIGN KEY(team_id) REFERENCES team(team_id)
);