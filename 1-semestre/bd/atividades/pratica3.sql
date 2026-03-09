-- Exercício 1 - Loja de jogos
CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE table jogo(
id_jogo INT PRIMARY KEY AUTO_INCREMENT,
nome_jogo VARCHAR(30),
diretor_jogo VARCHAR(30),
genero_jogo VARCHAR(30),
data_lancamento DATE,
nota_jogo INT, 
quantidade INT
);
-- 1. Insira pelo menos 5 registros para a tabela.
INSERT INTO jogo (nome_jogo, diretor_jogo, genero_jogo, data_lancamento, nota_jogo, quantidade)
VALUES('Forza Horizon 5', 'Adrian', 'corrida', '2019-03-05', 8, 43),
	  ('Dark Souls', 'Adriano', 'fantasia', '2019-07-11', 9, 48),
      ('Minecraft', 'Notch', 'aventura', '2023-05-22', 10, 234),
      ('Hytale', 'Alex', 'aventura', '2026-05-22', 9, 456),
      ('Stardew Valley', 'Barone', 'simulador', '2020-12-25', 10, 633);
-- 2. Altere a tabela para inserir uma coluna que represente o tipo de mídia que
-- deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.
ALTER TABLE jogo ADD COLUMN tipo_midia ENUM('fisica', 'digital');
-- 3. Atualize os registros dos jogos inseridos anteriormente.
UPDATE jogo SET tipo_midia = 'digital' WHERE id_jogo IN (1,2,3,4,5);
-- 4. Exiba apenas os jogos com data de lançamento a partir de 2015.
SELECT nome_jogo, data_lancamento FROM jogo WHERE data_lancamento > '2015-01-01';
-- 5. Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.
SELECT nome_jogo FROM jogo WHERE nome_jogo LIKE '%a%' AND tipo_midia = 'fisica';
-- 6. Exiba os jogos onde o nome do diretor não contenha a letra “e”.
SELECT nome_jogo FROM jogo WHERE diretor_jogo != '%e%';
-- 7. Altere a tabela para criar uma checagem na inserção da nota, onde o valor
-- não pode ser menor que 0 e nem maior que 10.
ALTER TABLE jogo ADD CONSTRAINT checar_nota CHECK (nota_jogo BETWEEN 0 AND 10);
-- 8. Exiba os jogos de um determinado gênero e que ainda esteja em estoque.
SELECT nome_jogo FROM jogo WHERE quantidade > 0;
-- 9. Exclua os jogos que não têm mais unidades disponíveis em estoque.
DELETE FROM jogo WHERE quantidade < 1;
-- 10. Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da
-- tabela
ALTER TABLE jogo RENAME COLUMN diretor_jogo TO criador_jogo;
DESC jogo;
explain
SELECT * FROM jogo WHERE genero_jogo = 'aventura';
CREATE INDEX teste ON jogo(genero_jogo);
-- Exercício 2 - Esportes Olímpicos 
CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE TABLE olimpiadas(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(40),
categoria ENUM('individual', 'coletivo'),
numero_jogadores INT,
estreia DATE,
pais_origem VARCHAR(30)
);
-- 1. Insira pelo menos 5 registros na tabela.
INSERT INTO olimpiadas(nome, categoria, numero_jogadores, estreia, pais_origem)
VALUES('skate', 'individual', 1, '2019-08-16', 'Estados Unidos'),
	  ('snowboarding', 'individual', 1, '2017-08-16', 'Canada'),
      ('natacao', 'individual', 1, '2000-04-20', 'Franca'),
      ('judo', 'individual', 2, '2001-01-13', 'China'),
      ('futebol', 'coletivo', 11, '2000-08-16', 'Inglaterra');
-- 2. Altere a tabela para adicionar uma coluna popularidade que armazene a
-- popularidade do esporte como um valor decimal entre 0 e 10 e exiba como
-- ficou a estrutura da tabela.
ALTER TABLE olimpiadas ADD COLUMN popularidade INT;
ALTER TABLE olimpiadas ADD CONSTRAINT checagem_popularidade CHECK (popularidade BETWEEN 0 AND 10);
-- 3. Atualize os registros para definir a popularidade dos esportes inseridos
-- anteriormente.
UPDATE olimpiadas SET popularidade = 10 WHERE id IN (1,2,3,4,5);
UPDATE olimpiadas SET popularidade = 9 WHERE id IN (3,4);
UPDATE olimpiadas SET popularidade = 8 WHERE id IN (5);
-- 4. Exiba os esportes ordenados por popularidade em ordem crescente.
SELECT nome, popularidade FROM olimpiadas ORDER BY popularidade; 
-- 5. Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano
-- 2000.
SELECT nome FROM olimpiadas WHERE estreia > '2000-01-01';
-- 6. Crie uma checagem para que não possa ser inserido valores dentro de
-- estreia que seja menor que 06 de abril de 1896 e depois da data atual.
ALTER TABLE olimpiadas ADD CONSTRAINT checar_data CHECK (estreia BETWEEN '1896-04-16' AND '2026-02-14');
-- 7. Altere a tabela para excluir a regra de inserção de categoria, assim
-- podendo colocar valores além de "Individual" ou "Coletivo".
ALTER TABLE olimpiadas MODIFY COLUMN categoria VARCHAR(30);
-- 8. Exiba apenas os esportes cujo nome do país de origem tenha "a" na
-- segunda letra.
SELECT nome, pais_origem FROM olimpiadas WHERE pais_origem LIKE '_a%';
-- 9. Exiba os dados onde o número de jogadores por equipe esteja entre 4 e 11.
SELECT nome, numero_jogadores FROM olimpiadas WHERE numero_jogadores BETWEEN 4 AND 11;
-- 10. Remova os registros onde id seja 1, 3 e 5
DELETE FROM olimpiadas WHERE id IN (1,3,5);

-- Exercício 3 - Desenhos animados
CREATE DATABASE IF NOT EXISTS sprint1;
USE sprint1;
CREATE TABLE desenho_animado(
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(50),
dt_lancamento DATE,
emissora_original VARCHAR(50),
classificacao_indicativa INT,
status_desenho VARCHAR(15),
nota INT
)AUTO_INCREMENT = 10;

INSERT INTO desenho_animado
(titulo, dt_lancamento, emissora_original, classificacao_indicativa, status_desenho, nota)
VALUES ('Apenas um Show', '2010-09-06', 'Cartoon Network', 10, 'Encerrado', 9),
	   ('Hora de Aventura', '2010-04-05', 'Cartoon Network', 10, 'Encerrado', 10),
       ('Bob Esponja', '1999-05-01', 'Nickelodeon', 0, 'Em Exibicao', 8),
       ('Os Simpsons', '1989-12-17', 'Fox', 12, 'Em Exibicao', 10),
       ('Dragon Ball Z', '1989-04-26', 'Fuji TV', 10, 'Encerrado', 9),
       ('Ben 10', '2005-12-27', 'Cartoon Network', 10, 'Encerrado', 8),
       ('Jovens Titãs', '2003-07-19', 'Cartoon Network', 10, 'Encerrado', 9),
       ('Gravity Falls', '2012-06-15', 'Disney Channel', 10, 'Encerrado', 10),
       ('Rick and Morty', '2013-12-02', 'Adult Swim', 16, 'Em Exibicao', 9),
       ('Naruto', '2002-10-03', 'TV Tokyo', 12, 'Encerrado', 8),
       ('Cavaleiros do Zodiaco', '1986-10-11', 'TV Asahi', 10, 'Encerrado', 9),
       ('Pica-Pau', '1940-11-25', 'Universal Pictures', 0, 'Encerrado', 8),
       ('Tom e Jerry', '1940-02-10', 'CBS', 0, 'Encerrado', 10);

-- 1. Exibir todos os dados da tabela
SELECT * FROM desenho_animado;
-- 2. Exibir todos os desenhos com a classificação menor ou igual a 14 anos
SELECT titulo, classificacao_indicativa FROM desenho_animado  WHERE classificacao_indicativa <= 14;
-- 3. Exibir todos os desenhos de uma mesma emissora original
SELECT titulo, emissora_original FROM desenho_animado WHERE emissora_original = 'Cartoon Network';
-- 4. Modificar o campo status, para que aceite apenas o status 'exibindo',
-- 'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra
-- foi aplicada
UPDATE desenho_animado SET status_desenho = 'exibindo' WHERE id IN (10,11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24);
ALTER TABLE desenho_animado MODIFY COLUMN status_desenho ENUM('exibindo', 'finalizado', 'cancelado');
-- 5. Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID
UPDATE desenho_animado SET status_desenho = 'finalizado' WHERE id IN (10, 11);
-- 6. Deletar a linha do desenho de ID 12
DELETE FROM desenho_animado WHERE id = 12;
-- 7. Exibir apenas os desenhos que comecem com uma determinada letra
SELECT * FROM desenho_animado WHERE titulo LIKE 'A%';
-- 8. Renomear a coluna classificacao para classificacaoIndicativa
ALTER TABLE desenho_animado RENAME COLUMN classificacao_indicativa TO classificacaoIndicativa;
-- 9. Atualizar a nota e data de lançamento do desenho de ID 11
UPDATE desenho_animado SET nota = 10, dt_lancamento = '2000-04-04' WHERE id = 11;
-- 10. Limpe todos os dados da tabela
TRUNCATE TABLE desenho_animado;
-- 11. Remover a regra do status do desenho
ALTER TABLE desenho_animado MODIFY COLUMN status_desenho VARCHAR(30);

-- Exercício 4 - Dispensa do Scooby-Doo
CREATE DATABASE IF NOT EXISTS sprint1 ;
USE sprint1;
CREATE TABLE estoque(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(30),
dt_compra DATE,
preco DECIMAL,
peso_grama INT,
dt_retirada DATE  
);
      
-- 1. Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes.
-- Por agora, não preencha a coluna referente a "data de retirada".
INSERT INTO estoque(nome, dt_compra, preco, peso_grama)
VALUES('biscoito-scooby', '2026-01-04', 30.00, 1000),
      ('pao', '2026-02-04', 15.00, 500),
      ('presunto','2026-01-06', 23.00, 700),
      ('queijo','2026-01-20', 34.00, 700),
      ('toomate', '2026-02-05', 13.00, 1000);
-- 2. Verifique se os valores foram inseridos corretamente.
SELECT * FROM estoque;
-- 3. Exiba os nomes, as datas de compra e retirada e o id dos alimentos
-- ordenados a partir da data de compra mais antiga.
SELECT id, nome, dt_compra, dt_retirada FROM estoque ORDER BY dt_compra;
-- 4. Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa
-- de “Biscoitos Scooby” que foi comprada a mais tempo.
SELECT * FROM estoque WHERE nome = 'biscoito-scooby' ORDER BY dt_compra ASC LIMIT 1;
UPDATE estoque SET dt_retirada = '2026-02-12' WHERE id = 1;
-- 5. Altere o nome da coluna id para idComida.
ALTER TABLE estoque RENAME COLUMN id TO idComida;
-- 6. Altere o tipo do check para que os alimentos só possam ser “Biscoitos
-- Scooby” ou “Cachorro-quente”.
UPDATE estoque SET nome = 'biscoito-scooby' WHERE idComida IN (1,2,3,4,5);
ALTER TABLE estoque ADD CONSTRAINT check_comida CHECK (nome = 'biscoito-scooby' OR 'cachorro-quente');
-- 7. Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o
-- nome das colunas dataCompra apareça como "data da compra" e
-- dataRetirada apareça como "data da retirada".
SELECT nome, dt_compra AS 'data da compra', dt_retirada AS 'data da retirada' FROM estoque;
-- 8. Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024.
SELECT idComida, nome, dt_compra FROM estoque WHERE dt_compra < '2024-07-24';
-- 9. Exiba os alimentos que possuem um preço acima ou igual a 30.50.
SELECT idComida, nome, preco FROM estoque WHERE preco > 30.5;
-- 10. Limpe a tabela.
TRUNCATE TABLE estoque;

 -- Exercício 5 - Heróis
CREATE DATABASE IF NOT EXISTS sprint1 ;
USE sprint1;
CREATE TABLE vingadores(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(45),
versao VARCHAR(45),
habilidade VARCHAR(40),
altura INT
); 
INSERT INTO vingadores(nome ,versao, habilidade, altura)
VALUES('hulk', 'o incrivel hulk', 'super força e resistencia', 300),
	  ('capitão américa', 'vingadores 1', 'resistencia', 190),
      ('homem de ferro', 'homem de ferro 1', 'inteligencia', 180),
      ('thor', 'vingadores 1', 'deus', 183);
-- 1. Exiba os dados inseridos na tabela
SELECT * FROM vingadores;
-- 2. Adicione um campo de regeneração, onde ele aceitará apenas os valores
-- booleanos de TRUE ou FALSE.
ALTER TABLE vingadores ADD COLUMN regeneracao BOOLEAN;
-- 3. Modifique o campo versão para aceitar até 100 caracteres.
ALTER TABLE vingadores MODIFY COLUMN versao VARCHAR(100);
-- 4. Remova o herói de id 3 pois ele se morreu em batalha.
DELETE FROM vingadores WHERE id = 3;
-- 5. Chegou reforços, insira um novo herói para a equipe.
INSERT INTO vingadores(nome ,versao, habilidade, altura)
VALUES('gavião arqueiro', 'vingadores 2', 'precisão', 175);
-- 6. Exiba todos os dados inseridos na tabela onde o nome do herói começa
-- com “C” ou “H”.
SELECT * FROM vingadores WHERE nome LIKE 'c%' OR nome LIKE'h%';
-- 7. Exiba todos os dados inseridos na tabela onde o nome do herói não contém
-- a letra “A” no campo nome.
SELECT * FROM vingadores WHERE nome NOT LIKE '%a%';
-- 8. Exiba apenas o nome do herói onde a altura for maior que 190.
SELECT * FROM vingadores WHERE altura > 190;
-- 9. Exiba todos os dados da tabela de forma decrescente pelo nome onde a
-- altura do herói for maior que 180.
SELECT * FROM vingadores WHERE altura > 180 ORDER BY nome DESC;
-- 10. Limpe os dados da tabela.
TRUNCATE TABLE vingadores;