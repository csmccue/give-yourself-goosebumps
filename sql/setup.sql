-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS pages CASCADE;
DROP TABLE IF EXISTS options CASCADE;

CREATE TABLE users (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email VARCHAR,
  password_hash VARCHAR NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL
);

CREATE TABLE books (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR
);

CREATE TABLE pages (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  book_id BIGINT,
  text VARCHAR,
FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE options (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  page_id BIGINT,
  target_page BIGINT,
  text VARCHAR,
FOREIGN KEY (page_id) REFERENCES pages(id)
FOREIGN KEY (target_page) REFERENCES pages(id)
);

INSERT INTO books (
  title
)
VALUES
('Escape from the Carnival of Horrors');

INSERT INTO pages (
  book_id,
  text
)
VALUES
('1', 'Connor goes to the supermarket to buy some peanut butter and sees some Amish people'),
('1', 'The Amish folk invite Connor to join their culture'),
('1', 'The Amish attack Connor for insulting their culture');

INSERT INTO options (
  page_id,
  target_page,
  text
)
VALUES 
('1', '2', 'Connor tips his hat towards the Amish people and declares his love of carpentry'),
('1', '3', 'Connor flips out his Razor phone and takes a video of the Amish losers');






