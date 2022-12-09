-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS book_one;

CREATE TABLE users (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email VARCHAR,
  password_hash VARCHAR NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL
);

CREATE TABLE book_one (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  text VARCHAR,
  choices VARCHAR,
);

INSERT INTO book_one (
  id,
  text,
  choices
)

VALUES
('Connor goes to the store and sees a group of Amish people', [{2, 'does Connor take shirt off, go to PAGE 2'},{3, 'does Connor tip his hat towards the Amish, go to PAGE 3'}]),
('Connor took his shirt off and the Amish ran away', [{4, 'uh oh here we go again...'}]),
('The Amish are satisfied with Connor', [{5, 'Connor rizzes up the Amish that walk up to him but does not join the Amish culture'},{6, 'Connor decides to join the Amish culture'}]);