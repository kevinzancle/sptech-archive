-- Criação da Tabela
CREATE DATABASE IF NOT EXISTS db_fashionstore;
USE db_fashionstore;

CREATE TABLE venda(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
categoria VARCHAR(50),
preco DECIMAL(10,2),
tamanho VARCHAR(5),
data_cadastro DATETIME DEFAULT current_timestamp(),
disponivel TINYINT,
CONSTRAINT chk_tamanho CHECK(tamanho IN('P', 'M', 'G', 'GG'))
);
-- Inserção de Dados
-- Insira pelo menos 6 produtos variados, com diferentes categorias, tamanhos, datas e disponibilidade.
INSERT INTO venda(nome, categoria, preco, tamanho, disponivel)
VALUES('camiseta naruto', 'camiseta', 60, 'P', 0),
      ('camiseta naruto', 'camiseta', 60, 'M', 1),
      ('camiseta naruto', 'camiseta', 60, 'G', 1),
      ('calça angelical', 'calça', 120, 'P', 1),
      ('calça angelical', 'calça', 120, 'M', 0),
      ('calça angelical', 'calça', 120, 'G', 1),
      ('jaqueta off white', 'jaqueta', 300, 'P', 1),
      ('jaqueta off white', 'jaqueta', 300, 'M', 1),
      ('jaqueta off white', 'jaqueta', 300, 'G', 0);


-- Consultas
-- Agora, escreva as consultas SQL para responder às perguntas abaixo:
-- Listar os produtos que contenham a palavra "Camiseta" no nome.
SELECT * FROM venda WHERE nome LIKE "camiseta%";
-- Listar os produtos que não sejam do tamanho 'M'.
SELECT * FROM venda WHERE tamanho != "M";
-- Exibir apenas os produtos cadastrados depois de 18 de agosto de 2025.
SELECT * FROM venda WHERE data_cadastro > "2025-08-18 00:00:00";
-- Listar os produtos disponíveis cuja categoria seja "Camiseta" ou "Blusa".
SELECT * FROM venda WHERE categoria LIKE "camiseta%" OR categoria LIKE "blusa%";
-- Exibir o nome do produto concatenado com seu preço, com o alias 'produto_preco'.
SELECT CONCAT(nome," - ", preco) AS "produto_preco" FROM venda;
-- Listar os produtos cujo nome NÃO contenha a palavra "Blusa".
SELECT * FROM venda WHERE nome != "blusa%";
-- Listar todos os produtos com uma coluna adicional chamada 'status' que mostre "Disponível" se disponivel = 1 e "Indisponível" caso contrário.
 
-- Liste os produtos da categoria "Calça" com preço maior que 100 reais.
SELECT * FROM venda WHERE categoria = "calça" AND preco > 100;
-- Liste os produtos com nome que não contenha a palavra "Camiseta".
SELECT * FROM venda WHERE nome != "camiseta%";
-- Exiba os produtos cujo id seja 1, 3 ou 5.
SELECT * FROM venda WHERE id IN (1,3,5);
-- Liste os produtos com tamanho diferente de 'P' e 'M'.
SELECT * FROM venda WHERE tamanho != "P" OR tamanho != "M";
-- Liste os produtos cadastrados antes de 18 de agosto de 2025.
SELECT * FROM venda WHERE data_cadastro < "2025-08-18 00:00:00";
-- Liste o nome e preço de todos os produtos, com um alias chamado produto_valor.
SELECT CONCAT(nome," - ", preco) AS "produto_valor" FROM venda;
-- Mostre todos os produtos com uma coluna chamada info_completa que junte nome, categoria e preço.
SELECT CONCAT(nome," - ", categoria, " - ", "preco") AS "info_completa" FROM venda;
-- Mostre os produtos que estão disponíveis e têm tamanho 'M'.
SELECT * FROM venda WHERE tamanho = "M" AND disponivel > 0;
-- Liste os produtos com nomes que começam com a letra 'C'.
SELECT * FROM venda WHERE nome LIKE "c%";
-- Atualize o preço da "Jaqueta Couro" para 270.00.
UPDATE venda SET preco = 270 WHERE id IN(7,8,9);
-- Marque como indisponível todos os produtos da categoria "Blusa".
UPDATE venda SET disponivel = 0 WHERE nome LIKE "blusa%"; -- ou pelo ID
-- Atualize o campo tamanho para 'M' nos produtos com nome que contenha "Short".
UPDATE venda SET tamanho = "M" WHERE nome LIKE "short%";
-- Atualize a categoria para "Camiseta" em todos os produtos cujo nome contenha "Camiseta".
UPDATE venda SET categoria = "camiseta" WHERE nome LIKE "camiseta%";
-- Marque como disponível todos os produtos cadastrados após 20 de agosto de 2025.
UPDATE venda SET disponivel = 1 WHERE data_cadastro > "2025-08-20 00:00:00";
-- Aumente em 5% o preço dos produtos com preço inferior a 100 reais.
UPDATE venda SET preco = preco*1.05 WHERE preco < 100;
-- Atualize o nome do produto de id 4 para "Short Esportivo Unissex".
UPDATE venda SET nome = "SHORT Esportivo Unissex" WHERE id = 4;
-- Marque como indisponíveis os produtos com nome que contenha "Blusa" ou "Moletom".
UPDATE venda SET disponivel = 0 WHERE nome LIKE "blusa%" OR nome LIKE "moletom%";
-- Atualize a data de cadastro de todos os produtos da categoria "Camiseta" para a data atual.
UPDATE venda SET data_cadastro = current_timestamp() WHERE id BETWEEN 1 AND 9;
-- Insira mais 6 produtos
INSERT INTO venda(nome, categoria, preco, tamanho, disponivel)
VALUES('camiseta sasuke', 'camiseta', 60, 'P', 0),
      ('camiseta sasuke', 'camiseta', 60, 'M', 1),
      ('camiseta sasuke', 'camiseta', 60, 'G', 1),
      ('calça marrom', 'calça', 120, 'P', 1),
      ('calça marrom', 'calça', 120, 'M', 0),
      ('calça marrom', 'calça', 120, 'G', 1);
-- Exiba os produtos com categoria igual a "Jaqueta" e que não estejam disponíveis.
SELECT * FROM venda WHERE categoria = "jaqueta" AND disponivel = 0;
-- Liste os produtos com tamanho 'GG' ou 'P', ordenados pelo preço decrescente.
SELECT * FROM venda WHERE tamanho IN ("GG", "P") ORDER BY preco DESC;
-- Mostre apenas o nome e o tamanho dos produtos cadastrados no mês de agosto de 2025.
SELECT nome, tamanho FROM venda WHERE data_cadastro BETWEEN "2025-08-01" AND "2025-08-31";
-- Exiba os produtos com nomes terminando em "a".
SELECT * FROM venda WHERE nome LIKE "%a";
-- Exiba os produtos cuja categoria não esteja entre "Camiseta", "Calça" e "Short".
SELECT * FROM venda WHERE categoria NOT IN ("camiseta", "calca", "short");
-- Mostre os produtos com preço entre R$ 50,00 e R$ 150,00, com alias para nome e preço.
SELECT nome AS "produto", preco AS "valor" FROM venda WHERE preco BETWEEN 50 AND 150;
-- Exiba todos os produtos e adicione uma coluna chamada info que junte nome e categoria com hífen.
SELECT CONCAT(Nome, '-', Categoria) AS info FROM Produto;
-- Mostre os produtos que estão indisponíveis com uma coluna status que diga "Em falta".
SELECT nome, disponivel AS "Em falta" FROM venda WHERE disponivel = 0;
-- Liste todos os produtos cujo nome tenha 2 palavras (dica: um espaço).
SELECT * FROM venda WHERE nome LIKE "% %";
-- Exiba os produtos cujo nome não contenha a palavra "Blusa", que tenham tamanho 'M' ou 'G', estejam disponíveis, tenham sido cadastrados após 15 de agosto de 2025, e mostre:
SELECT * FROM venda WHERE nome NOT LIKE "blusa%" 
AND tamanho IN ("M", "G") 
AND disponivel = 1 
AND data_cadastro > "2025-08-15 00:00:00";
-- O nome como nome_produto
SELECT nome AS "nome_produto" FROM venda;
-- O preço como preco_atual
SELECT preco AS "preco_atual" FROM venda;
-- A data de cadastro
SELECT data_cadastro FROM venda;
-- Uma coluna chamada descricao concatenando nome, categoria e preço
SELECT CONCAT(nome, categoria, preco) AS "descricao" FROM venda;
-- Uma coluna status_disponibilidade usando CASE para mostrar "Disponível" ou "Indisponível"