CREATE TABLE IF NOT EXISTS title_ratings(
    titleId TEXT NOT NULL,
    averageRating FLOAT,
    numVotes INT,
    PRIMARY KEY (titleId)
) 