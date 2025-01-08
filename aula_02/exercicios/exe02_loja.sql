-- Criar Banco de Dados
CREATE DATABASE db_loja;

-- Acessar (Selecionar) o Banco de Dados
USE db_loja;

-- Criar Tabela
CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL (8,2) NOT NULL,
    estoque INT NOT NULL,
    categoria VARCHAR(50),
    marca VARCHAR(20),
    descricao VARCHAR(255),
    PRIMARY KEY(id)
);

-- Inserir dados na tabela
INSERT INTO tb_produtos (nome, valor, estoque, categoria, marca, descricao)
VALUES ("Notebook Gamer", 4199.90, 20, "Eletrônicos", "Acer", "Notebook para alto desempenho");

-- Inserir mais dados na tabela
INSERT INTO tb_produtos (nome, valor, estoque, categoria, marca, descricao)
VALUES ("Notebook", 2199.99, 50, "Eletrônicos", "Samsung", "Notebook para uso casual"),
	   ("Mouse", 149.90, 25, "Acessórios", "Logitech", "Mouse sem fio"),
	   ("Monitor", 799.90, 15, "Eletrônicos", "Aoc", "Monitor Full HD 24 polegadas 120Hz"),
	   ("Teclado", 490.99, 200, "Acessórios", "Redragon", "Teclado Mecânico Sem Fio"),
	   ("Cadeira Gamer", 1199.90, 30, "Móveis", "ThunderX3", "Cadeira ergonômica para jogos"),
	   ("Headset", 299.90, 80, "Acessórios", "HyperX", "Headset com som surround"),
	   ("Impressora", 899.90, 15, "Eletrônicos", "HP", "Impressora multifuncional"),
	   ("Memória RAM", 249.90, 100, "Eletrônicos", "Kingston", "Memória DDR4 de 16GB 3200MHz");

-- Visualizar todos os dados
SELECT id, nome, estoque, categoria, marca, descricao,
concat('R$ ', FORMAT(valor, 2, 'pt-BR')) AS Valor
FROM tb_produtos;

-- Visualizar somente os produtos com valor maior que 500
SELECT id, nome, estoque, categoria, marca, descricao,
concat('R$ ', FORMAT(valor, 2, 'pt-BR')) AS Valor
FROM tb_produtos WHERE valor > 500.00;

-- Visualizar somente os produtos com valor menor que 500
SELECT id, nome, estoque, categoria, marca, descricao,
concat('R$ ', FORMAT(valor, 2, 'pt-BR')) AS Valor
FROM tb_produtos WHERE valor < 500.00;

-- Atualizar os atributos estoque e valor, onde id for igual a 5
UPDATE tb_produtos SET estoque = 60, valor = 379.90 WHERE id = 5;

-- Atualizar o atributo descricao, onde id for igual a 7
UPDATE tb_produtos SET descricao = "Headset com som surround e Wireless de 2,4GHz" WHERE id = 7;