DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS things;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20)
);
CREATE TABLE things(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20),
    description TEXT,
    "userId" INTEGER REFERENCES users(id);
);

INSERT INTO users(name) VALUES ('moe');
INSERT INTO users(name) VALUES ('kenny');
INSERT INTO users(name) VALUES ('joe');
INSERT INTO users(name) VALUES ('merry');
INSERT INTO users(name) VALUES ('curly');

INSERT INTO things(name, "userId", description) VALUES ('foo', 1, 'foo description');
INSERT INTO things(name, "userId", description) VALUES ('bar', 1, 'bar description');
INSERT INTO things(name, "userId", description) VALUES ('baz', 1, 'baz description');
