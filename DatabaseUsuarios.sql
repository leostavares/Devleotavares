CREATE DATABASE IF NOT EXISTS cadastro_db;

USE cadastro_db;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- ID auto-incremento
    nome VARCHAR(100) NOT NULL,         -- Nome do usuário
    email VARCHAR(100) NOT NULL UNIQUE  -- Email do usuário (único)
);
