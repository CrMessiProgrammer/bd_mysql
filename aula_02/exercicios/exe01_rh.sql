-- Criar Banco de Dados
CREATE DATABASE db_rh;

-- Acessar (Selecionar) o Banco de Dados
USE db_rh;

-- Criar Tabela
CREATE TABLE tb_colaboradores(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_admissao DATE,
    email VARCHAR(255) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2),
    status ENUM('ativo', 'inativo'),
    PRIMARY KEY(id)
);

-- Inserir dados na tabela
INSERT INTO tb_colaboradores (nome, data_admissao, email, cargo, departamento, salario, status)
VALUES ("Carlos Henrique", "2024-01-10", "carlos@gmail.com", "Desenvolvedor Back End", "Tecnologia da Informação (TI)", 2000.00, "ativo");

-- Inserir mais dados na tabela
INSERT INTO tb_colaboradores (nome, data_admissao, email, cargo, departamento, salario, status)
VALUES ("Marcelo Nunes", "2014-10-10", "marcelon@gmail.com", "Analista de Marketing", "Marketing", 5000.00, "ativo"),
	   ("Marcelo Henrique", "2024-10-12", "marceloh@gmail.com", "Desenvolvedor Front End", "Tecnologia da Informação (TI)", 1800.00, "inativo"),
	   ("Rafael Queiroz", "2010-01-05", "rafaelq@gmail.com", "Desenvolvedor Full Stack", "Tecnologia da Informação (TI)", 10000.00, "ativo"),
	   ("Aimee Thompson", "2012-07-12", "aimeet@gmail.com", "Desenvolvedora Full Stack", "Tecnologia da Informação (TI)", 10000.00, "ativo"),
	   ("Daniel Mendes", "2018-01-10", "danielm@gmail.com", "Gerente de Recursos Humanos", "Recursos Humanos (RH)", 6000.00, "inativo"),
	   ("Tatiana Ferreira", "2022-08-05", "tatiana@gmail.com", "Assistente Administrativo", "Administração", 3200.00, "ativo"),
	   ("Marilene da Silva", "2022-02-11", "marilenes@gmail.com", "Gerente de Recursos Humanos", "Recursos Humanos (RH)", 6500.00, "ativo"),
	   ("Natalia Tavares", "2023-05-05", "nataliat@gmail.com", "Consultora de Vendas", "Comercial", 4200.00, "ativo");

-- Visualizar todos os dados
SELECT id, nome, email, cargo, departamento, status,
date_format(data_admissao, '%d/%m/%Y') AS Data_Admissao,
concat('R$ ', FORMAT(salario, 2, 'pt-BR')) AS Salario
FROM tb_colaboradores;

-- Visualizar somente os colaboradores com salário maior que 2000
SELECT id, nome, email, cargo, departamento, status,
date_format(data_admissao, '%d/%m/%Y') AS Data_Admissao,
concat('R$ ', FORMAT(salario, 2, 'pt-BR')) AS Salario
FROM tb_colaboradores WHERE salario > 2000;

-- Visualizar somente os colaboradores com salário menor que 2000
SELECT id, nome, email, cargo, departamento, status,
date_format(data_admissao, '%d/%m/%Y') AS Data_Admissao,
concat('R$ ', FORMAT(salario, 2, 'pt-BR')) AS Salario
FROM tb_colaboradores WHERE salario < 2000;

-- Atualizar o atributo salario, onde id for igual a 4
UPDATE tb_colaboradores SET salario = 12000.00 WHERE id = 4;

-- Atualizar o atributo status, onde id for igual a 9
UPDATE tb_colaboradores SET status = "inativo" WHERE id = 9;