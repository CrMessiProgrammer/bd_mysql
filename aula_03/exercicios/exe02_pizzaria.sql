-- Criar Banco de Dados
CREATE DATABASE db_pizzaria_legal;

-- Acessar (Selecionar) o Banco de Dados
USE db_pizzaria_legal;

-- Criar Tabela
CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    tipo VARCHAR(100) NOT NULL,
    descricao TEXT,
    PRIMARY KEY(id)
);

-- Inserir dados na tabela (1ºteste)
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("vegetariana", "ingredientes vegetarianos e naturais");

-- Inserir mais dados na tabela
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("tradicional", "tradicionais de carne, calabresa, frango, queijo e bacon"),
	   ("especial", "sabores exclusivos e ingredientes especiais"),
       ("doces", "coberturas doces como chocolate e doce de leite"),
       ("vegana", "sem nenhum ingrediente de origem animal"),
       ("gourmet", "ingredientes premium ou combinações diferenciadas"),
       ("outros", NULL);

-- Visualizar todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar Tabela
CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    ingredientes TEXT NOT NULL,
    tamanho ENUM('pequena', 'média', 'grande') NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    categoria_id BIGINT,
    PRIMARY KEY(id),
    FOREIGN KEY(categoria_id) REFERENCES tb_categorias(id)
);

-- Inserir dados na tabela (1ºteste)
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Marguerita", "Mussarela, tomate, manjericão", "média", 39.90, 1);

-- Inserir mais dados na tabela
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Calabresa", "Mussarela, calabresa, cebola", "grande", 49.90, 2),
	   ("Quatro Queijos", "Mussarela, parmesão, gorgonzola, provolone", "média", 54.90, 3),
       ("Chocolate", "Chocolate, creme de leite, granulado", "pequena", 29.90, 4),
       ("Vegana", "Queijo vegano, cogumelos, rúcula", "média", 42.90, 5),
       ("Gourmet de Parma", "Mussarela de búfala, presunto de Parma, rúcula", "grande", 104.90, 6),
       ("Portuguesa", "Mussarela, presunto, ovo, cebola", "grande", 44.90, 2),
       ("Brigadeiro", "Brigadeiro, chocolate granulado", "pequena", 25.90, 4),
       ("Caprese", "Mussarela de búfala, tomate cereja, manjericão", "média", 52.90, 3),
       ("Frango com Catupiry", "Mussarela, frango, catupiry", "grande", 47.90, 2);

-- Visualizar todos os dados da tabela tb_pizzas
SELECT id, nome, ingredientes, tamanho,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, categoria_id
FROM tb_pizzas;

-- Visualizar somente as pizzas com preços maior que R$ 45,00
SELECT id, nome, ingredientes, tamanho,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, categoria_id
FROM tb_pizzas WHERE preco > 45.00;

-- Visualizar somente as pizzas com preços entre R$ 50,00 e R$ 100,00
SELECT id, nome, ingredientes, tamanho,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, categoria_id
FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00; -- entre (valor_inicial and valor_final)

-- Visualizar somente as pizzas que possuam a letra M no atributo nome
SELECT id, nome, ingredientes, tamanho,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, categoria_id
FROM tb_pizzas WHERE nome LIKE '%M%';

-- Visualizar somente as pizzas cujo ingrediente contenha Presunto
SELECT id, nome, ingredientes, tamanho,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, categoria_id
FROM tb_pizzas WHERE ingredientes LIKE '%Presunto%';

-- Visualizar combinando os dados da tb_pizzas e da tb_categorias
-- Informando a tabela antes do atributo (tb_pizzas.id) p/ ñ ter conflito de atributo nas tabelas
SELECT tb_pizzas.id AS Id_Pizza,
tb_pizzas.nome AS Nome_Pizza,
tb_pizzas.ingredientes AS Ingredientes,
tb_pizzas.tamanho AS Tamanho,
concat('R$ ', FORMAT(tb_pizzas.preco, 2, 'pt-BR')) AS Preco,
tb_categorias.tipo AS Tipo_Categoria
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id;

-- Visualizar somente as pizzas que pertencem a categoria 'Doces'
SELECT tb_pizzas.id AS Id_Pizza,
tb_pizzas.nome AS Nome_Pizza,
tb_pizzas.ingredientes AS Ingredientes,
tb_pizzas.tamanho AS Tamanho,
concat('R$ ', FORMAT(tb_pizzas.preco, 2, 'pt-BR')) AS Preco,
tb_categorias.tipo AS Tipo_Categoria
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo = 'doces';

-- Visualizar categoria_id e calcular a média de preço de cada categoria
SELECT tb_pizzas.categoria_id,
tb_categorias.tipo AS tipo_categoria,
CONCAT('R$ ', FORMAT(AVG(tb_pizzas.preco), 2, 'pt-BR')) AS media_preco
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
GROUP BY tb_pizzas.categoria_id, tb_categorias.tipo;

-- Visualizar categoria e média_preco, mostrando na ordem decrescente (do maior para o menor)
SELECT tb_pizzas.categoria_id,
tb_categorias.tipo AS tipo_categoria,
CONCAT('R$ ', FORMAT(AVG(tb_pizzas.preco), 2, 'pt-BR')) AS media_preco
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_id = tb_categorias.id
GROUP BY tb_pizzas.categoria_id, tb_categorias.tipo ORDER BY AVG(tb_pizzas.preco) DESC;