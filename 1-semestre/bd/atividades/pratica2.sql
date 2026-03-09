-- EXERCÌCIO 1

-- ESTRUTURA
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
       
-- VIEWS / EDITS

SELECT * FROM atleta;
UPDATE atleta SET qtdMedalha = 3 WHERE idAtleta = 1;
UPDATE atleta SET qtdMedalha = 999 WHERE idAtleta = 2 OR idAtleta = 3 ;
UPDATE atleta SET nome = 'salsicha' WHERE idAtleta = 4;
ALTER TABLE atleta ADD dtNasc DATE;
UPDATE atleta SET dtNasc = '2018-02-20' WHERE idAtleta = 1 OR idAtleta = 2 OR idAtleta = 3 OR idAtleta = 4 OR idAtleta = 5;
DELETE FROM atleta WHERE idAtleta = 5;
SELECT * FROM atleta WHERE modalidade != 'natacao';
SELECT * FROM atleta WHERE qtdMedalha >= 3;
ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(60);
DESC TABLE atleta;
TRUNCATE TABLE atleta;

-- EXERCÌCIO 2

-- ESTRUTURA
CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE TABLE musica(
idMusica INT PRIMARY KEY NOT NULL,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);
INSERT INTO musica(idMusica, titulo, artista, genero)
VALUES (1, 'rap do sasuke', '7minutoz', 'geek'),
	   (2, 'rap do naruto', '7minutoz', 'geek'),
       (3, 'in bloom', 'nirvana', 'rock'),
       (4, 'one', 'metallica', 'rock'),
       (5, 'infinita highway', 'engenheiros do hawaii', 'mpb'),
       (6, 'malandragem', 'casssia eller', 'mpb'),
       (7, 'fatalmente', 'menos e mais', 'pagode');
       
-- VIEWS / EDITS

SELECT * FROM musica;
ALTER TABLE musica ADD curtidas INT;
UPDATE musica SET curtidas = 1 WHERE idMusica = 1 OR idMusica = 2 OR idMusica = 3 OR idMusica = 4 OR idMusica = 5 OR idMusica = 6 OR idMusica = 7;
ALTER TABLE musica MODIFY COLUMN artista VARCHAR(80);
UPDATE musica SET curtidas = 999 WHERE idMusica = 1;
UPDATE musica SET curtidas = 9 WHERE idMusica = 2 OR idMusica = 3;
UPDATE musica SET titulo = 'aaaaaa' WHERE idMusica = 5;
DELETE FROM musica WHERE idMusica = 4;
SELECT * FROM musica WHERE genero != 'funk';
SELECT * FROM musica WHERE curtidas >= 20;
DESC TABLE musica;
TRUNCATE TABLE musica;

-- EXERCÌCIO 3

-- ESTRUTURA
CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE TABLE filme(
idFIlme INT PRIMARY KEY NOT NULL,
titulo VARCHAR(50),
genero VARCHAR(40),
diretor VARCHAR(40)
);
INSERT INTO filme(idFilme, titulo, genero, diretor)
VALUES(1, 'up altas aventuras', 'comedia', 'harry'),
      (2, 'carros', 'aventura', 'bob'),
      (3, 'carros 2', 'aventura', 'bob'),
      (4, 'donnie darko', 'terror', 'chris'),
      (5, 'winx', 'fantasia', 'marrie'),
      (6, 'scooby-doo', 'comedia', 'susan'),
      (7, 'round 6', 'psicologico', 'jack');
      
-- VIEWS / EDITS
SELECT * FROM filme;
ALTER TABLE filme ADD protagonista VARCHAR(50);
UPDATE filme SET protagonista = 'leonidas' WHERE idFilme = 1 OR idFilme = 2 OR idFilme = 3 OR idFilme = 4 OR idFilme = 5 OR idFilme = 6 OR idFilme = 7;
ALTER TABLE filme MODIFY diretor VARCHAR(150);
UPDATE filme SET diretor = 'david' WHERE idFilme = 5;
UPDATE filme SET diretor = 'otis' WHERE idFilme = 2 OR idFilme = 7;
UPDATE filme SET titulo = 'secreto' WHERE idFilme = 6;
DELETE FROM filme WHERE idFilme = 3;
SELECT * FROM filme WHERE genero != 'drama';
SELECT * FROM filme WHERE genero = 'suspense';
DESC TABLE filme;
TRUNCATE TABLE filme;

-- EXERCÌCIO 4

-- ESTRUTURA
CREATE DATABASE IF NOT EXISTS sprint1;
USE Sprint1;
CREATE TABLE professor(
idProfessor INT PRIMARY KEY NOT NULL,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc DATE
);
INSERT INTO professor(idProfessor, nome, especialidade, dtNasc)
VALUES(1, 'matheus', 'matematica', '1999-12-23'),
	  (2, 'matheus', 'fisica', '1999-12-23'),
      (3, 'maria', 'portugues', '2000-11-30'),
      (4, 'carlos', 'biologia', '1987-04-01'),
      (5, 'monique', 'quimica', '1950-06-04');
      
-- VIEWS / EDITS
SELECT * FROM professor;
ALTER TABLE professor ADD funcao ENUM('monitor', 'assistente', 'titular');
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 1 OR idProfessor = 2 OR idProfessor = 3 OR idProfessor = 4 OR idProfessor = 5; 
INSERT INTO professor(idProfessor, nome, especialidade, dtNasc) VALUES (6, 'abc', 'lesma', '2026-01-01');
DELETE FROM professor WHERE idProfessor = 5;
SELECT * FROM professor WHERE funcao = 'titular';
SELECT especialidade, dtNasc FROM professor WHERE funcao = 'monitor';
UPDATE professor SET dtNasc = '2055-01-01' WHERE idProfessor = 3;
TRUNCATE TABLE professor;

-- EXERCÌCIO 5

-- ESTRUTURA
CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE TABLE curso(
idCurso INT PRIMARY KEY NOT NULL,
nome VARCHAR(50),
sigla VARCHAR(3),
coordenador VARCHAR(50)
);
INSERT INTO curso(idCurso, nome, sigla, coordenador) 
VALUES(1, 'ciencia da computacao', 'cco', 'marise'),
       (2, 'analise e desenvolvimento de sistemas', 'ads', 'arthur'),
       (3, 'sistemas da informacao', 'sis', 'carlos');
       
-- VIEWS / EDITS
SELECT * FROM curso;
SELECT coordenador FROM curso;
SELECT * FROM curso WHERE sigla LIKE 'cco';
SELECT * FROM curso ORDER BY nome;
SELECT * FROM curso ORDER BY coordenador DESC;
SELECT * FROM curso WHERE nome LIKE 'c%';
SELECT * FROM curso WHERE nome LIKE '%s';
SELECT * FROM curso WHERE nome LIKE '_n%';
SELECT * FROM curso WHERE nome LIKE '%a_';
DROP TABLE curso;

-- EXERCÍCIO 6

-- ESTRUTURA
CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE TABLE revista(
idRevista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
categoria VARCHAR(30)
);
INSERT INTO revista(nome)
VALUES('veja'), ('folha'), ('grama'), ('telhado');

-- VIEWS / EDITS
SELECT * FROM revista;
UPDATE revista SET categoria = 'teste' WHERE idRevista = 1 OR idRevista = 2 OR idRevista = 3 OR idRevista = 4;
SELECT * FROM revista;
INSERT INTO revista(nome, categoria)
VALUES('visto', 'teste2'), ('terra', 'teste2'), ('ar', 'teste2');
SELECT * FROM revista;
DESC TABLE revista;
ALTER TABLE revista MODIFY categoria VARCHAR(40);
DESC TABLE revista;
ALTER TABLE revista ADD periodicidade VARCHAR(15);
SELECT * FROM revista;
ALTER TABLE revista DROP COLUMN periodicidade;

-- EXERCÌCIO 7

-- ESTRUTURA
CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE TABLE carro(
idCarro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
placa CHAR(7)
)AUTO_INCREMENT = 1000;
INSERT INTO carro(nome, placa)
VALUES('corsa', '8374652'), ('lancer', '3746573'), ('gol', '7364572'), ('kombi', '3756384');

-- VIEWS / EDITS
SELECT * FROM carro;
INSERT INTO carro(nome)
VALUES('corsab'), ('lancerb'), ('golb');
SELECT * FROM carro;
DESC TABLE carro;
ALTER TABLE carro MODIFY nome VARCHAR(28);
DESC TABLE carro;
ALTER TABLE carro ADD ano CHAR(4);
UPDATE carro SET placa = '1234567' WHERE idCarro = 1004 OR idCarro = 1005 OR idCarro = 1006;
UPDATE carro SET ano = '2026' WHERE idCarro = 1000 OR idCarro = 1001 OR idCarro = 1002 OR idCarro = 1003 OR idCarro = 1004 OR idCarro = 1005 OR idCarro = 1006;