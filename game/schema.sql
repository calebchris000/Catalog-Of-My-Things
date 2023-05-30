CREATE TABLE game (
  id INT PRIMARY KEY,
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  archived BOOLEAN,
  author VARCHAR(255),
  FOREIGN KEY (author) REFERENCES author (id)
);

CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
