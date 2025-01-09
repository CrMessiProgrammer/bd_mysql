-- Criar Banco de Dados
CREATE DATABASE db_escola;

-- Acessar (Selecionar) o Banco de Dados
USE db_escola;

-- Criar Tabela
CREATE TABLE tb_turmas(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sala VARCHAR(50),
    PRIMARY KEY(id)
);

-- Inserir dados na tabela
INSERT INTO tb_turmas (nome, sala)
VALUES ("7º A", "Sala 101");

-- Inserir mais dados na tabela
INSERT INTO tb_turmas (nome, sala)
VALUES ("7º B", "Sala 102"),
	   ("7º C", "Sala 103"),
       ("8º A", "Sala 201"),
       ("8º B", "Sala 202"),
       ("8º C", "Sala 203"),
	   ("9º A", "Sala 301"),
       ("9º B", "Sala 302"),
       ("9º C", "Sala 303");
       
-- Visualizar todos os dados da tabela tb_turmas
SELECT * FROM tb_turmas;

-- Criar Tabela
CREATE TABLE tb_estudantes(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    nota_final DECIMAL(4,2) NOT NULL,
    status ENUM('aprovado(a)', 'reprovado(a)'),
    email VARCHAR(255),
    telefone VARCHAR(15),
    endereco VARCHAR(255),
    situacao VARCHAR(20) DEFAULT 'ativo',
    turma_id BIGINT, -- Relacionamento com a tabela departamentos
    PRIMARY KEY(id),
    FOREIGN KEY(turma_id) REFERENCES tb_turmas(id) -- Chave estrangeira
);

-- Inserir dados na tabela
INSERT INTO tb_estudantes (nome, data_nascimento, nota_final, status, email, telefone, endereco, situacao, turma_id)
VALUES ("Carlos Henrique", "2009-05-15", 8.5, "aprovado(a)", "carlosh@gmail.com", "11 91234-5678", "Rua das Flores, 123", "ativo", 7);

-- Inserir mais dados na tabela
INSERT INTO tb_estudantes (nome, data_nascimento, nota_final, status, email, telefone, endereco, situacao, turma_id)
VALUES ("Rafael Queiroz", "2009-08-25", 7.5, "aprovado(a)", "rafaelq@gmail.com", "11 91256-3478", "Rua das Plantas, 34", "ativo", 9),
("Aimee Thompson", "2010-09-20", 6.2, "reprovado(a)", "aimeet@gmail.com", "11 99876-5432", "Avenida Central, 456", "ativo", 5),
("Marcelo Nunes", "2011-12-01", 7.8, "aprovado(a)", "marcelon@gmail.com", "11 93456-7890", "Rua do Sol, 789", "ativo", 1),
("Marcelo Henrique", "2011-03-22", 5.5, "reprovado(a)", "marceloh@gmail.com", "11 97654-3210", "Praça das Árvores, 101", "ativo", 3),
("Marilene da Silva", "2009-07-30", 9.0, "aprovado(a)", "marilenes@gmail.com", "11 96543-2109", "Alameda Azul, 202", "ativo", 8),
("Daniel Mendes", "2010-11-18", 7.2, "aprovado(a)", "danielm@gmail.com", "11 95432-1098", "Travessa Verde, 303", "inativo", 4),
("Natalia Tavares", "2011-08-25", 6.8, "reprovado(a)", "nataliat@gmail.com", "11 94321-0987", "Rua das Estrelas, 404", "ativo", 1),
("Tatiana Ferreira", "2009-04-14", 4.9, "reprovado(a)", "tatiana@gmail.com", "11 93210-9876", "Estrada Nova, 505", "inativo", 7);

-- Visualizar todos os dados da tabela tb_estudantes
SELECT id, nome,
date_format(data_nascimento, '%d/%m/%Y') AS Data_Nascimento,
email, telefone, endereco, situacao, nota_final, status, turma_id
FROM tb_estudantes;

-- Visualizar somente os estudantes com nota maior que 7.0
SELECT id, nome,
date_format(data_nascimento, '%d/%m/%Y') AS Data_Nascimento,
email, telefone, endereco, situacao, nota_final, status, turma_id
FROM tb_estudantes WHERE nota_final > 7.0;

-- Visualizar somente os estudantes com nota menor que 7.0
SELECT id, nome,
date_format(data_nascimento, '%d/%m/%Y') AS Data_Nascimento,
email, telefone, endereco, situacao, nota_final, status, turma_id
FROM tb_estudantes WHERE nota_final < 7.0;

-- Visualizar todos os dados em ordem alfabética
SELECT id, nome,
date_format(data_nascimento, '%d/%m/%Y') AS Data_Nascimento,
email, telefone, endereco, situacao, nota_final, status, turma_id
FROM tb_estudantes ORDER BY nome ASC;

-- Visualizar todos os estudantes com o id, nome e sala da turma
SELECT tb_estudantes.nome, tb_estudantes.nota_final, tb_estudantes.status, tb_estudantes.turma_id,
tb_turmas.nome AS nome_turma,
tb_turmas.sala AS sala_turma
FROM tb_estudantes JOIN tb_turmas
ON tb_estudantes.turma_id = tb_turmas.id;

-- Atualizar o atributo endereco, onde id for igual a 3
UPDATE tb_estudantes SET endereco = "Rua da Lua, 97" WHERE id = 3;

-- Atualizar o atributo situacao, onde id for igual a 5
UPDATE tb_estudantes SET situacao = "inativo" WHERE id = 5;