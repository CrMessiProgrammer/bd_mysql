-- Criar Banco de Dados
CREATE DATABASE db_generation_game_online;

-- Acessar (Selecionar) o Banco de Dados
USE db_generation_game_online;

-- Criar Tabela
CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT,
    PRIMARY KEY(id)
);

-- Inserir dados na tabela (1ºteste)
INSERT INTO tb_classes(tipo, descricao)
VALUES ("normal", "Classe básica de pokémon, sem afinidade específica.");

-- Inserir mais dados na tabela
INSERT INTO tb_classes(tipo, descricao)
VALUES ("fogo", "Pokémon com habilidades relacionadas ao fogo."),
("água", "Pokémon com habilidades relacionadas à água."),
("grama", "Pokémon que utiliza a natureza e plantas."),
("voador", "Pokémon com habilidade de voo, geralmente leves e rápidos."),
("lutador", "Pokémon com habilidades de combate corpo a corpo."),
("veneno", "Pokémon que utiliza veneno como sua principal arma."),
("elétrico", "Pokémon com habilidades baseadas em eletricidade."),
("terra", "Pokémon com afinidade com o solo e rochas."),
("pedra", "Pokémon com resistência e habilidades ligadas a pedras e minerais."),
("psíquico", "Pokémon com habilidades mentais, como telecinese e leitura mental."),
("gelo", "Pokémon com poderes relacionados ao gelo e frio."),
("inseto", "Pokémon com características de insetos."),
("fantasma", "Pokémon espirituais, muitas vezes invisíveis."),
("aço", "Pokémon com habilidades relacionadas ao ferro e metal."),
("dragão", "Pokémon poderosos com habilidades místicas e raras."),
("sombrio", "Pokémon com afinação à escuridão e sombras."),
("fada", "Pokémon com habilidades encantadoras e mágicas.");

-- Visualizar todos os dados da tabela tb_classes
SELECT * FROM tb_classes;

-- Criar Tabela
CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    regiao VARCHAR(50),
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    stamina INT NOT NULL,
    evolui ENUM('sim', 'não'),
    lendario ENUM('sim', 'não'),
    classe_id BIGINT,
    PRIMARY KEY(id),
    FOREIGN KEY(classe_id) REFERENCES tb_classes(id)
);

-- Inserir dados na tabela (1ºteste)
INSERT INTO tb_personagens(nome, regiao, ataque, defesa, stamina, evolui, lendario, classe_id)
VALUES ("Pikachu", "Kanto", 1120, 960, 1110, "sim", "não", 8);  -- Electric

-- Inserir mais dados na tabela
INSERT INTO tb_personagens(nome, regiao, ataque, defesa, stamina, evolui, lendario, classe_id)
VALUES ("Regidrago", "Galar", 2020, 1010, 4000, "não", "não", 13),  -- Dragon
("Charmander", "Kanto", 1160, 930, 1180, "sim", "não", 2),  -- Fire
("Raikou", "Johto", 2410, 1950, 2070, "não", "sim", 8),  -- Electric
("Squirtle", "Kanto", 940, 1210, 1270, "sim", "não", 3),  -- Water
("Tornadus - Incarnate", "Unova", 2660, 1640, 1880, "não", "sim", 5),  -- Flying
("Mewtwo", "Kanto", 3000, 1820, 2140, "não", "sim", 11), -- Psychic
("Cresselia", "Sinnoh", 1520, 2580, 2600, "não", "sim", 11),  -- Psychic
("Snorlax", "Kanto", 1900, 1690, 3300, "não", "não", 1),  -- Normal
("Popplio", "Alola", 1200, 1030, 1370, "sim", "não", 3);  -- Water

-- Visualizar todos os dados da tabela tb_personagens
SELECT * FROM tb_personagens;

-- Visualizar somente os personagens com ataque maior que 2000
SELECT * FROM tb_personagens WHERE ataque > 2000;

-- Visualizar somente os personagens lendários
SELECT * FROM tb_personagens WHERE lendario = 'sim';

-- Visualizar somente os personagens com a defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

-- Visualizar somente os personagens que possuam a letra C no atributo nome
SELECT id, nome, regiao, classe_id
FROM tb_personagens WHERE nome LIKE '%C%';

-- Visualizar os personagens de acordo com o ataque em ordem decrescente (do maior para o menor)
SELECT * FROM tb_personagens ORDER BY ataque DESC;

-- Visualizar combinando os dados da tb_personagens e da tb_classes
-- Informando a tabela antes do atributo (tb_personagens.id) p/ ñ ter conflito de atributo nas tabelas
SELECT tb_personagens.id AS Id_Personagem,
tb_personagens.nome AS Nome_Personagem,
tb_personagens.regiao AS Regiao,
tb_personagens.ataque AS Ataque,
tb_personagens.defesa AS Defesa,
tb_personagens.stamina AS Stamina,
tb_personagens.classe_id AS Id_classe,
tb_classes.tipo AS Tipo_Classe
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id;

-- Visualizar somente os personagens que pertencem a classes 'psíquico'
SELECT tb_personagens.classe_id AS Id_classe,
tb_classes.tipo AS Tipo_Classe,
tb_personagens.id AS Id_Personagem,
tb_personagens.nome AS Nome_Personagem,
tb_personagens.regiao AS Regiao,
tb_personagens.ataque AS Ataque,
tb_personagens.defesa AS Defesa,
tb_personagens.stamina AS Stamina
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
WHERE tb_classes.tipo = 'psíquico';

-- Visualizar classe_id e calcular a média de preço de cada classe
SELECT tb_personagens.classe_id,
tb_classes.tipo AS Tipo_Classe,
floor(AVG(tb_personagens.ataque)) AS media_ataque  -- floor arredonda
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
GROUP BY tb_personagens.classe_id, tb_classes.tipo;

-- Visualizar classe_id e media_ataque, mostrando na ordem decrescente (do maior para o menor)
SELECT tb_personagens.classe_id,
tb_classes.tipo AS Tipo_Classe,
floor(AVG(tb_personagens.ataque)) AS media_ataque  -- floor arredonda
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classe_id = tb_classes.id
GROUP BY tb_personagens.classe_id, tb_classes.tipo ORDER BY AVG(tb_personagens.ataque) DESC;