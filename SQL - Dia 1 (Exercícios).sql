--1-A)
--A quantidade de produtos continuou o mesmo 
--SELECT TOP (100) PERCENT 
ProductName   
  
--FROM DimProduct;

--1-B)
--A quantidade de clientes diminuiu
--SELECT 
  FirstName
  
--FROM DimCustomer;

--2- A)
--Todos os requisitos pedidos foram selecionados
--SELECT 
  CustomerKey, FirstName, EmailAddress, BirthDate
  
--FROM DimCustomer

--2-B)
--Todos os nomes das colunas foram trocados
--SELECT
--CustomerKey AS 'ID Cliente', 
--FirstName AS 'Primeiro Nome',
--EmailAddress AS 'Email do Cliente',
--BirthDate AS 'Data de Aniversário'
  
--FROM DimCustomer

--3-A)
--Selecionei as 100 primeiras linhas da tabela 
--SELECT TOP(100) *
  
--FROM DimCustomer

--3-B)
--Selecionei 20% da história da tabela
--SELECT TOP(20) PERCENT * 
  
--FROM DimCustomer

--3-C)
--Selecionei as 100 primeiras linhas das tabelas da respectivas colunas abaixo
--SELECT TOP(100)
FirstName, EmailAddress, BirthDate

--FROM DimCustomer

--3-D)
-- Renomiei as colunas indicadas abaixo
--SELECT
--FirstName AS 'Primeiro Nome',
--EmailAddress AS 'Email do Cliente',
--BirthDate AS 'Data de Aniversário'

--FROM DimCustomer

--4) Como não foi possível achar a coluna fornecedor, utilizei a coluna 'Manufacturer' como exemplo
--SELECT
--Manufacturer AS Fornecedor

--FROM DimProduct

--5) 
--Significa que não vendeu um produto
--SELECT *

--FROM DimProduct

--SELECT *

--FROM FactSales
