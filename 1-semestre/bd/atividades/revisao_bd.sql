-- Revisão 1ª Sprint – Banco de Dados
-- 1. Crie o banco de dados chamado ARENA_PERFORMANCE.
CREATE DATABASE ARENA_PERFORMANCE;
-- 2. Coloque o banco ARENA_PERFORMANCE em uso.
USE ARENA_PERFORMANCE;
-- 3. Crie uma tabela chamada modalidades apenas com nome (VARCHAR(45)). Não defina
-- PK.
CREATE TABLE modalidades(
nome VARCHAR(45)
);
-- 4. Crie a tabela atletas com nome (VARCHAR(100)) e id_modalidade (INT).
CREATE TABLE atletas(
id_modalidade INT,
nome VARCHAR(100)
);
-- 5. Altere a tabela modalidades para adicionar uma Chave Primária coluna id.
ALTER TABLE modalidades ADD COLUMN id INT PRIMARY KEY;
-- 6. Configure a coluna id da tabela modalidades para ser AUTO_INCREMENT, iniciando a
-- partir do número 100.
ALTER TABLE modalidades MODIFY COLUMN id INT AUTO_INCREMENT;
ALTER TABLE modalidades AUTO_INCREMENT = 100;
-- 7. Adicione uma Chave Primária na coluna id_atleta da tabela atletas.
ALTER TABLE atletas ADD COLUMN id_atleta INT PRIMARY KEY AUTO_INCREMENT;
-- 8. Na tabela atletas, torne a coluna nome obrigatória (NOT NULL).
ALTER TABLE atletas MODIFY COLUMN nome VARCHAR(100) NOT NULL;
-- 9. Adicione uma coluna data_cadastro na tabela atletas com o valor padrão sendo a data
-- e hora
ALTER TABLE atletas ADD COLUMN data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP();
-- 10. Adicione a coluna email com 100 posições na tabela atletas.
ALTER TABLE atletas ADD COLUMN email VARCHAR(100);
-- 11. Adicione a coluna cpf CHAR(11) na tabela atletas, garantindo que ela seja ÚNICA.
ALTER TABLE atletas ADD COLUMN cpf CHAR(11) UNIQUE;
-- 12. Altere o tamanho da coluna nome na tabela modalidades para 100 posições.
ALTER TABLE modalidades MODIFY COLUMN nome VARCHAR(100);
-- 13. Renomeie a coluna id da tabela modalidades para id_modalidade.
ALTER TABLE modalidades RENAME COLUMN id TO id_modalidade;
-- 14. Adicione uma coluna chamada status que aceite apenas os valores 'Ativo' ou 'Inativo'.
ALTER TABLE modalidades ADD COLUMN statuss VARCHAR(8);
ALTER TABLE modalidades ADD CONSTRAINT chk_status CHECK(statuss IN('Ativo', 'Inativo'));
-- 15. Remova a coluna data_cadastro da tabela atletas.
ALTER TABLE atletas DROP COLUMN data_cadastro;
-- 16. Adicione uma coluna genero (CHAR(1)) na tabela atletas.
ALTER TABLE atletas ADD COLUMN genero CHAR(1);
-- 17. Crie uma tabela treinadores com id_treinador (PK), nome e experiencia_anos (INT).
CREATE TABLE treinadores(
id_treinador INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
experiencia_anos INT
);
-- 18. Crie uma coluna na tabela atleta para informar quem é seu treinador
ALTER TABLE atletas ADD COLUMN treinador INT;
-- 19. Adicione as colunas, salario inicial e salario atual na tabela treinadores.
ALTER TABLE treinadores ADD COLUMN salario_inicial FLOAT;
ALTER TABLE treinadores ADD COLUMN salario_atual FLOAT;
-- 20. Altere a tabela treinadores para que os salario não possam ser menor que zero.
ALTER TABLE treinadores ADD CONSTRAINT chk_salario_inicial CHECK(salario_inicial > 0);
ALTER TABLE treinadores ADD CONSTRAINT chk_salario_atual CHECK(salario_atual > 0); -- PODE USAR AND PARA FICAR TUDO EM UMA LINHA
-- ALTER TABLE treinadores ADD CONSTRAINT chk_salario CHECK(salario_atual > 0 AND salario_inicial > 0);
-- 21. Não permita que o salario atual seja menor que o salario inicial
ALTER TABLE treinadores ADD CONSTRAINT chk_diferenca_salarios CHECK(salario_atual > salario_inicial);
-- 22. Renomeie a tabela modalidades para esportes.
RENAME TABLE modalidades TO esportes;
-- 23. Renomeie a tabela atletas para membros.
RENAME TABLE atletas TO membros;
-- 24. Altere o nome da coluna id_modalidade na tabela membros para id_esporte.
ALTER TABLE esportes RENAME COLUMN id_modalidade TO id_esporte;
-- 25. Crie um índice para a coluna nome na tabela membros para acelerar buscas.
CREATE INDEX ix_nome ON membros(nome);
-- 26. insira um treinador sem informar colunas.
DESC treinadores;
INSERT INTO treinadores() VALUES(1, 'casares', 10, 1000);
-- 27. insira três esportes de uma vez.
DESC esportes;
INSERT INTO esportes(nome, statuss) 
VALUES('golfe', 'Ativo'),
      ('hipismo', 'Inativo'),
      ('volei', 'Ativo');
-- 28. insira um membro sem informar colunas.
DESC membros;
INSERT INTO membros() VALUES('julio', 'julio@gmail.com', '23456723234', 'Masculino', 1);
-- 29. insira dois membros vinculados ao esporte 101.
DESC membros;
SELECT * FROM membros;
INSERT INTO membros(id_modalidade, nome, email, cpf, genero, treinador)
VALUES(101, 'joao ninguem', 'joao@email.com', '12345678912', 'M', 1),
      (101, 'maria ninguem', 'maria@email.com', '12345678913', 'F', 2);
-- 30. insira um treinador apenas com nome e experiencia.
DESC treinadores;
INSERT INTO treinadores(nome, experiencia_anos)
VALUES('doria', 12);
-- 31. insira um esporte sem status definido.
INSERT INTO esportes(nome) 
VALUES('futebol');
-- 32. insira um membro apenas com nome.
INSERT INTO membros(nome)
VALUES('felipe ninguem');
-- 33. insira treinador com salario_atual maior que salario_inicial.
DESC treinadores;
INSERT INTO treinadores(nome, experiencia_anos, salario_inicial, salario_atual)
VALUES('kevin', 1, 1000, 1500);
-- 34. insira membro com id_treinador null explicitamente.
INSERT INTO membros(id_modalidade, nome, email, cpf, genero, treinador)
VALUES(101, 'marcos ninguem', 'marcos@email.com', '12245678912', 'M', NULL);
-- 35. insira membro usando null ou default na posição da pk.
DESC membros;
INSERT INTO membros(id_atleta, id_modalidade, nome, email, cpf, genero, treinador)
VALUES(NULL, 101, 'marcelo ninguem', 'marcelo@email.com', '12245638912', 'M', 1);
-- 36. atualize salario_atual onde experiencia_anos seja maior que 5 e menor 10.
UPDATE treinadores SET salario_atual = 15000 WHERE experiencia_anos > 5 AND experiencia_anos < 10;
-- 37. atualize status para 'Ativo' onde id_modalidade seja maior 100 e menor 105.
UPDATE espotes SET statuss = 'Ativo' WHERE id_modalidade > 100 AND id_modalidade < 105;
-- 38. atualize genero para 'F' onde nome inicia com a letra P
UPDATE membros SET genero = 'F' WHERE nome LIKE'P%';
-- 39. atualize salario_atual onde salario_atual > 8000.
UPDATE treinadores SET salario_atual = 8500 WHERE salario_atual > 8000;
-- 40. atualize experiencia_anos para 20 onde experiencia_anos < 3.
UPDATE treinadores SET experiencia_anos = 20 WHERE experiencia_anos < 3;
-- 41. atualize id_esporte para 100 onde id_esporte seja 101 ou 102.
UPDATE esportes SET id_esporte = 100 WHERE id_esportre = 101 OR id_esporte = 102;
-- 42. atualize email onde id_atleta esteja entre 1 e 10.
UPDATE membros SET email = 'email@gmail.com' WHERE id_atleta BETWEEN 1 AND 10;
-- 43. atualize status para 'Inativo' onde nome igual a Boxe ou Karate.
UPDATE esportes SET statuss = 'Inativo' WHERE nome IN('Boxe','Karate');
-- 44. aumente salario_atual onde experiencia_anos > 10 and salario_atual < 9000.
UPDATE treinadores SET salario_atual = 5 WHERE experiencia_anos > 10 AND salario_atual < 9000;
-- 45. atualize gênero para 'M' onde nome contenha Silva.
UPDATE membros SET genero = 'M' WHERE nome LIKE '%Silva%';
-- 46. atualize email onde genero = 'F' ou genero = 'M'.
UPDATE membros SET email = 'taz@gmail.com' WHERE genero IN('M', 'F');
-- 47. atualize salario_atual onde salario_inicial entre 3000 e 6000.
UPDATE treinadores SET salario_atual = 0.5 WHERE salario_inicial >= 3000 AND salario_inicial <= 6000;
-- 48. atualize status para 'Ativo' onde nome contenha a letra i.
UPDATE esportes SET statuss = 'Ativo' WHERE nome LIKE '%i%';
-- 49. atualize id_treinador para 1 onde id_treinador for nulo
UPDATE treinadores set id_treinador = 1 WHERE id_treinador = NULL;
-- 50. atualize salario_atual onde experiencia_anos > 5 or salario_atual < 4000.
UPDATE treinadores SET salario_atual = 999 WHERE experiencia_anos > 5 or salario_atual < 4000;
-- 51. atualize experiencia_anos onde nome contenha a letra M.
UPDATE treinadores SET experiencia_anos = 30 WHERE nome LIKE '%m%';
-- 52. atualize id_esporte para nulo onde id_esporte > 105.
UPDATE esportes SET id_esporte = NULL WHERE id_esporte > 105;
-- 53. atualize status para 'Inativo' onde id_modalidade > 110.
UPDATE esportes SET statuss = 'Inativo' WHERE id_modalidade > 110;
-- 54. atualize salario_atual onde salario_atual esteja no intervalo 4000 e 7000.
UPDATE treinadores SET salario_atual = 444 WHERE salario_atual >= 4000 AND salario_atual <= 7000;
-- 55. atualize email para os nome Diego Torres , Larissa Gomes, o email deve ser o nome
-- mais ‘@sptech.school’.
UPDATE membros SET email = 'diegotorres@sptech.school' WHERE nome = 'Diego Torres';
UPDATE membros SET email = REPLACE(CONCAT(nome,'@sptech.school'),'',''); 
-- 56. Liste o nome e o status dos esportes, exibindo o nome da coluna nome como
-- modalidade.
SELECT nome AS 'modalidade' ,statuss FROM esportes;
-- 57. Liste o nome dos membros e o email, exibindo o email com o alias
-- correio_eletronico.
SELECT nome, email as 'correio_eletronico' FROM membros; 
-- 58. Liste o nome dos treinadores e o salário atual com alias salario.
SELECT nome, salario_atual AS 'salario' FROM treinadores;
-- 59. Liste nome e cpf dos membros cujo gênero seja igual a 'F'.
SELECT nome, cpf FROM membros WHERE genero =  'F';
-- 60. Liste nome e experiência dos treinadores cuja experiência seja maior que 10 anos.
DESC treinadores;
SELECT nome, experiencia_anos FROM treinadores WHERE experiencia_anos > 10;
-- 61. Liste nome e salário atual dos treinadores cujo salário atual seja menor que 4000.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual < 4000;
-- 62. Liste os membros cujo id_esporte esteja entre 100 e 105.
SELECT * FROM membros WHERE id_esporte BETWEEN 100 AND 105;
-- 63. Liste os treinadores cuja experiência esteja entre 5 e 15 anos.
SELECT * FROM treinadores WHERE experiencia_anos BETWEEN 5 AND 15;
-- 64. Liste os esportes cujo nome comece com a letra 'B'.
SELECT * FROM esportes WHERE nome LIKE 'B%';
-- 65. Liste os membros cujo nome termine com 'Silva'.
SELECT * FROM membros WHERE nome LIKE '%Silva';
-- 66. Liste os membros cujo nome contenha a palavra 'Junior'.
SELECT * FROM membros WHERE nome LIKE '%Junior%';
-- 67. Liste os esportes cujo status seja diferente de 'Ativo'.
SELECT * FROM esportes WHERE statuss != 'Ativo';
-- 68. Liste os treinadores cujo salário atual seja maior que 5000 e experiência maior que 8
-- anos.
SELECT * FROM treinadores WHERE salario > 5000 AND experiencia_anos > 8;
-- 69. Liste os membros cujo gênero seja 'F' ou id_esporte seja 101.
SELECT * FROM membros WHERE genero = 'F' OR id_esporte = 101;
-- 70. Liste os membros cujo gênero não seja 'M'.
SELECT * FROM membros WHERE genero != 'M';
-- 71. Liste os membros cujo id_esporte esteja na lista (100, 101, 102).
SELECT * FROM membros WHERE id_esporte IN(100, 101, 102);
-- 72. Liste os treinadores cujo nome esteja na lista ('Carlos Silva', 'Marcelo Dias').
SELECT * FROM treinadores WHERE nome IN('Carlos Silva', 'Marcelo Dias');
-- 73. Liste os membros cujo email seja nulo.
SELECT * FROM membros WHERE email = NULL;
-- 74. Liste os membros cujo id_treinador não seja nulo.
SELECT * FROM membros WHERE id_treinador LIKE '%';
-- 75. Liste nome e salário atual dos treinadores, exibindo 'Sem salário definido' quando o
-- salário atual for nulo.
SELECT nome, 
CASE 
	WHEN salario_atual = NULL THEN salario_atual = 'Não definido'
END
FROM treinadores;
-- 76. Liste nome e cpf dos membros concatenando ambos em uma única coluna chamada
-- identificacao.
SELECT CONCAT(nome, cpf) AS 'identificacao';
-- 77. Liste nome e salário atual dos treinadores, exibindo uma coluna chamada
-- situacao_salarial, onde:
-- 'Alto' para salário > 8000
-- 'Médio' para salário entre 4000 e 8000
-- 'Baixo' para salário < 4000
SELECT nome, salario_atual, 
CASE
	WHEN salario_atual > 8000 THEN 'Alto'
    WHEN salario_atual >= 4000 AND salario_atual <= 8000 THEN 'Médio'
    WHEN salario_atual < 4000 THEN 'Baixo'
    ELSE salario_atual 
END AS 'situacao_salarial'
FROM treinadores;
-- 78. Liste nome e status dos esportes, exibindo 'Disponível' quando status for 'Ativo' e
-- 'Indisponível' quando for 'Inativo'.
SELECT nome, statuss,
CASE
	WHEN statuss = 'Ativo' THEN 'Disponível'
    ELSE 'Indisponível'
END AS 'situacao'
FROM esportes;
-- 79. Liste nome dos membros e uma coluna chamada possui_treinador, indicando 'Sim'
-- quando id_treinador não for nulo e 'Não' quando for nulo.
SELECT nome, id_treinador,
CASE
	WHEN id_treinador = NULL THEN 'Não'
    ELSE 'Sim'
END AS 'Possui treinador?'
FROM membros;
-- 80. Liste nome e salário atual dos treinadores cujo salário esteja entre 3000 e 7000 e
-- experiência maior que 5 anos.
SELECT nome, salario_atual FROM treainadores WHERE salario_atual > 3000 AND salario_atual < 7000;
-- 81. Liste nome dos membros cujo nome comece com 'A' e gênero seja 'F'.
SELECT nome FROM membros WHERE nome LIKE 'A%' AND genero = 'F';
-- 82. Liste nome dos membros cujo nome comece com 'A' ou 'B'.
SELECT nome FROM membros WHERE nome LIKE 'A%' OR nome LIKE 'B%';
-- 83. Liste nome dos membros cujo nome não comece com 'C'.
SELECT nome FROM membros WHERE nome NOT LIKE 'C%';
-- 84. Liste nome e experiência dos treinadores cuja experiência seja maior que 5 e menor
-- que 15.
SELECT nome, experiencia_anos FROM treinadores WHERE experiencia_anos > 5 and experiencia_anos < 15;
-- 85. Liste nome e salário atual dos treinadores cujo salário atual seja maior que 5000 ou
-- experiência maior que 12 anos.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual > 5000 OR experiencia_anos > 12;
-- 86. Liste nome e cpf dos membros cujo cpf esteja entre '20000000000' e '50000000000'.
SELECT nome, cpf FROM membros WHERE cpf BETWEEN 20000000000 AND 50000000000;
-- 87. Liste nome dos membros cujo id_esporte não esteja na lista (100, 101).
SELECT nome FROM membros WHERE id_esporte NOT IN(100,101);
-- 88. Liste nome e status dos esportes cujo nome contenha a letra 'e' e status seja 'Ativo'.
SELECT nome, statuss FROM esportes WHERE nome LIKE '%e%' AND statuss = 'Ativo';
-- 89. Liste nome dos membros cujo email não seja nulo e gênero seja 'M'.
SELECT nome FROM membros WHERE email = '%' AND genero = 'M';
-- 90. Liste nome e salário atual dos treinadores cujo salário atual seja diferente do salário
-- inicial.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual != salario_inicial;
-- 91. Liste nome dos membros e concatene o texto ' - Atleta' ao final do nome.
SELECT CONCAT(nome, ' - Atleta') FROM membros; 
-- 92. Liste nome dos membros e uma coluna chamada tipo_genero, onde:
-- 'Masculino' para 'M'
-- 'Feminino' para 'F'
-- 'Não informado' quando for nulo
SELECT nome, 
CASE
	WHEN genero = 'M' THEN 'Masculino'
    WHEN genero = 'F' THEN 'Feminino'
    ELSE 'Não informado'
END AS tipo_genero
FROM membros;
-- 93. Liste nome dos treinadores e uma coluna chamada faixa_experiencia, classificando:
-- 'Iniciante' até 5 anos
-- 'Intermediário' entre 6 e 10
-- 'Avançado' acima de 10
SELECT nome,
CASE 
	WHEN experiencia_anos <= 5 THEN 'Iniciante'
    WHEN experiencia_anos >= 6 AND experiencia_anos <=10 THEN 'Intermediário'
    WHEN experiencia_anos > 10 THEN 'Avançado'
    ELSE 'Não informado'
END AS faixa_experiencia
FROM treinadores;
-- 94. Liste nome e salário atual dos treinadores exibindo 0 quando o salário for nulo.
SELECT nome,
CASE
	WHEN salario_atual = NULL THEN 0
    ELSE salario_Atual
END AS salario_atual
FROM treinadores;
-- 95. Liste nome dos membros cujo nome contenha a letra 'a' e não contenha a letra 'z'.
SELECT nome FROM membros WHERE nome LIKE '%a%' AND nome NOT LIKE '%z%';
-- 96. Liste nome dos membros cujo id_atleta seja maior que 10 e menor que 50.
SELECT nome WHERE id_atleta > 10 AND id_atleta < 50;
-- 97. Liste nome e salário atual dos treinadores cujo salário atual esteja entre 4000 e 9000
-- e não seja igual a 7000.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual BETWEEN 4000 AND 9000 AND salario_atual != 7000; 
-- 98. Liste nome e status dos esportes cujo status seja 'Ativo' e id_modalidade maior que
-- 100.
SELECT nome, statuss FROM esportes WHERE statuss = 'Ativo' AND id_esporte > 100;
-- 99. Liste nome dos membros cujo nome esteja na lista ('Ana Paula', 'Lucas Lima', 'Diego
-- Torres').
SELECT nome FROM membros WHERE nome IN ('Ana Paula', 'Lucas Lima', 'Diego', 'Torres');
-- 100. Liste nome e cpf dos membros cujo cpf não esteja na lista
-- ('11122233344','55566677788').
SELECT nome, cpf FROM membros WHERE cpf NOT IN ('11122233344','55566677788');
-- 101. Liste nome dos treinadores cujo nome comece com 'M' e experiência maior que 5.
SELECT nome FROM treinadores WHERE nome LIKE 'M%' AND experiencia_anos > 5;
-- 102. Liste nome dos membros cujo gênero seja 'F' e id_esporte entre 100 e 110.
SELECT nome FROM membros WHERE genero = 'F' AND id_esporte BETWEEN 100 AND 110;
-- 103. Liste nome e salário atual dos treinadores cujo salário atual seja maior que 3000 e
-- menor que 10000 e experiência diferente de 7.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual > 3000 AND salario_atual < 10000 AND experiencia_anos != 7;
-- 104. Liste nome dos esportes cujo nome termine com 'o' ou termine com 'e'.
SELECT nome FROM esportes WHERE nome LIKE '%o' OR nome LIKE '%e';
-- 105. Liste nome dos membros e crie uma coluna chamada resumo, concatenando nome,
-- cpf e genero separados por hífen.
SELECT CONCAT(nome,' - ',cpf,' - ',genero) FROM membros; 
-- 106. Liste nome e salário atual dos treinadores cujo salário seja maior que 5000 e
-- experiência maior que 5, ou cujo salário seja maior que 8000 independentemente da
-- experiência.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual > 5000 AND experiencia_anos > 5 OR salario_atual > 8000;
-- 107. Liste nome dos membros cujo gênero seja 'F' e id_esporte esteja entre 100 e 105, ou
-- cujo nome comece com 'L'.
SELECT nome FROM membros WHERE genero = 'F' AND id_esporte BETWEEN 100 AND 105 OR nome LIKE 'L%';
-- 108. Liste nome e cpf dos membros cujo cpf esteja entre dois valores e gênero seja 'M',
-- mas exclua aqueles cujo nome termine com 'Silva'.
SELECT nome, cpf FROM membros WHERE cpf BETWEEN 0 AND 99999999999 AND genero = 'M';
-- 109. Liste nome dos esportes cujo status seja 'Ativo' e id_modalidade maior que 100, ou
-- cujo nome contenha a letra 'a' e status não seja 'Inativo'.
SELECT nome FROM espotres WHERE statuss = 'Ativo' AND id_modalidade > 100 OR nome LIKE '%a%' AND statuss != 'Inativo';
-- 110. Liste nome e salário atual dos treinadores cuja experiência esteja entre 5 e 15 anos e
-- salário maior que 4000, ou cuja experiência seja maior que 20.
SELECT nome, salario_atual FROM treinadores WHERE experiencia_anos BETWEEN 5 AND 15 AND salario_atual > 4000 OR experiencia_anos > 20;
-- 111. Liste nome dos membros cujo id_treinador não seja nulo e (gênero seja 'F' ou nome
-- comece com 'A').
SELECT nome FROM membros WHERE id_treinador IS NOT NULL AND genero = 'F' OR nome LIKE 'A%';
-- 112. Liste nome dos membros cujo id_esporte esteja na lista (100,101) e gênero seja 'M',
-- ou cujo email seja nulo.
SELECT nome FROM membros WHERE id_esporte IN(100, 101) AND genero = 'M';
-- 113. Liste nome e salário atual dos treinadores cujo salário atual seja maior que o salário
-- inicial e experiência diferente de 10, e cujo nome não comece com 'R'.
SELECT nome, salario_atual FROM treinadores WHERE salario_atual > salario_inicial AND experiencia != 10 AND nome NOT LIKE 'R%';
-- 114. Liste nome dos esportes cujo nome contenha a letra 'e' e não contenha a letra 'i', ou
-- cujo status seja 'Inativo'.
SELECT nome FROM esportes WHERE nome LIKE '%e%' AND nome NOT LIKE '%i%' OR statuss = 'Inativo'; 
-- 115. Liste nome dos membros cujo nome comece com 'A' ou 'B' e cujo gênero não seja
-- nulo, mas exclua aqueles cujo cpf esteja na lista ('00000000000','11111111111').
SELECT nome FROM membros WHERE nome LIKE 'A%' or nome LIKE 'B%' AND genero IS NOT NULL AND cpf NOT IN('00000000000','11111111111');
-- 116. Liste nome e salário atual dos treinadores cuja experiência seja maior que 5 e menor
-- que 15 e cujo salário não esteja entre 3000 e 6000.
SELECT nome, salario_atual FROM treinadores WHERE experiencia_anos > 5 AND experiencia_anos < 15 AND salario_atual NOT BETWEEN 3000 AND 6000;
-- 117. Liste nome dos membros cujo id_atleta seja maior que 10 e menor que 100 e cujo
-- id_esporte não esteja na lista (102,103).
SELECT nome FROM membros WHERE id_atleta > 10 AND id_atleta > 100 AND id_esporte NOT IN(102,103);
-- 118. Liste nome dos treinadores cujo nome comece com 'M' ou 'C' e cuja experiência seja
-- maior que 8 e salário atual maior que 5000.
SELECT nome FROM treinadores WHERE nome LIKE 'm%' OR nome LIKE 'C%' AND experiencia_anos > 8 AND salario_atual > 5000;
-- 119. Liste nome dos membros cujo email não seja nulo e (gênero seja 'F' e id_esporte
-- entre 100 e 110).
SELECT nome FROM membros 
WHERE email IS NOT NULL 
AND genero = 'F' 
AND id_esporte BETWEEN 100 AND 110;
-- 120. Liste nome dos esportes cujo status seja 'Ativo' e id_modalidade entre 100 e 120 e
-- cujo nome não termine com 'o'.
SELECT nome FROM esportes WHERE statuss = 'Ativo' 
AND id_modalidade BETWEEN 100 AND 120 
AND nome NOT LIKE '%o';
-- 121. Liste nome e salário atual dos treinadores cuja experiência seja maior que 5 ou
-- salário maior que 7000, mas exclua aqueles cuja experiência seja menor que 3.
SELECT nome, salario_atual FROM treinadores 
WHERE experiencia_anos > 5 
OR salario_atual > 7000 
AND experiencia_anos > 3;
-- 122. Liste nome dos membros cujo gênero seja 'F' e nome contenha 'a', ou cujo gênero
-- seja 'M' e nome contenha 'o'.
SELECT nome FROM membros WHERE genero = 'F' AND nome LIKE '%a%' OR genero = 'M' AND nome LIKE '%o%';
-- 123. Liste nome dos treinadores cujo salário atual seja maior que 5000 e (experiência
-- maior que 10 ou salário maior que 9000).
SELECT nome FROM treinadores WHERE salario_atual > 5000 AND experiencia > 10 OR salario_atual > 9000;
-- 124. Liste nome dos membros cujo id_esporte esteja entre 100 e 110 e cujo nome não
-- contenha a letra 'r'.
SELECT nome FROM membros WHERE id_esporte BETWEEN 100 AND 110 AND name NOT LIKE '%r&';
-- 125. Liste nome e cpf dos membros cujo cpf esteja entre dois valores e (gênero seja 'F' ou
-- id_treinador não seja nulo).
SELECT nome, cpf FROM membros WHERE cpf BETWEEN 1 AND 99999999999 AND genero = 'F' OR id_treinador IS NOT NULL;