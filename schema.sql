-- Add your create table query as per instruction.

CREATE TABLE genre (
  id INT,
  name varchar(100),
  PRIMARY KEY (id),
);

CREATE TABLE musicalbum (
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    on_spotify BOOLEAN,
    archived BOOLEAN,
    genre_id INT,
    PRIMARY KEY(id)
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id),
);

CREATE TABLE games (
  id INT PRIMARY KEY,
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  archived BOOLEAN,
  author VARCHAR(255),
  FOREIGN KEY (author) REFERENCES author (id)
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors (id)
);

CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);