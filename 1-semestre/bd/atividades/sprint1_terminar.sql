CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE TABLE atleta(
idAtleta INT PRIMARY KEY NOT NULL,
nome VARCHAR(40),
modalidade VARCHAR(40),
qtdMedalha INT 
);
INSERT INTO atleta(idAtleta, nome, modalidade, qtdMedalha)
VALUES (1, 'kevin', 'boliche', 1),
       (2, 'arthur', 'futebol', 5),
       (3,'vinicius', 'boliche', 3),
       (4, 'matheus', 'futebol', 2),
       (5, 'thomas', 'golfe', 6);

-- VIEWS 
SELECT * FROM atleta;
SELECT nome, qtdMedalha FROM atleta;
SELECT * FROM atleta WHERE modalidade = boliche;
SELECT * FROM atleta ORDER BY modalidade;
SELECT * FROM atleta ORDER BY modalidade DESC;
SELECT * FROM atleta WHERE nome LIKE '%s%';
SELECT * FROM atleta WHERE nome LIKE 'k%';
SELECT * FROM atleta WHERE nome LIKE '%o';
SELECT * FROM atleta WHERE nome LIKE '%r_';

-- DELETE 
DROP TABLE atleta;