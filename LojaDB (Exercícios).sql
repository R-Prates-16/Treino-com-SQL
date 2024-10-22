
-- Criando o banco de dados chamado LojaDB
CREATE DATABASE LojaDB;

-- Usando o banco de dados LojaDB para as próximas operações
USE LojaDB;
-- Criando a tabela Clientes que armazena os dados dos clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,  -- ClienteID é a chave primária, ou seja, identifica unicamente cada cliente
    NomeCliente VARCHAR(100),   -- Nome do cliente, armazenado como uma string de até 100 caracteres
    Cidade VARCHAR(50)          -- Cidade onde o cliente mora, armazenado como uma string de até 50 caracteres
);

-- Criando a tabela Pedidos que armazena os pedidos feitos pelos clientes
USE LojaDB;
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,   -- PedidoID é a chave primária, identificando unicamente cada pedido
    ClienteID INT,              -- ClienteID é uma chave estrangeira, associando cada pedido a um cliente
    DataPedido DATE,            -- Data do pedido, armazenada como um valor de data
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)  -- ClienteID é uma chave estrangeira que referencia a chave primária da tabela Clientes
);


-- Criando a tabela Produtos que armazena os dados dos produtos disponíveis
USE LojaDB;
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,  -- ProdutoID é a chave primária, identificando unicamente cada produto
    NomeProduto VARCHAR(100),   -- Nome do produto
    CategoriaID INT,            -- CategoriaID é uma chave estrangeira que referencia a tabela Categorias
    Preco DECIMAL(10, 2)        -- Preço do produto, com até 10 dígitos no total e 2 casas decimais
);



-- Criando a tabela Categorias que armazena as categorias dos produtos
USE LojaDB;
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,  -- CategoriaID é a chave primária, identificando unicamente cada categoria
    NomeCategoria VARCHAR(100)    -- Nome da categoria
);


-- Inserindo clientes na tabela Clientes
INSERT INTO Clientes (ClienteID, NomeCliente, Cidade) VALUES
(1, 'Maria Silva', 'São Paulo'),  -- Cliente com ID 1
(2, 'João Santos', 'Rio de Janeiro'),  -- Cliente com ID 2
(3, 'Ana Costa', 'Belo Horizonte');  -- Cliente com ID 3



-- Inserindo pedidos na tabela Pedidos
INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido) VALUES
(1, 1, '2024-01-15'),  -- Pedido ID 1 feito pelo cliente com ID 1 (Maria Silva)
(2, 2, '2024-01-20'),  -- Pedido ID 2 feito pelo cliente com ID 2 (João Santos)
(3, 1, '2024-02-10');  -- Pedido ID 3 feito pelo cliente com ID 1 (Maria Silva)



-- Inserindo categorias na tabela Categorias
INSERT INTO Categorias (CategoriaID, NomeCategoria) VALUES
(1, 'Eletrônicos'),  -- Categoria com ID 1
(2, 'Vestuário');    -- Categoria com ID 2



-- Inserindo produtos na tabela Produtos
INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, Preco) VALUES
(1, 'Celular', 1, 1500.00),     -- Produto Celular, pertence à categoria Eletrônicos
(2, 'Televisão', 1, 3000.00),   -- Produto Televisão, pertence à categoria Eletrônicos
(3, 'Camiseta', 2, 50.00);      -- Produto Camiseta, pertence à categoria Vestuário










--1)
SELECT
NomeCliente,
PedidoID,
DataPedido

FROM dbo.Clientes

INNER JOIN dbo.Pedidos
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID
ORDER BY DataPedido


--2)
SELECT
NomeCliente,
Cidade,
PedidoID

FROM dbo.Clientes  

LEFT JOIN dbo.Pedidos
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID

WHERE dbo.Pedidos.PedidoID IS NOT NULL


--3)
SELECT DISTINCT
NomeCliente,
Cidade

FROM dbo.Clientes
UNION
SELECT
dbo.Clientes.NomeCliente,
dbo.Clientes.Cidade

FROM dbo.Pedidos 
INNER JOIN dbo.Clientes
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID


--4)
SELECT*

FROM dbo.Clientes
UNION
SELECT*

FROM dbo.Pedidos 
INNER JOIN dbo.Clientes
ON dbo.Clientes.ClienteID = dbo.Pedidos.ClienteID












