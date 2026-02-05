-- EXERCICIO 1

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

-- VIEWS 
SELECT * FROM atleta;
SELECT nome, qtdMedalha FROM atleta;
SELECT * FROM atleta WHERE modalidade = 'boliche';
SELECT * FROM atleta ORDER BY modalidade;
SELECT * FROM atleta ORDER BY modalidade DESC;
SELECT * FROM atleta WHERE nome LIKE '%s%';
SELECT * FROM atleta WHERE nome LIKE 'k%';
SELECT * FROM atleta WHERE nome LIKE '%o';
SELECT * FROM atleta WHERE nome LIKE '%r_';

-- DELETE 
DROP TABLE atleta;

-- EXERCICIO 2

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

-- VIEWS       
SELECT * FROM musica;
SELECT titulo, artista FROM musica;
SELECT * FROM musica WHERE genero = 'rock';
SELECT titulos FROM musica WHERE artista = '7minutoz';
SELECT * FROM musica ORDER BY titulo;
SELECT * FROM musica ORDER BY artista DESC;
SELECT * FROM musica WHERE titulo LIKE 'r%';
SELECT * FROM musica WHERE artista LIKE '7%';
SELECT * FROM musica WHERE genero LIKE '_o%';
SELECT * FROM musica WHERE titulo LIKE '%e_';

-- DELETE 
DROP TABLE musica;

-- EXERCÍCIO 3

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
      
-- VIEWS
SELECT * FROM filme;
SELECT titulo, diretor FROM filme;
SELECT * FROM filme WHERE genero = 'comedia';
SELECT * FROM filme WHERE diretor = 'bob';
SELECT * FROM filme ORDER BY titulo;
SELECT * FROM filme ORDER BY diretor DESC;
SELECT * FROM filme WHERE titulo LIKE 'c%';
SELECT * FROM filme WHERE diretor LIKE '%h';
SELECT * FROM filme WHERE genero LIKE '_o%';
SELECT * FROM filme WHERE titulo LIKE '%o_';

-- DELETE
DROP TABLE filme;

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
      
-- VIEWS
SELECT * FROM professor;
SELECT especialidade FROM professor;
SELECT * FROM professor WHERE especialidade = 'fisica';
SELECT * FROM professor ORDER BY nome;
SELECT * FROM professor ORDER BY dtNasc DESC;
SELECT * FROM professor WHERE nome LIKE 'm%';
SELECT * FROM professor WHERE nome LIKE '%s';
SELECT * FROM professor WHERE nome LIKE '_a%';
SELECT * FROM professor WHERE nome LIKE '%i_';

-- DELETE
DROP TABLE professor;

-- EXERCÌCIO 5

-- ESTRUTURA
CREATE DATABASE IF NOT EXISTS sprint1;
USE Sprint1;
CREATE TABLE jogo(
idJogo INT PRIMARY KEY NOT NULL,
nome VARCHAR(50),
comentario VARCHAR(200),
ranking INT
);
INSERT INTO jogo(idJogo, nome, comentario, ranking)
VALUES(1, 'minecraft', 'quadrado', 1),
	  (2, 'dark souls', 'profundo', 2),
      (3, 'terraria', 'bom demais', 3),
      (4, 'overcooked', 'estresse puro', 4),
      (5, 'subnautica', 'bem molhado', 5);
      
-- VIEWS
SELECT * FROM jogo;
SELECT nome FROM jogo;
SELECT comentario FROM jogo WHERE nome = 'minecraft';
SELECT * FROM jogo ORDER BY nome;
SELECT * FROM jogo ORDER BY ranking DESC;
SELECT * FROM jogo WHERE nome LIKE 'm%';
SELECT * FROM jogo WHERE nome LIKE '%a';
SELECT * FROM jogo WHERE nome LIKE '_v%';
SELECT * FROM jogo WHERE nome LIKE '%c_';

-- DELETE
DROP TABLE professor;