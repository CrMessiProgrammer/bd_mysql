-- Criar Banco de Dados
CREATE DATABASE db_escola;

-- Acessar (Selecionar) o Banco de Dados
USE db_escola;

-- Criar Tabela
CREATE TABLE tb_estudantes(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    turma VARCHAR(50),
    nota_final DECIMAL(4,2) NOT NULL,
    status ENUM('aprovado(a)', 'reprovado(a)'),
    email VARCHAR(255),
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    situacao VARCHAR(20) DEFAULT 'ativo',
    PRIMARY KEY(id)
);

-- Inserir dados na tabela
INSERT INTO tb_estudantes (nome, data_nascimento, turma, nota_final, status, email, telefone, endereco, situacao)
VALUES ("Carlos Henrique", "2009-05-15", "9º A", 8.5, "aprovado(a)", "carlosh@gmail.com", "11 91234-5678", "Rua das Flores, 123", "ativo");

-- Inserir mais dados na tabela
INSERT INTO tb_estudantes (nome, data_nascimento, turma, nota_final, status, email, telefone, endereco, situacao)
VALUES ("Rafael Queiroz", "2009-08-25", "9º C", 7.5, "aprovado(a)", "rafaelq@gmail.com", "11 91256-3478", "Rua das Plantas, 34", "ativo"),
("Aimee Thompson", "2010-09-20", "8º B", 6.2, "reprovado(a)", "aimeet@gmail.com", "11 99876-5432", "Avenida Central, 456", "ativo"),
("Marcelo Nunes", "2012-12-01", "6º A", 7.8, "aprovado(a)", "marcelon@gmail.com", "11 93456-7890", "Rua do Sol, 789", "ativo"),
("Marcelo Henrique", "2011-03-22", "7º C", 5.5, "reprovado(a)", "marceloh@gmail.com", "11 97654-3210", "Praça das Árvores, 101", "ativo"),
("Marilene da Silva", "2009-07-30", "9º B", 9.0, "aprovado(a)", "marilenes@gmail.com", "11 96543-2109", "Alameda Azul, 202", "ativo"),
("Daniel Mendes", "2010-11-18", "8º A", 7.2, "aprovado(a)", "danielm@gmail.com", "11 95432-1098", "Travessa Verde, 303", "inativo"),
("Natalia Tavares", "2011-08-25", "7º A", 6.8, "reprovado(a)", "nataliat@gmail.com", "11 94321-0987", "Rua das Estrelas, 404", "ativo"),
("Tatiana Ferreira", "2009-04-14", "9º A", 4.9, "reprovado(a)", "tatiana@gmail.com", "11 93210-9876", "Estrada Nova, 505", "inativo");

-- Visualizar todos os dados
SELECT id, nome,
date_format(data_nascimento, '%d/%m/%Y') AS Data_Nascimento, turma, nota_final, status, email, telefone, endereco, situacao
FROM tb_estudantes;

-- Visualizar somente os estudantes com nota maior que 7.0
SELECT id, nome,
date_format(data_nascimento, '%d/%m/%Y') AS Data_Nascimento, turma, nota_final, status, email, telefone, endereco, situacao
FROM tb_estudantes WHERE nota_final > 7.0;

-- Visualizar somente os estudantes com nota menor que 7.0
SELECT id, nome,
date_format(data_nascimento, '%d/%m/%Y') AS Data_Nascimento, turma, nota_final, status, email, telefone, endereco, situacao
FROM tb_estudantes WHERE nota_final < 7.0;

-- Atualizar o atributo endereco, onde id for igual a 3
UPDATE tb_estudantes SET endereco = "Rua da Lua, 97" WHERE id = 3;

-- Atualizar o atributo situacao, onde id for igual a 5
UPDATE tb_estudantes SET situacao = "inativo" WHERE id = 5;