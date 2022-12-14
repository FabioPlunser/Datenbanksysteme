CREATE TABLE IF NOT EXISTS nation(
    nation_id UUID NOT NULL DEFAULT gen_random_uuid(),
    nation_name VARCHAR(255) NOT NULL,
    flag VARCHAR(255) NOT NULL,
    PRIMARY KEY(nation_id)
);

CREATE TABLE IF NOT EXISTS team(
    team_id UUID NOT NULL DEFAULT gen_random_uuid(),
    nation_id UUID NOT NULL,
    team_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(team_id),
    FOREIGN KEY(nation_id) REFERENCES nation(nation_id)

);

CREATE TABLE IF NOT EXISTs athlete(
    athlete_id UUID NOT NULL DEFAULT gen_random_uuid(),
    athlete_name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(athlete_id)
);

-- change name from event to competition because event is a sql keyword
CREATE TABLE IF NOT EXISTS competition(
    competition_id UUID NOT NULL DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    is_team_competition BOOLEAN NOT NULL,
    PRIMARY KEY(competition_id)
);

CREATE TABLE IF NOT EXISTS participatesTeamcompetition(
    competition_id UUID NOT NULL,
    team_id UUID NOT NULL,
    rank INT NOT NULL,
    PRIMARY KEY(competition_id, team_id),
    FOREIGN KEY(competition_id) REFERENCES competition(competition_id),
    FOREIGN KEY(team_id) REFERENCES team(team_id)
);

create table if not exists participatesIndividualcompetition(
    competition_id UUID NOT NULL,
    athlete_id UUID NOT NULL,
    rank INT NOT NULL,
    PRIMARY KEY(competition_id, athlete_id),
    FOREIGN KEY(competition_id) REFERENCES competition(competition_id),
    FOREIGN KEY(athlete_id) REFERENCES athlete(athlete_id)
);

CREATE TABLE IF NOT EXISTS is_part_of(
    athlete_id UUID NOT NULL,
    team_id UUID NOT NULL,
    PRIMARY KEY(athlete_id, team_id),
    FOREIGN KEY(athlete_id) REFERENCES athlete(athlete_id),
    FOREIGN KEY(team_id) REFERENCES team(team_id)
);