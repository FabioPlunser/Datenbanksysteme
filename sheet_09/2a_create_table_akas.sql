CREATE TABLE IF NOT EXISTS title_akas (
    titleId TEXT NOT NULL,
    ordering INT NOT NULL,
    title TEXT,
    region TEXT,
    language TEXT,
    types TEXT,
    attributes TEXT ARRAY,
    isOriginalTitle BOOLEAN,
    PRIMARY KEY (titleId, ordering)
) 