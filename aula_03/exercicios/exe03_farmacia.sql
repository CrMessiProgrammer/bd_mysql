-- Criar Banco de Dados
CREATE DATABASE db_farmacia_bem_estar;

-- Acessar (Selecionar) o Banco de Dados
USE db_farmacia_bem_estar;

-- Criar Tabela
CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    tipo VARCHAR(100) NOT NULL,
    descricao TEXT,
    PRIMARY KEY(id)
);

-- Inserir dados na tabela (1ºteste)
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("medicamentos", "produtos farmacêuticos para tratamento de doenças e sintomas.");

-- Inserir mais dados na tabela
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("vitaminas", "suplementos para reforçar a saúde e o bem-estar."),
	   ("cosméticos", "produtos de beleza e cuidados com a pele."),
       ("higiene", "produtos para higiene pessoal e cuidados diários."),
       ("infantil", "produtos voltados para cuidados infantis, como fraldas e lenços."),
       ("ortopédicos", "produtos para apoio e tratamento ortopédico."),
       ("suplementos", "produtos alimentares com propriedades nutricionais especiais."),
       ("outros", NULL);

-- Visualizar todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar Tabela
CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100),
    preco DECIMAL(8,2) NOT NULL,
    quantidade INT NOT NULL,
    validade DATE,
    descricao TEXT,
    categoria_id BIGINT,
    PRIMARY KEY(id),
    FOREIGN KEY(categoria_id) REFERENCES tb_categorias(id)
);

-- Inserir dados na tabela (1ºteste)
INSERT INTO tb_produtos (nome, fabricante, preco, quantidade, validade, descricao, categoria_id)
VALUES ("Dipirona", "PharmaTech", 4.99, 50, "2026-01-01", "Medicamento analgésico e antitérmico.", 1);

-- Inserir mais dados na tabela
INSERT INTO tb_produtos (nome, fabricante, preco, quantidade, validade, descricao, categoria_id)
VALUES ("Vitamina C", "BioLife", 19.90, 30, "2025-12-15", "Suplemento de vitamina C para reforçar a imunidade.", 2),
	   ("Creme Hidratante", "BeautyCare", 35.90, 20, "2025-07-30", "Creme hidratante para cuidados diários com a pele.", 3),
       ("Shampoo Anticaspa", "HairHealth", 18.50, 15, "2024-12-31", "Shampoo para tratamento de caspa e hidratação capilar.", 4),
       ("Fraldas Tamanho G", "BabyComfort", 45.90, 40, "2026-03-20", "Fraldas descartáveis para crianças de até 12kg.", 5),
       ("Joelheira Ortopédica", "OrthoLife", 120.00, 10, NULL, "Joelheira ajustável para suporte e proteção.", 6),
       ("Whey Protein", "FitNutri", 99.90, 25, "2025-08-10", "Suplemento alimentar para aumento de massa muscular.", 7),
       ("Kit Primeiros Socorros", "SafetyBox", 150.00, 5, NULL, "Kit com itens essenciais para emergências médicas.", 8),
       ("Paracetamol", "PharmaTech", 6.90, 60, "2026-02-15", "Medicamento analgésico indicado para dores e febre.", 1),
       ("Lenços Umedecidos", "BabyComfort", 12.50, 100, "2025-06-30", "Lenços umedecidos para uso infantil.", 5);

-- Visualizar todos os dados da tabela tb_produtos;
SELECT id, nome, fabricante,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, quantidade,
date_format(validade, '%d/%m/%Y') AS Data_Validade, descricao, categoria_id
FROM tb_produtos;

-- Visualizar somente os produtos com preços maior que R$ 50,00
SELECT id, nome, fabricante,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, quantidade,
date_format(validade, '%d/%m/%Y') AS Data_Validade, descricao, categoria_id
FROM tb_produtos WHERE preco > 50.00;

-- Visualizar somente os produtos com preços entre R$ 5,00 e R$ 60,00
SELECT id, nome, fabricante,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, quantidade,
date_format(validade, '%d/%m/%Y') AS Data_Validade, descricao, categoria_id
FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00; -- entre (valor_inicial and valor_final)

-- Visualizar somente os produtos com a validade entre inicio de 2026 a final de 2026
SELECT id, nome,
date_format(validade, '%d/%m/%Y') AS Data_Validade, fabricante,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, quantidade,
descricao, categoria_id
FROM tb_produtos WHERE validade BETWEEN '2026-1-1' AND '2026-12-31'; -- entre (valor_inicial and valor_final)

-- Visualizar somente os produtos que possuam a letra C no atributo nome
SELECT id, nome, fabricante,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, quantidade,
date_format(validade, '%d/%m/%Y') AS Data_Validade, descricao, categoria_id
FROM tb_produtos WHERE nome LIKE '%C%';

-- Visualizar combinando os dados da tb_produtos e da tb_categorias
-- Informando a tabela antes do atributo (tb_produtos.id) p/ ñ ter conflito de atributo nas tabelas
SELECT tb_produtos.id AS Id_Produto,
tb_produtos.nome AS Nome_Produto,
tb_produtos.fabricante AS Fabricante,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco,
tb_produtos.quantidade AS Quantidade,
date_format(validade, '%d/%m/%Y') AS Data_Validade,
tb_produtos.descricao AS Descricao,
tb_categorias.tipo AS Tipo_Categoria
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- Visualizar somente os produtos que pertencem a categoria 'cosméticos'
SELECT tb_produtos.id AS Id_Produto,
tb_produtos.nome AS Nome_Produto,
tb_produtos.fabricante AS Fabricante,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco,
tb_produtos.quantidade AS Quantidade,
date_format(validade, '%d/%m/%Y') AS Data_Validade,
tb_produtos.descricao AS Descricao,
tb_categorias.tipo AS Tipo_Categoria
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.tipo = 'cosméticos';

-- Visualizar categoria_id e calcular a média de preço de cada categoria
SELECT tb_produtos.categoria_id,
tb_categorias.tipo AS tipo_categoria,
CONCAT('R$ ', FORMAT(AVG(tb_produtos.preco), 2, 'pt-BR')) AS media_preco
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_produtos.categoria_id, tb_categorias.tipo;

-- Visualizar categoria e média_preco, mostrando na ordem decrescente (do maior para o menor)
SELECT tb_produtos.categoria_id,
tb_categorias.tipo AS tipo_categoria,
CONCAT('R$ ', FORMAT(AVG(tb_produtos.preco), 2, 'pt-BR')) AS media_preco
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_produtos.categoria_id, tb_categorias.tipo ORDER BY AVG(tb_produtos.preco) DESC;