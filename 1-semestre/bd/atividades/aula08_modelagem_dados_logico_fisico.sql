CREATE DATABASE techRent;
USE techRent;

CREATE TABLE empresa(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(45)
);

CREATE TABLE cliente(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11),
telefone CHAR(11)
);

CREATE TABLE equipamento(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipo VARCHAR(45),
marca VARCHAR(45),
modelo VARCHAR(45),
fk_empresa INT UNIQUE,
CONSTRAINT fk_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE locacao(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
data_locacao DATE,
data_devolucao DATE,
fk_cliente INT,
fk_equipamento INT UNIQUE,
CONSTRAINT fk_cliente FOREIGN KEY (fk_cliente) REFERENCES cliente(id),
CONSTRAINT fk_equipamento FOREIGN KEY (fk_equipamento) REFERENCES equipamento(id)
);