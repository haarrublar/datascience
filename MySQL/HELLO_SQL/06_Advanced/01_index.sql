-- The indexes allow the db identify the variables/columns more quickly.
CREATE INDEX idx_name ON users(name);

CREATE UNIQUE INDEX idx_name ON users(name);

CREATE INDEX idx_name_surname ON users(name,surname);

DROP INDEX idx_name ON users;
