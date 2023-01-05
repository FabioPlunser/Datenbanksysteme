CREATE TABLE IF NOT EXISTS title_ratings(
    tconst TEXT NOT NULL,
    averageRating FLOAT,
    numVotes INT,
    PRIMARY KEY (tconst)
) 