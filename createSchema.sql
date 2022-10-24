DROP TABLE IF EXISTS statements2topics;
DROP TABLE IF EXISTS statements;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS pairings;


CREATE TABLE statements(
        id              INTEGER
    ,   text            TEXT NOT NULL
    ,   isTrue          BOOLEAN
    ,   explanenation   TEXT
    ,   replacedBy      INTEGER
	,	PRIMARY KEY (id)
    ,	FOREIGN KEY (replacedBy) REFERENCES statements(id)
	,	CHECK (isTrue IN (0, 1))	
);


CREATE TABLE topics(
		id		INTEGER
	,	name	TEXT UNIQUE
	,	about	TEXT
	,	PRIMARY KEY (id)
);


CREATE TABLE statements2topics(
		statement	INTEGER
	,	topic		INTEGER
	,	PRIMARY KEY (statement, topic)
	,	FOREIGN KEY (statement) REFERENCES statements(id)
	,	FOREIGN KEY (topic) REFERENCES topics(id)
);


CREATE TABLE pairings(
		statement 	INTEGER
	,	pairedWith	INTEGER
	,	PRIMARY KEY (statement, pairedWith)
	, 	FOREIGN KEY (statement) REFERENCES statements(id)
	,	FOREIGN KEY (pairedWith) REFERENCES statements(id)
);

