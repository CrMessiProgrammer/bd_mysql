-- Criar Banco de Dados
CREATE DATABASE db_curso_da_minha_vida;

-- Acessar (Selecionar) o Banco de Dados
USE db_curso_da_minha_vida;

-- Criar Tabela
CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    tipo ENUM('Soft Skills', 'Hard Skills'),
    PRIMARY KEY(id)
);

-- Inserir dados na tabela (1ºteste)
INSERT INTO tb_categorias (nome, descricao, tipo)
VALUES ("Tecnologia", "Voltado para desenvolvimento de habilidades técnicas como programação, inteligência artificial e redes.", "Hard Skills");

-- Inserir mais dados na tabela
INSERT INTO tb_categorias (nome, descricao, tipo)
VALUES ("Comunicação", "Técnicas para falar em público, escrita persuasiva e escuta ativa.", "Soft Skills"),
("Gestão de Projetos", "Capacita para planejar, executar e monitorar projetos utilizando metodologias como SCRUM e Kanban.", "Hard Skills"),
("Finanças", "Focado em gestão financeira pessoal ou corporativa, abordando investimentos e orçamento.", "Hard Skills"),
("Marketing Digital", "Estratégias para campanhas online, SEO, redes sociais e análise de dados.", "Hard Skills"),
("Design e Criatividade", "Focado em design gráfico, UX/UI e habilidades criativas para solucionar problemas.", "Hard Skills"),
("Idiomas", "Aprendizado de novos idiomas para comunicação em diferentes contextos.", "Hard Skills"),
("Bem-estar e Inteligência Emocional", "Desenvolvimento de autoconhecimento, resiliência e empatia.", "Soft Skills"),
("Outros", NULL, NULL);

-- Visualizar todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar Tabela
CREATE TABLE tb_cursos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    preco DECIMAL(8,2) NOT NULL,
    disponibilidade ENUM('sim', 'não'),
    descricao TEXT,
    categoria_id BIGINT,
    PRIMARY KEY(id),
    FOREIGN KEY(categoria_id) REFERENCES tb_categorias(id)
);

-- Inserir dados na tabela (1ºteste)
INSERT INTO tb_cursos (nome, carga_horaria, preco, disponibilidade, descricao, categoria_id)
VALUES ("Desenvolvimento Full-Stack com JavaScript", 120, 1500.00, "sim", "Curso completo de desenvolvimento web utilizando JavaScript.", 1);

-- Inserir mais dados na tabela
INSERT INTO tb_cursos (nome, carga_horaria, preco, disponibilidade, descricao, categoria_id)
VALUES ("Gestão Ágil de Projetos", 60, 800.00, "sim", "Métodos ágeis para gerenciamento de projetos.", 3),
("Marketing Digital para Iniciantes", 60, 600.00, "sim", "Marketing digital focado em redes sociais e estratégias de tráfego.", 5),
("Fotografia Digital Criativa", 50, 500.00, "sim", "Para quem deseja aprender a capturar imagens criativas e profissionais.", 6),
("Inglês para Viagens", 40, 400.00, "sim", "Focado em vocabulário e situações de viagens.", 7),
("Planejamento Financeiro Pessoal", 50, 500.00, "sim", "Como organizar e controlar as finanças pessoais e investimentos.", 4),
("Gestão Financeira para Pequenos Negócios", 80, 850.00, "sim", "Para empreendedores e donos de pequenos negócios.", 4),
("Comunicação Assertiva", 10, 80.00, "sim", "Aprimorar a comunicação e expressar ideias com clareza.", 2),
("Design Gráfico para Iniciantes", 50, 550.00, "sim", "Básico de design gráfico, ferramentas e fundamentos criativos.", 6),
("Inteligência Emocional no Trabalho", 15, 100.00, "não", "Melhora o controle emocional e a inteligência emocional no ambiente de trabalho.", 8),
("Curso de Cozinha Criativa", 30, 350.00, "sim", "Aprendendo receitas criativas e inovadoras.", 9);

-- Visualizar todos os dados da tabela tb_cursos;
SELECT id, nome, carga_horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, disponibilidade, descricao, categoria_id
FROM tb_cursos;

-- Visualizar somente os cursos com preços maior que R$ 500,00
SELECT id, nome, carga_horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, disponibilidade, descricao, categoria_id
FROM tb_cursos WHERE preco > 500.00;

-- Visualizar somente os cursos com preços entre R$ 600,00 e R$ 1000,00
SELECT id, nome, carga_horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, disponibilidade, descricao, categoria_id
FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00; -- entre (valor_inicial and valor_final)

-- Visualizar somente os cursos com a carga_horaria entre 20 e 40 horas
SELECT id, nome, carga_horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, disponibilidade, descricao, categoria_id
FROM tb_cursos WHERE carga_horaria BETWEEN 20 AND 40; -- entre (valor_inicial and valor_final)

-- Visualizar somente os cursos que possuam a letra J no atributo nome
SELECT id, nome, carga_horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, disponibilidade, descricao, categoria_id
FROM tb_cursos WHERE nome LIKE '%J%';

-- Visualizar os cursos por ordem alfabética
SELECT id, nome, carga_horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco, disponibilidade, descricao, categoria_id
FROM tb_cursos ORDER BY nome;

-- Visualizar combinando os dados da tb_cursos e da tb_categorias
-- Informando a tabela antes do atributo (tb_cursos.id) p/ ñ ter conflito de atributo nas tabelas
SELECT tb_cursos.id AS Id_Curso,
tb_cursos.nome AS Nome_Curso,
tb_cursos.carga_horaria AS Carga_Horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco,
tb_cursos.disponibilidade AS Disponibilidade,
tb_cursos.descricao AS Descricao,
tb_categorias.nome AS Nome_Categoria
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id;

-- Visualizar somente os cursos que pertencem a categoria 'Tecnologia'
SELECT tb_cursos.id AS Id_Curso,
tb_cursos.nome AS Nome_Curso,
tb_cursos.carga_horaria AS Carga_Horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco,
tb_cursos.disponibilidade AS Disponibilidade,
tb_cursos.descricao AS Descricao,
tb_categorias.nome AS Nome_Categoria
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id
WHERE tb_categorias.nome = 'Tecnologia';

-- Visualizar combinando os dados da tb_cursos e da tb_categorias, ordenando pelo tipo da categoria
SELECT tb_cursos.id AS Id_Curso,
tb_cursos.nome AS Nome_Curso,
tb_cursos.carga_horaria AS Carga_Horaria,
concat('R$ ', FORMAT(preco, 2, 'pt-BR')) AS Preco,
tb_cursos.disponibilidade AS Disponibilidade,
tb_cursos.descricao AS Descricao,
tb_categorias.tipo AS Nome_Categoria
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id ORDER BY tb_categorias.tipo DESC;

-- Visualizar categoria_id e calcular a média de preço de cada categoria
SELECT tb_cursos.categoria_id,
tb_categorias.nome AS nome_categoria,
CONCAT('R$ ', FORMAT(AVG(tb_cursos.preco), 2, 'pt-BR')) AS media_preco
FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.categoria_id = tb_categorias.id
GROUP BY tb_cursos.categoria_id, tb_categorias.nome;