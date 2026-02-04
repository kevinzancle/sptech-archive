CREATE DATABASE IF NOT EXISTS atividade;
USE atividade;
CREATE TABLE aluno(
ra INT PRIMARY KEY NOT NULL,
nome_aluno VARCHAR(50),
email_aluno VARCHAR(50)
);
CREATE TABLE empresa(
id INT PRIMARY KEY NOT NULL,
nome_empresa VARCHAR(50),
representante_empresa VARCHAR(50)
);
CREATE TABLE curso(
id INT PRIMARY KEY NOT NULL,
nome_curso VARCHAR(50)
);
CREATE TABLE periodo(
id INT PRIMARY KEY,
ciclo_periodo VARCHAR(6)
);