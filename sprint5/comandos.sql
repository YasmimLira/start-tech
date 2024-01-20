CREATE DATABASE comex;

use comex;

CREATE TABLE categoria (
	id bigint auto_increment primary key,
    nome varchar(100)
);

CREATE TABLE produto (
	id bigint auto_increment primary key,
    nome varchar(255),
    preco decimal(10, 2),
    categoria_id bigint,
    foreign key(categoria_id) references categoria(id)
); 

CREATE TABLE cliente (
	id bigint auto_increment primary key,
    nome varchar(255)
);

CREATE TABLE pedido (
	id bigint auto_increment primary key,
    data date,
    cliente_id bigint,
    foreign key(cliente_id) references cliente(id)
);

CREATE TABLE item_pedido (
	id bigint auto_increment primary key,
    pedido_id bigint,
    produto_id bigint,
    preco_unitario decimal(10,2),
    quantidade integer,
    foreign key(pedido_id) references pedido(id),
    foreign key(produto_id) references produto(id)
);

INSERT INTO comex.categoria
(nome)
VALUES
("INFO"),
("MÓVEIS"),
("LIVROS"),
("CELULARES"),
("AUTOMOTIVA");

INSERT INTO comex.cliente
(nome)
VALUES
("ANA"),
("ELI"),
("DANI"),
("GABI"),
("BIA"),
("CAIO");

INSERT INTO comex.produto (nome, preco, categoria_id)
VALUES
("Notebook Samsung", 3523.00, 1),
("Sofá 3 lugares", 2500.00, 2),
("Clean Architecture", 102.90, 3),
("Mesa de jantar 6 lugares", 3678.98, 2),
("iPhone 13 Pro", 9176.00, 4),
("Monitor Dell 27", 1889.00, 1),
("Implementing Domain-Driven Design", 144.07, 3),
("Jogo de pneu", 1276.79, 5),
("Clean Code", 95.17, 3),
("Galaxy S22 Ultra", 8549.10, 4),
("Macbook Pro 16", 31752.00, 1),
("Refactoring Improving the Design of Existing Code", 173.90, 3),
("Cama queen size", 3100.00, 2),
("Central multimidia", 711.18, 5),
("Building Microservices", 300.28, 3),
("Galaxy Tab S8", 5939.10, 1);


INSERT INTO comex.pedido (data, cliente_id)
VALUES
("2022/01/01", 1),  -- Cliente "ANA"
("2022/01/05", 1),  -- Cliente "ANA"
("2022/01/08", 1),  -- Cliente "ANA"
("2022/01/06", 2),  -- Cliente "ELI"
("2022/01/13", 1),  -- Cliente "ANA"
("2022/01/04", 3),  -- Cliente "DANI"
("2022/01/10", 4),  -- Cliente "GABI"
("2022/01/15", 5),  -- Cliente "BIA"
("2022/01/09", 5),  -- Cliente "BIA"
("2022/01/14", 3),  -- Cliente "DANI"
("2022/01/03", 6),  -- Cliente "CAIO"
("2022/01/12", 3),  -- Cliente "DANI"
("2022/01/07", 3),  -- Cliente "DANI"
("2022/01/16", 6),  -- Cliente "CAIO"
("2022/01/11", 6),  -- Cliente "CAIO"
("2022/01/02", 5);  -- Cliente "BIA"

INSERT INTO comex.item_pedido 
(quantidade, preco_unitario, pedido_id, produto_id) 
VALUES 
(1, 3523.00, 1, 1), 
(1, 2500.00, 2, 2), 
(2, 102.90, 3, 3), 
(1, 3678.98, 4, 4), 
(6, 9176.00, 5, 5), 
(3, 1889.00, 6, 6), 
(3, 144.07, 7, 7), 
(1, 1276.79, 8, 8), 
(1, 95.17, 9, 9), 
(5, 8549.10, 10, 10), 
(1, 31752.00, 11, 11), 
(1, 173.90, 12, 12), 
(2, 3100.00, 13, 13), 
(1, 711.18, 14, 14), 
(2, 300.28, 15, 15), 
(4, 5939.10, 16, 16);

SELECT 
cliente.nome AS cliente, 
categoria.nome AS categorias, 
produto.nome AS produto, 
item_pedido.preco_unitario AS preco_unitario, 
item_pedido.quantidade AS quantidade, 
pedido.data AS data
FROM 
categoria 
INNER JOIN produto ON categoria.id = produto.categoria_id 
INNER JOIN item_pedido ON produto.id = item_pedido.produto_id
INNER JOIN pedido ON item_pedido.pedido_id = pedido.id
INNER JOIN cliente ON pedido.cliente_id = cliente.id 
ORDER BY cliente;

SELECT categoria.nome AS nome, 
SUM(item_pedido.preco_unitario * item_pedido.quantidade) AS total
FROM categoria
INNER JOIN produto ON categoria.id = produto.categoria_id
INNER JOIN item_pedido ON produto.id = item_pedido.produto_id
GROUP BY categoria.id, categoria.nome;

SELECT 
COUNT(distinct pedido.id) AS pedidos_realizados,
SUM(item_pedido.quantidade) AS produtos_vendidos,
MIN(item_pedido.preco_unitario * item_pedido.quantidade) AS pedido_mais_barato,
MAX(item_pedido.preco_unitario * item_pedido.quantidade) AS pedido_mais_caro,
SUM(item_pedido.preco_unitario * item_pedido.quantidade) AS montante_vendido
FROM
pedido
INNER JOIN item_pedido ON pedido.id = item_pedido.pedido_id;

SELECT
  cliente.nome AS nome,
  COUNT(pedido.id) AS quantidade
FROM
  cliente
LEFT JOIN pedido ON cliente.id = pedido.cliente_id
GROUP BY cliente.id, cliente.nome
ORDER BY quantidade DESC;

