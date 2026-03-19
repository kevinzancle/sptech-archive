	-- Exercício 1:
CREATE DATABASE IF NOT EXISTS sprint2;
USE sprint2;
-- Criar as tabelas;
CREATE TABLE pessoa(
id_Pessoa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11)
);
CREATE TABLE reserva(
id_reserva INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
dt_reserva DATETIME,
dt_retirada DATETIME,
dt_devolucao DATETIME,
fk_pessoa INT
-- CONSTRAINT fkpessoa FOREIGN KEY (fk_pessoa)
-- REFERENCES pessoa(id_pessoa)
);
-- Inserir 5 registros
INSERT INTO pessoa (nome, cpf)
VALUES ('Kevin', '12353567895'),
	   ('Arthur', '13353267895'),
       ('Carlos', '13353564895'),
       ('Davi', '13353561895'),
       ('Bernardo', '12353467895');
       
INSERT INTO reserva (dt_reserva, dt_retirada, dt_devolucao, fk_pessoa)
VALUES ('2026-10-01 12:00:00', '2026-10-01 13:34:00', '2026-10-23 12:34:00', 1),
       ('2026-10-02 12:01:00', '2026-10-02 13:33:00', '2026-10-23 12:33:00', 2),
       ('2026-10-03 12:02:00', '2026-10-03 13:34:00', '2026-10-23 12:32:00', 3),
       ('2026-10-04 12:03:00', '2026-10-04 13:35:00', '2026-10-23 12:31:00', 4),
       ('2026-10-05 12:04:00', '2026-10-05 13:37:00', '2026-10-23 12:30:00', 5);
        
-- Configurar chave estrangeira
ALTER TABLE reserva ADD FOREIGN KEY fkpessoa (fk_pessoa) REFERENCES pessoa(id_pessoa);
-- Exibir dados;
SELECT reserva.id_reserva, pessoa.nome, reserva.dt_reserva FROM reserva
INNER JOIN pessoa ON reserva.fk_pessoa = pessoa.id_pessoa;
-- Exibir dados com AS;
SELECT reserva.id_reserva AS 'Identificador', pessoa.nome AS 'Cliente', reserva.dt_reserva AS 'Data da Reserva' FROM reserva
INNER JOIN pessoa ON reserva.fk_pessoa = pessoa.id_pessoa;  
-- Exibir dados com CASE;
SELECT pessoa.nome,reserva.dt_reserva,
	CASE
		WHEN dt_devolucao < '2026-10-23 12:33:00' THEN 'DEVOLVIDO'
		ELSE 'PENDENTE'
	END AS 'Status'
FROM reserva INNER JOIN pessoa ON reserva.fk_pessoa = pessoa.id_pessoa;
-- Exibir dados com IFNULL;
SELECT reserva.id_reserva, pessoa.nome, IFNULL(pessoa.cpf, 'Não informado') AS 'CPF',reserva.dt_reserva FROM reserva
INNER JOIN pessoa ON reserva.fk_pessoa = pessoa.id_pessoa;

-- Exercício 2:

-- Criar as tabelas;
CREATE TABLE pessoa1(
id_pessoa1 INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(45),
dt_nascimento DATE
);
CREATE TABLE pessoa2(
id_pessoa2 INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(45),
dt_nascimento DATE,
fk_pessoa1 INT UNIQUE
); 
-- Inserir 5 registros
INSERT INTO pessoa1 (nome, dt_nascimento)
VALUES ('Abner','2007-04-12'),
       ('Bruno','2006-10-11'),
       ('Carlos','2000-12-25'),
       ('Davi','2010-06-09'),
       ('Eitor','2001-02-27');
       
INSERT INTO pessoa2 (nome, dt_nascimento)
VALUES ('Fagner','2020-02-12'),
       ('Gabriel','1999-07-15'),
       ('Humberto','2003-11-25'),
       ('Ingrid','2008-09-09'),
       ('Joaquim','1996-03-20');
-- Configurar chave estrangeira
ALTER TABLE pessoa2 ADD FOREIGN KEY fkpessoa1 (fk_pessoa1) REFERENCES pessoa1(id_pessoa1);
UPDATE pessoa2 SET fk_pessoa1 = 1 WHERE id_pessoa2 = 1;
UPDATE pessoa2 SET fk_pessoa1 = 2 WHERE id_pessoa2 = 2;
UPDATE pessoa2 SET fk_pessoa1 = 3 WHERE id_pessoa2 = 3;
UPDATE pessoa2 SET fk_pessoa1 = 4 WHERE id_pessoa2 = 4;
UPDATE pessoa2 SET fk_pessoa1 = 5 WHERE id_pessoa2 = 5;
-- Exibir dados;
SELECT pessoa2.nome, pessoa2.dt_nascimento, pessoa1.nome FROM pessoa2
INNER JOIN pessoa1 ON pessoa2.fk_pessoa1 = pessoa1.id_pessoa1;
-- Exibir dados com AS;
SELECT pessoa2.nome, pessoa2.dt_nascimento, pessoa1.nome AS "Acompanhante" FROM pessoa2
INNER JOIN pessoa1 ON pessoa2.fk_pessoa1 = pessoa1.id_pessoa1;
-- Exibir dados com CASE;
SELECT pessoa2.nome, 
CASE
	WHEN pessoa2.dt_nascimento > "2008-03-10" THEN "Menor de Idade"
    ELSE "Maior de Idade"
END AS idade
    , pessoa1.nome FROM pessoa2
INNER JOIN pessoa1 ON pessoa2.fk_pessoa1 = pessoa1.id_pessoa1;
-- Exibir dados com IFNULL;
SELECT 
	pessoa2.nome, 
	IFNULL(pessoa2.dt_nascimento, 'Não informado') AS 'Data de Nascimento', 
	pessoa1.nome AS "Acompanhante" 
FROM 
	pessoa2
INNER JOIN pessoa1 ON pessoa2.fk_pessoa1 = pessoa1.id_pessoa1;
-- Exercício 3:
-- Referente a regra de negócio acima, cria a modelagem utilizando um relacionamento 1:1, implemente com o script realizando os seguintes comandos:
-- Criar as tabelas;
CREATE TABLE candidato(
	id_candidato INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_candidato VARCHAR(50) NOT NULL,
    cpf_candidato CHAR(11) UNIQUE
);
CREATE TABLE categoria(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_candidato INT NOT NULL UNIQUE,
	categorias VARCHAR(40)
	CHECK (categorias IN ('A', 'B', 'A e B', 'ACC e B'))
);
-- Inserir 5 registros
INSERT 
INTO candidato(nome_candidato, cpf_candidato)
	VALUES ('Arthur', '48576253894'),
		   ('Bernardo', '48576233894'),
           ('Cibele', '48576253794'),
           ('David', '48576253891'),
           ('Elias', NULL);
           
INSERT
INTO categoria(fk_candidato, categorias)
	VALUES (1, 'A'),
           (2, 'A e B'),
           (3, 'B'),
           (4, 'ACC e B'),
           (5, 'A');
-- Configurar chave estrangeira
ALTER TABLE categoria ADD FOREIGN KEY fk_candidato(fk_candidato) REFERENCES candidato(id_candidato);
-- Exibir dados;
SELECT
	categoria.id_categoria, candidato.nome_candidato, categoria.categorias
    
FROM categoria
INNER JOIN candidato 
ON categoria.fk_candidato = candidato.id_candidato;
-- Exibir dados com AS;
SELECT
	categoria.id_categoria AS 'ID Solicitação', candidato.nome_candidato AS 'Candidato', categoria.categorias AS 'Categorias'
FROM categoria
INNER JOIN candidato 
ON categoria.fk_candidato = candidato.id_candidato;
-- Exibir dados com CASE;
SELECT
	categoria.id_categoria AS 'ID Solicitação', candidato.nome_candidato AS 'Candidato', 
    CASE
		WHEN categoria.categorias = 'A' THEN 'Motocicletas e veículos similares'
        WHEN categoria.categorias = 'B' THEN 'Automóvel e veículos similares'
        WHEN categoria.categorias = 'A E B' THEN 'Motocicletas, Automóveis e veículos similares'
        WHEN categoria.categorias = 'ACC e B' THEN 'Ciclomotor, ;Motocicletas e veículos similares'
	END AS 'Categoria'
FROM categoria
INNER JOIN candidato 
ON categoria.fk_candidato = candidato.id_candidato;
-- Exibir dados com IFNULL;
SELECT
	categoria.id_categoria AS 'ID Solicitação', candidato.nome_candidato AS 'Candidato',IFNULL(candidato.cpf_candidato, 'Não informado') AS 'CPF', categoria.categorias AS 'Categorias'
FROM categoria
INNER JOIN candidato 
ON categoria.fk_candidato = candidato.id_candidato;
-- Exercício 4:
-- Regra de negócio: 
-- 1 Farmácia tem no mínimo 1 e no máximo 1 endereço, 1 endereço é de no mínimo 1 farmácia e no máximo 1.
-- 1 Farmácia tem no mínimo 1 farmacêutico e no máximo n, 1 farmacêutico é de no mínimo 1 farmácia e no máximo 1.
-- Criar a modelagem lógica na regra acima, com os campos de sua escolha.
-- EM ANEXO
-- Criar as tabelas;
CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
logradouro VARCHAR(40),
cep CHAR(8) UNIQUE
);

CREATE TABLE farmaceutico(
id_farmaceutico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(50),
cpf CHAR(11) UNIQUE
);

CREATE TABLE farmacia(
id_farmacia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_farmacia VARCHAR(30),
fk_endereco INT UNIQUE,
fk_farmaceutico INT UNIQUE
);
-- Inserir 5 registros;
INSERT INTO endereco (logradouro, cep)
VALUES('Rua onça das gaivotas 3', '08364510'),
      ('Rua azeitona 10', '38562730'),
      ('Rua dados 15', '93746510'),
      ('Rua marmitas unidas 34', '28746509'),
      ('Rua das conchas', '28475620');
INSERT INTO farmaceutico (nome, cpf)
VALUES ('Claudio', '27466253897'),
	   ('Nicolas','38475636453'),
       ('Adailton', '37564329807'),
       ('Roberto', '56732908907'),
       ('Alexander', '46524315678');
-- Configurar chave estrangeira;
ALTER TABLE farmacia 
ADD FOREIGN KEY fk_endereco(fk_endereco) 
REFERENCES endereco(id_endereco);

ALTER TABLE farmacia 
ADD FOREIGN KEY fk_farmaceutico(fk_farmaceutico) 
REFERENCES farmaceutico(id_farmaceutico);

INSERT INTO farmacia(nome_farmacia, fk_endereco, fk_farmaceutico)
VALUES ('farmapop', 1 , 1),
       ('ultrafarma', 2 ,2 ),
       ('droga leste', 3, 3),
       ('droga raia', 4, 4),
       ('drogasil', 5, 5);
-- Exibir dados;
SELECT 
	farmacia.nome_farmacia, farmaceutico.nome, endereco.logradouro
FROM farmacia
INNER JOIN farmaceutico
ON farmacia.fk_farmaceutico = farmaceutico.id_farmaceutico
INNER JOIN endereco
ON farmacia.fk_endereco = endereco.id_endereco;
-- Exibir dados com AS;
SELECT 
	farmacia.nome_farmacia AS 'Estabelecimento', farmaceutico.nome AS 'Funcionário', endereco.logradouro AS 'Local'
FROM farmacia
INNER JOIN farmaceutico
ON farmacia.fk_farmaceutico = farmaceutico.id_farmaceutico
INNER JOIN endereco
ON farmacia.fk_endereco = endereco.id_endereco;
-- Exibir dados com CASE;
SELECT 
	farmacia.nome_farmacia AS 'Estabelecimento', farmaceutico.nome AS 'Funcionário', 
    CASE
		WHEN endereco.logradouro = 'Rua azeitona 10' THEN 'Em reforma'
        ELSE endereco.logradouro
	END AS 'Endereço'
FROM farmacia
INNER JOIN farmaceutico
ON farmacia.fk_farmaceutico = farmaceutico.id_farmaceutico
INNER JOIN endereco
ON farmacia.fk_endereco = endereco.id_endereco;
-- Exibir dados com IFNULL;
SELECT 
	farmacia.nome_farmacia AS 'Estabelecimento', farmaceutico.nome AS 'Funcionário', endereco.logradouro AS 'Local', IFNULL(endereco.cep 'Não Informado') AS 'CPF'
FROM farmacia
INNER JOIN farmaceutico
ON farmacia.fk_farmaceutico = farmaceutico.id_farmaceutico
INNER JOIN endereco
ON farmacia.fk_endereco = endereco.id_endereco;