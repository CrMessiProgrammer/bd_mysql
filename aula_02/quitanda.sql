-- cria o banco de dados
CREATE DATABASE db_quitanda;

-- acessa o banco de dados
USE db_quitanda;

-- cria uma tabela dentro do banco selecionado acima
CREATE TABLE tb_produtos(
	id bigint auto_increment, -- irá se auto incrementar
    nome varchar(255) not null, -- ñ pode ser nulo
    quantidade int,
    data_validade date,
    preco decimal, -- por se tratar se valores precisos, usar o 'decimal' e não o 'float'
    primary key(id)
);

-- irá alterar a tabela 'tb_produtos' e modificar o atributo 'preco'
-- modificará a estrutura desse atributo 'preco'(6 números totais, 2 depois da vírgula)
ALTER TABLE tb_produtos MODIFY preco decimal(6,2);

-- irá alterar a tabela 'tb_produtos' e adicionar o atributo 'descricao'
ALTER TABLE tb_produtos ADD descricao varchar(255);

-- mostra a estrutura atual da tabela 'tb_produtos'
DESC tb_produtos;

-- MODIFY muda a estrutura do atributo, já o CHANGE muda o nome do atributo --

-- através da CHANGE consegue mudar o nome do atributo
ALTER TABLE tb_produtos CHANGE descricao descricao_produto varchar(500);

-- através do DROP consegue apagar o atributo
ALTER TABLE tb_produtos DROP descricao_produto;

-- irá inserir na tabela 'tb_produtos' e nos atributos mencionados os valores passados
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("Tomate", 100, "2024-01-10", 8.00);

-- irá inserir na tabela 'tb_produtos' e nos atributos mencionados os valores passados
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("Pepino", 57, "2025-02-13", 9.50),
       ("Cenoura", 20, "2025-01-20", 7.00),
       ("Cebola", 60, "2025-03-07", 5.00),
       ("Repolho", 30, "2025-02-02", 3.00);

-- irá inserir na tabela 'tb_produtos' e nos atributos mencionados os valores passados
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("Tomate Italiano", 100, "2024-01-10", 8.00);

-- irá listar toda a tabela 'tb_produtos'
SELECT * FROM tb_produtos;

-- irá listar somente os atributos 'nome' e 'preco' da tabela 'tb_produtos'
SELECT nome, preco FROM tb_produtos;

-- irá listar apenas o elemento que tenha o 'id = 1' na tabela 'tb_produtos'
SELECT * FROM tb_produtos WHERE id = 1;

-- irá listar apenas os elementos que tenham o 'preco > 4.00' na tabela 'tb_produtos'
SELECT * FROM tb_produtos WHERE preco > 4.00;

-- irá listar apenas os elementos que tenham o 'preco > 2.00' E o 'nome = "Repolho"'
SELECT * FROM tb_produtos WHERE preco > 2.00 AND nome = "Repolho";

-- irá listar apenas os elementos que tenham o 'preco > 5.00' OU o 'nome = "Tomate"'
SELECT * FROM tb_produtos WHERE preco > 5.00 OR nome = "Tomate";

-- irá listar todos os elementos que tenha o 'nome != "Tomate"' na tabela 'tb_produtos'
SELECT * FROM tb_produtos WHERE nome != "Tomate";

-- formata na exibição
-- CONCAT junta o valores (o R$ e o FORMAT)
-- FORMAT formata a exibição do atributo informado ('preco', o número de casas decimais, país modelo)
-- AS atribui um apelido para a função descrita anteriormente
SELECT nome AS Nome_Completo,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco
FROM tb_produtos;

-- formata na exibição
-- DATE_FORMAT formata a exibição do atributo informado ('preco', o número de casas decimais, país modelo)
-- AS atribui um apelido para a função descrita anteriormente
SELECT nome,
date_format(data_validade, '%d/%m/%Y') AS Data_Validade
FROM tb_produtos;

-- atualiza a tabela 'tb_produtos' e defini 'preco' com o valor de 9.50, onde o 'id = 2'
UPDATE tb_produtos SET preco = 9.50 WHERE id = 2;

/*
	-- desabilita a trava de segurança (NÃO RECOMENDADO usar)
	SET SQL_SAFE_UPDATES = 0;
*/

-- apaga o elemento da tabela 'tb_produtos', onde o 'id = 6'
DELETE FROM tb_produtos WHERE id = 6;

/*
	normalmente nas grandes empresas não se apaga os elementos, apenas desativa a conta
    usando o tipo boolean, para se caso o cliente voltar, os dados já estarem guardados 
*/