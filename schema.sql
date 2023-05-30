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
    genre_id INT,
    PRIMARY KEY(id)
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id),
);