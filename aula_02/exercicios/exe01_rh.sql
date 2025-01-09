-- Criar Banco de Dados
CREATE DATABASE db_rh;

-- Acessar (Selecionar) o Banco de Dados
USE db_rh;

-- Criar Tabela
CREATE TABLE tb_departamentos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

-- Inserir dados na tabela
INSERT INTO tb_departamentos (nome)
VALUES ("Recursos Humanos (RH)");

-- Inserir mais dados na tabela
INSERT INTO tb_departamentos (nome)
VALUES ("Tecnologia da Informação (TI)"),
	   ("Marketing"),
       ("Comercial"),
       ("Administrativo"),
       ("outros");

-- Visualizar todos os dados da tabela tb_departamentos
SELECT * FROM tb_departamentos;

-- Criar Tabela
CREATE TABLE tb_colaboradores(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_admissao DATE,
    email VARCHAR(255) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2),
    status ENUM('ativo', 'inativo'),
    departamento_id BIGINT, -- Relacionamento com a tabela departamentos
    PRIMARY KEY(id),
    FOREIGN KEY(departamento_id) REFERENCES tb_departamentos(id) -- Chave estrangeira
);

-- Inserir dados na tabela
INSERT INTO tb_colaboradores (nome, data_admissao, email, cargo, salario, status, departamento_id)
VALUES ("Carlos Henrique", "2024-01-10", "carlos@gmail.com", "Desenvolvedor Back End", 2000.00, "ativo", 2);

-- Inserir mais dados na tabela
INSERT INTO tb_colaboradores (nome, data_admissao, email, cargo, salario, status, departamento_id)
VALUES ("Marcelo Nunes", "2014-10-10", "marcelon@gmail.com", "Analista de Marketing", 5000.00, "ativo", 3),
	   ("Marcelo Henrique", "2024-10-12", "marceloh@gmail.com", "Desenvolvedor Front End", 1800.00, "inativo", 2),
	   ("Rafael Queiroz", "2010-01-05", "rafaelq@gmail.com", "Desenvolvedor Full Stack", 10000.00, "ativo", 2),
	   ("Aimee Thompson", "2012-07-12", "aimeet@gmail.com", "Desenvolvedora Full Stack", 10000.00, "ativo", 2),
	   ("Daniel Mendes", "2018-01-10", "danielm@gmail.com", "Gerente de Recursos Humanos", 6000.00, "inativo", 1),
	   ("Tatiana Ferreira", "2022-08-05", "tatiana@gmail.com", "Assistente Administrativo", 3200.00, "ativo", 5),
	   ("Marilene da Silva", "2022-02-11", "marilenes@gmail.com", "Gerente de Recursos Humanos", 6500.00, "ativo", 1),
	   ("Natalia Tavares", "2023-05-05", "nataliat@gmail.com", "Consultora de Vendas", 4200.00, "ativo", 4);

-- Visualizar todos os dados da tabela tb_colaboradores
SELECT id, nome, email, cargo,
concat('R$ ', FORMAT(salario, 2, 'pt-BR')) AS Salario,
date_format(data_admissao, '%d/%m/%Y') AS Data_Admissao, status, departamento_id
FROM tb_colaboradores;

-- Visualizar somente os colaboradores com salário maior que 2000
SELECT id, nome, email, cargo,
concat('R$ ', FORMAT(salario, 2, 'pt-BR')) AS Salario,
date_format(data_admissao, '%d/%m/%Y') AS Data_Admissao, status, departamento_id
FROM tb_colaboradores WHERE salario > 2000;

-- Visualizar somente os colaboradores com salário menor que 2000
SELECT id, nome, email, cargo,
concat('R$ ', FORMAT(salario, 2, 'pt-BR')) AS Salario,
date_format(data_admissao, '%d/%m/%Y') AS Data_Admissao, status, departamento_id
FROM tb_colaboradores WHERE salario < 2000;

-- Visualizar todos os dados em ordem alfabética
SELECT id, nome, email, cargo,
concat('R$ ', FORMAT(salario, 2, 'pt-BR')) AS Salario,
date_format(data_admissao, '%d/%m/%Y') AS Data_Admissao, status, departamento_id
FROM tb_colaboradores ORDER BY nome ASC;

-- Visualizar com INNER JOIN (junção) entre as tabelas
SELECT tb_colaboradores.id,
tb_colaboradores.nome AS nome_colaborador,
tb_colaboradores.cargo, tb_colaboradores.departamento_id,
tb_departamentos.nome AS nome_departamento,
tb_colaboradores.salario, tb_colaboradores.status
FROM tb_colaboradores INNER JOIN tb_departamentos 
ON tb_colaboradores.departamento_id = tb_departamentos.id;

-- Visualizar colaboradores de um departamento específico (nesse caso, 'Tecnologia da Informação (TI)')
SELECT tb_colaboradores.id,
tb_colaboradores.nome AS nome_colaborador,
tb_colaboradores.cargo,
tb_departamentos.nome AS nome_departamento,
tb_colaboradores.status
FROM tb_colaboradores INNER JOIN tb_departamentos 
ON tb_colaboradores.departamento_id = tb_departamentos.id
WHERE tb_departamentos.nome = "Tecnologia da Informação (TI)";

-- Atualizar o atributo salario, onde id for igual a 4
UPDATE tb_colaboradores SET salario = 12000.00 WHERE id = 4;

-- Atualizar o atributo status, onde id for igual a 9
UPDATE tb_colaboradores SET status = "inativo" WHERE id = 9;