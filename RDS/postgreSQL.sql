-- psql -d acme_db_2208 -f seed.sql 
DROP TABLE IF EXISTS things;
DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  name VARCHAR(20),
  programming_level INTEGER DEFAULT 3
);

CREATE TABLE things(
  id INTEGER PRIMARY KEY,
  name VARCHAR(20),
  user_id INTEGER REFERENCES users(id)
);

INSERT INTO users(id, name, programming_level) VALUES(1, 'moe', 2);
INSERT INTO users(id, name, programming_level) VALUES(2, 'lucy', 5);
INSERT INTO users(id, name) VALUES(3, 'ethyl');
INSERT INTO users(id, name) VALUES(4, 'fred');

INSERT INTO things(id, name, user_id) VALUES(1, 'foo', 1);
INSERT INTO things(id, name, user_id) VALUES(2, 'bar', 1);
INSERT INTO things(id, name, user_id) VALUES(3, 'bazz', 2);
INSERT INTO things(id, name) VALUES(4, 'quq');

SELECT *
FROM users
WHERE programming_level > 3;

SELECT users.name as user_name, things.name as thing_name 
FROM things LEFT JOIN users
ON users.id = things.user_id;

SELECT users.name as user_name, things.name as thing_name 
FROM users RIGHT JOIN things 
ON users.id = things.user_id;

SELECT users.name as user_name, things.name as thing_name 
FROM users
LEFT JOIN things
ON things.user_id = users.id;

SELECT *
FROM things;

SELECT count(*), users.name
FROM things
JOIN users
ON users.id = things.user_id
GROUP BY user_id, users.name;
