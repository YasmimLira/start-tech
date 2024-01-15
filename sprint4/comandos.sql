-- Criar banco de dados "starttech"
CREATE DATABASE starttech;
USE starttech;

-- Criar tabela "Pedidos"
CREATE TABLE Pedidos (
    id bigint,
    produto varchar(255),
    categoria varchar(255),
    preco decimal(10,2),
    quantidade integer,
    data_pedido date,
    cliente varchar(60)
);

-- Adicionar chave primária à tabela "Pedidos"
ALTER TABLE Pedidos ADD PRIMARY KEY (id);

-- Inserir dados na tabela "Pedidos"
INSERT INTO `starttech`.`pedidos`
(`id`, `produto`, `categoria`, `preco`, `quantidade`, `data_pedido`, `cliente`)
VALUES
(1, "Notebook Samsung", "INFORMÁTICA", 3523.00, 1, "2022/01/01", "ANA"),
(2, "Sofá 3 lugares", "MÓVEIS", 2500.00, 1, "2022/01/05", "ANA"),
(3, "Clean Architecture", "LIVROS", 102.90, 2, "2022/01/08", "ANA"),
(3, "Clean Architecture", "LIVROS", 102.90, 2, "2022/01/08", "ANA"),
(4, "Mesa de jantar 6 lugares", "MÓVEIS", 3678.98, 1, "2022/01/06", "ELI"),
(5, "iPhone 13 Pro", "CELULARES", 9176.00, 6, "2022/01/13", "ANA"),
(6, "Monitor Dell 27", "INFORMÁTICA", 1889.00, 3, "2022/01/04", "DANI"),
(7, "Implementing Domain-Driven Design", "LIVROS", 144.07, 3, "2022/01/10", "GABI"),
(8, "Jogo de pneu", "AUTOMOTIVA", 1276.79, 1, "2022/01/15", "BIA"),
(9, "Clean Code", "LIVROS", 95.17, 1, "2022/01/09", "BIA"),
(10, "Galaxy S22 Ultra", "CELULARES", 8549.10, 5, "2022/01/14", "DANI"),
(11, "Macbook Pro 16", "INFORMÁTICA", 31752.00, 1, "2022/01/03", "CAIO"),
(12, "Refactoring Improving the Design of Existing Code", "LIVROS", 173.90, 1, "2022/01/12", "DANI"),
(13, "Cama queen size", "MÓVEIS", 3100.00, 2, "2022/01/07", "DANI"),
(14, "Central multimidia", "AUTOMOTIVA", 711.18, 1, "2022/01/16", "CAIO"),
(15, "Building Microservices", "LIVROS", 300.28, 2, "2022/01/11", "CAIO"),
(16, "Galaxy Tab S8", "INFORMÁTICA", 5939.10, 4, "2022/01/02", "BIA");

-- Atualizar categoria 'INFO' para 'INFORMÁTICA'
UPDATE Pedidos SET categoria = 'INFORMÁTICA' WHERE categoria = 'INFO';

-- Listar todos os pedidos
SELECT * FROM Pedidos;

-- Listar pedidos da categoria 'CELULARES'
SELECT * FROM Pedidos WHERE categoria = 'CELULARES';

-- Listar pedidos com preço entre R$ 3.000,00 e R$ 10.000,00
SELECT * FROM Pedidos WHERE preco BETWEEN 3000.00 AND 10000.00;

-- Remover pedidos com quantidade igual a 1 e feitos pela cliente 'BIA'
DELETE FROM Pedidos WHERE quantidade = 1 AND cliente = 'BIA';
