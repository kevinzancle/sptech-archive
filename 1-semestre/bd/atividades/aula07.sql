CREATE DATABASE aula_7;
 
USE aula_7;
 
CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45)
) auto_increment = 1000;
 
INSERT INTO empresa VALUES
	(null, 'Accenture', 'Rafaela'),
    (null, 'C6Bank', 'Andresa');
    
SELECT * FROM empresa;
 
CREATE TABLE aluno (
ra char(8) primary key,
nome varchar(45),
bairro varchar(45),
fkEmpresa int,
constraint fkEmp foreign key (fkEmpresa)
references empresa(idEmpresa)
);
 
INSERT INTO aluno VALUES
	('01232999', 'Pedro', 'Consolação', 1000)
WHERE fkempresa IN (SELECT idempresa FROM empresa);

DELETE FROM empresa 
WHERE idEmpresa = 1000;

SELECT * FROM aluno al
INNER JOIN empresa ON empresa.idEmpresa = aluno.fkEmpresa;

ALTER TABLE aluno DROP FOREIGN KEY fkEmp;

ALTER TABLE aluno 
ADD FOREIGN KEY fkEmp (fkEmpresa) 
REFERENCES empresa(idEmpresa);

CREATE USER kevin IDENTIFIED BY '@Senha242';
DROP USER kevin;