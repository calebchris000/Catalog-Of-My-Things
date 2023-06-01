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
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors (id)
);

CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE label (
    id INT,
    title VARCHAR(150),
    color VARCHAR(50),
    PRIMARY KEY (id),
)

CREATE TABLE book (
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    publisher VARCHAR(120),
    cover_state VARCHAR(50),
    archived BOOLEAN,
    label_id INT, 
    PRIMARY KEY (id), 
    CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES label(id)
) 

CREATE INDEX idx_book_label_id ON book (label_id);
CREATE INDEX idx_musicalbum_genre_id ON musicalbum (genre_id);
CREATE INDEX idx_games_author_id ON games (author_id);
