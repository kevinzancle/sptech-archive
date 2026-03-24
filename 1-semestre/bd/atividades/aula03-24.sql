CREATE DATABASE IF NOT EXISTS sprint2;
USE sprint2;

CREATE TABLE funcionario(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
cargo VARCHAR(45) NOT NULL,
nome VARCHAR(45) NOT NULL,
dt_nasc DATE,
fk_chefe INT,
FOREIGN KEY (fk_chefe) REFERENCES funcionario(id)
);

INSERT INTO funcionario(cargo, nome ,dt_nasc, fk_chefe)
VALUES ('Presidente', 'Alessandro', '2000-12-12', NULL),
	   ('Diretor', 'Vera', '2000-12-12', 1),
       ('Diretor', 'Gerson', '2000-12-12', 2),
       ('Coordenador', 'Alex', '2000-12-12', 3),
       ('Professor', 'Rosim', '2000-12-12', 4);