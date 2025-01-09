-- Criar Banco de Dados
CREATE DATABASE db_loja;

-- Acessar (Selecionar) o Banco de Dados
USE db_loja;

-- Criar Tabela
CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

-- Inserir dados na tabela
INSERT INTO tb_categorias (nome)
VALUES ("Acessórios");

-- Inserir mais dados na tabela
INSERT INTO tb_categorias (nome)
VALUES ("Eletrônicos"),
	   ("Móveis"),
       ("outros");
       
-- Visualizar todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar Tabela
CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL (8,2) NOT NULL,
    estoque INT NOT NULL,
    marca VARCHAR(20),
    descricao VARCHAR(255),
    categoria_id BIGINT, -- Relacionamento com a tabela departamentos
    PRIMARY KEY(id),
    FOREIGN KEY(categoria_id) REFERENCES tb_categorias(id) -- Chave estrangeira
);

-- Inserir dados na tabela
INSERT INTO tb_produtos (nome, valor, estoque, marca, descricao, categoria_id)
VALUES ("Notebook Gamer", 4199.90, 20, "Acer", "Notebook para alto desempenho", 2);

-- Inserir mais dados na tabela
INSERT INTO tb_produtos (nome, valor, estoque, marca, descricao, categoria_id)
VALUES ("Notebook", 2199.99, 50, "Samsung", "Notebook para uso casual", 2),
	   ("Mouse", 149.90, 25, "Logitech", "Mouse sem fio", 1),
	   ("Monitor", 799.90, 15, "Aoc", "Monitor Full HD 24 polegadas 120Hz", 2),
	   ("Teclado", 490.99, 200, "Redragon", "Teclado Mecânico Sem Fio", 1),
	   ("Cadeira Gamer", 1199.90, 30, "ThunderX3", "Cadeira ergonômica para jogos", 3),
	   ("Headset", 299.90, 80, "HyperX", "Headset com som surround", 1),
	   ("Impressora", 899.90, 15, "HP", "Impressora multifuncional", 2),
	   ("Memória RAM", 249.90, 100, "Kingston", "Memória DDR4 de 16GB 3200MHz", 2);

-- Visualizar todos os dados da tabela tb_produtos
SELECT id, nome, estoque, marca, descricao,
concat('R$ ', FORMAT(valor, 2, 'pt-BR')) AS Valor, categoria_id
FROM tb_produtos;

-- Visualizar somente os produtos com valor maior que 500
SELECT id, nome, estoque, marca, descricao,
concat('R$ ', FORMAT(valor, 2, 'pt-BR')) AS Valor, categoria_id
FROM tb_produtos WHERE valor > 500.00;

-- Visualizar somente os produtos com valor menor que 500
SELECT id, nome, estoque, marca, descricao,
concat('R$ ', FORMAT(valor, 2, 'pt-BR')) AS Valor, categoria_id
FROM tb_produtos WHERE valor < 500.00;

-- Visualizar todos os dados em ordem de categoria
SELECT id, nome, estoque, marca, descricao,
concat('R$ ', FORMAT(valor, 2, 'pt-BR')) AS Valor, categoria_id
FROM tb_produtos ORDER BY categoria ASC;

-- Visualizar os produtos e suas respectivas categorias
SELECT tb_produtos.id AS id_produto,
tb_produtos.nome AS nome_produto,
tb_produtos.valor, tb_produtos.estoque, tb_produtos.marca, tb_produtos.descricao, tb_produtos.categoria_id,
tb_categorias.nome AS nome_categoria
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- Atualizar os atributos estoque e valor, onde id for igual a 5
UPDATE tb_produtos SET estoque = 60, valor = 379.90 WHERE id = 5;

-- Atualizar o atributo descricao, onde id for igual a 7
UPDATE tb_produtos SET descricao = "Headset com som surround e Wireless de 2,4GHz" WHERE id = 7;