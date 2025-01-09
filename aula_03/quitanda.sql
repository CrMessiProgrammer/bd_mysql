-- Apagar Banco de Dados db_quitanda
DROP DATABASE db_quitanda;
 
-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;
 
-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;
 
-- Criar a tabela mãe tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);
 
-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");
 
INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");
 
INSERT INTO tb_categorias (descricao)
VALUES ("outros");
 
-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;
 
-- Criar a Tabela filho tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id) -- qual
);
 
-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);
 
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);
 
INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);
 
INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);
 
-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

-- Exibe todos os produtos ordenando por nome
SELECT * FROM tb_produtos ORDER BY nome ASC;

-- Exibe todos os produtos ordenando por nome em ordem decrescente
SELECT * FROM tb_produtos ORDER BY nome DESC;

-- Exibe todos os produtos ordenando por nome e preco
SELECT * FROM tb_produtos ORDER BY nome, preco;

/*Operadores Lógicos*/ 

-- AND (E)
SELECT * FROM tb_produtos WHERE preco > 5.00 AND categoria_id = 2;

-- OR (OU)
SELECT * FROM tb_produtos WHERE preco > 5.00 OR categoria_id = 2;

-- NOT (NÃO)
SELECT * FROM tb_produtos WHERE NOT categoria_id = 1;

/*Operadores In e Between*/ 

-- O preço deve ser 20, 30 ou 40 Reais
SELECT * FROM tb_produtos WHERE preco IN (5.00, 10.00, 15.00);

-- O preço deve estar entre 20 e 40
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 15.00;

-- O preço deve estar entre 20 e 40, em Ordem crecsente por nome do produto
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 15 ORDER BY nome;

-- A Data de Validade deve estar entre 10 e 15 de Março de 2022,
-- em Ordem crecsente por Data de Validade e nome do produto
SELECT * FROM tb_produtos WHERE dtvalidade BETWEEN '2022-03-10' AND '2022-03-15' ORDER BY dtvalidade, nome;

/*Operador Like*/ 

-- RA% (Localiza os produtos cujo nome inicie com RA);
SELECT * FROM tb_produtos WHERE nome LIKE 'RA%';

-- %RA% (Localiza os produtos cujo nome contenha RA)
SELECT * FROM tb_produtos WHERE nome LIKE '%RA%';

-- %RA (Localiza os produtos cujo nome termine em RA)
SELECT * FROM tb_produtos WHERE nome LIKE '%RA';

-- Verifica se a IDE restringe/se importa com especificações nos caracteres (acentos no geral, e à letras maiúsculas ou minúsculas)
SELECT @@collation_database;

/* Operadores Matemáticos - Agregação */ 

-- Calcule a soma dos preços
SELECT sum(preco) as soma FROM tb_produtos;

-- Calcule a média de preço
SELECT avg(preco) as media FROM tb_produtos;

-- Exibir a Categoria_id e Calcular a média de preço, agrupando por Categoria_id
SELECT categoria_id, AVG(preco) AS media_preco FROM tb_produtos GROUP BY categoria_id;

-- Conta o total de produtos (linhas) na tabela
SELECT count(*) as contar FROM tb_produtos;

-- Conta o total de linhas da coluna categoria_id (os null são ignorados)
SELECT count(categoria_id) as contar FROM tb_produtos;

-- Mostra o Maior Preço na tabela
SELECT max(preco) as maior_preco FROM tb_produtos;

-- Mostra o Menor Preço na tabela
SELECT min(preco) as menor_preco FROM tb_produtos;

/* Operador Join*/ 

-- Combina dados de duas ou mais tabelas, baseando-se em uma coluna comum (nesse caso 'id', tanto na tabela tb_produtos quanto na tb_categorias)
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- Retorna todos os registros da tabela da esquerda e os correspondentes da tabela da direita.
-- Se não houver correspondência, os valores da tabela da direita aparecem como NULL.
SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- Retorna todos os registros da tabela da direita e os correspondentes da tabela da esquerda.
-- Se não houver correspondência, os valores da tabela da esquerda aparecem como NULL.
SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- Group By - Agrupa os valores a partir de um atributo (nesse caso 'descricao'), e mostra o preco_medio por categoria
SELECT tb_categorias.descricao, avg(preco) as preco_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao; -- Agrupa tudo por descricao

-- Group By + Having - Agrupa os valores a partir de um atributo e filtra de acordo com a condição
-- a cláusula HAVING é usada para filtrar os resultados de uma consulta após a aplicação da função 
-- de agregação (SUM, COUNT, AVG, etc.), nesse caso vai trazer as categorias cujo preco_medio seja maior que 5. 
-- Isso é diferente da cláusula WHERE, que filtra as linhas antes da agregação.
-- https://www.w3schools.com/sql/sql_having.asp
SELECT tb_categorias.descricao, avg(preco) as preco_medio
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao
HAVING preco_medio > 5	-- Agrupa tudo por descricao
ORDER BY tb_categorias.descricao;	-- Ordena a descricao

-- Traz somente os produtos cuja categoria (e descricao) seja igual a 2
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_produtos.categoria_id = 2;