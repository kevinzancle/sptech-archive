-- ================================================ Lista de Desafios ================================================

-- 1. Criar um banco de dados chamado biblioteca.
CREATE DATABASE IF NOT EXISTS biblioteca;
-- 2. Definir que o banco de dados em uso seja o biblioteca.
USE biblioteca;
-- 3. Criar uma tabela chamada livro com os campos: codigo (chave primária), titulo, autor e ano de publicação. 
CREATE TABLE livro(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(30),
    autor VARCHAR(40) DEFAULT 'Sem autor',
    ano_publicacao YEAR
);
-- O campo autor deve ter o valor padrão definido como 'Sem Autor'.
-- FEITO : autor VARCHAR(40) DEFAULT 'Sem autor',
-- 4. Adicionar dois registros na tabela livro.
INSERT INTO livro(titulo, autor, ano_publicacao)
VALUES('Morro dos ventos uivantes', 'Robert', '2001'),
      ('Frankstein', 'Lilian', '1958');
-- 5. Exibir todos os registros existentes na tabela livro.
SELECT * FROM livro;
-- 6. Alterar o nome do autor de um dos livros já cadastrados.
UPDATE livro SET autor = 'Kevin' WHERE codigo = 2;
-- 7. Exibir o titulo e nome do registro alterado.
SELECT titulo, autor FROM livro WHERE codigo = 2;
-- 8. Remover um registro da tabela livro.
DELETE FROM livro WHERE codigo = 1;
-- 9. Mostrar a estrutura (colunas e tipos de dados) da tabela livro.
DESC livro;
-- 10. Acrescentar uma nova coluna chamada editora na tabela livro.
ALTER TABLE livro ADD COLUMN editora VARCHAR(30);
-- 11. Exiba todos os registros que contém a letra 'a' na coluna autor
SELECT * FROM livro WHERE autor LIKE '%a%';
-- 12. Excluir a coluna editora da tabela livro.
ALTER TABLE livro DROP COLUMN editora;
-- 13. Criar uma tabela chamada usuario com os campos: codigo, nome e tipo
-- A coluna nome deve ser inserida, obrigatóriamente.
CREATE TABLE usuario(
	codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(40) NOT NULL,
    tipo VARCHAR(15)
);
-- 14. Adicionar dois usuários à tabela criada. 
INSERT INTO usuario(nome, tipo)
VALUES ('Kevin', 'visitante'),
       ('Michael', 'visitante');
-- 15. Alterar o campo tipo, para que aceite apenas determinados valores (ex.: docente, discente, visitante). 
ALTER TABLE usuario ADD CONSTRAINT ck_tipo CHECK(tipo IN('docente', 'discente', 'visitante'));
-- 16. Atualizar os dois registros de usuario, inserindo o valor do campo tipo.
UPDATE usuario SET tipo = 'docente' WHERE codigo>0;
-- 17. Exibir todos os registros da tabela usuario em que a penúltima letra do nome é m. 
SELECT * FROM usuario WHERE nome LIKE '%m_';
-- 18. Acrescentar uma nova coluna chamada telefone na tabela usuario.
ALTER TABLE usuario ADD COLUMN telefone CHAR(11);
-- 19. Alterar a tabela usuario, aumentando a quantidade de caracteres na coluna nome
ALTER TABLE usuario MODIFY COLUMN nome VARCHAR(100);
-- 20. Criar uma consulta na tabela usuario, renomeando a coluna nome para nome_completo.
SELECT nome AS 'nome_completo', tipo FROM usuario;
-- 21. Criar uma consulta na tabela livro, mostrando titulo e autor juntos em uma única coluna chamada detalhes.
SELECT CONCAT(titulo ,'-', autor) AS detalhes FROM livro;
-- 22. Criar uma consulta na tabela livro, mostrando titulo, ano_publicacao e uma coluna classificacao,
--  que classifica livros publicados antes do ano 2000 como “Antigo” e os demais como “Moderno”.
SELECT titulo, ano_publicacao, 
CASE 
  WHEN ano_publicacao < 2000 THEN 'Antigo'
  ELSE 'Moderno'
END AS 'Classificação'
FROM livro;  
-- 23. Criar uma consulta na tabela livro, mostrando todos os dados, em ordem decrescente pelo nome
SELECT * FROM livro ORDER BY titulo DESC;
-- 24. Criar uma consulta na tabela usuario, mostrando todos os dados em que o dado na coluna tipo seja diferente de docente
SELECT * FROM usuario WHERE tipo != 'docente';
-- 25. Esvaziar todos os registros da tabela livro, mantendo sua estrutura.
TRUNCATE TABLE livro;
-- 26. Apagar o banco de dados biblioteca.
DROP DATABASE biblioteca;
