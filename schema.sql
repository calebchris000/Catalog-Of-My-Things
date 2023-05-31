-- Add your create table query as per instruction.
















CREATE TABLE label (
    id INT,
    color VARCHAR(50),
    label_id INT PRIMARY KEY (id)
)

CREATE TABLE book (
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    publisher VARCHAR(120) 
    PRIMARY KEY (id) 
    CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES label(id)
) 